class User < ApplicationRecord
  include Messageable

  has_many :posted_jobs, :class_name => "Job", foreign_key: "family_id"
  has_many :assignments, :class_name => "Job", foreign_key: "sitter_id"
  has_many :sent_messages, :class_name => "Message", foreign_key: "user_id"
  has_many :received_messages, :class_name => "Message", foreign_key: "recipient_id"
  has_many :conversations

  enum role: { manager: 0, family: 1, nanny: 2 }

  mount_uploader :picture, PictureUploader

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  before_save :capitalize_county
  before_save :upcase_state

  VALID_STATE_REGEX = /[A-Z]{2}/i
  VALID_ZIP_REGEX = /\d{5}/
  VALID_BIRTHDAY_REGEX = /\d{2}[\/]\d{2}[\/]\d{4}/
  VALID_RATE_REGEX = /\A\d+([.]\d{0,2})?\z/
  VALID_PHONE_REGEX = /\(*\+*[1-9]{0,3}\)*-*[1-9]{0,3}[-. \/]*\(*[2-9]\d{2}\)*[-. \/]*\d{3}[-. \/]*\d{4} *e*x*t*\.* *\d{0,4}/

  validates_presence_of :first_name, :last_name, :email, :street, :city, :county

  validates :state, presence: true, length: { maximum: 2},
                    format: { with: VALID_STATE_REGEX }
  validates :zip_code, presence: true, format: { with: VALID_ZIP_REGEX }
  validates :birthday, allow_nil: true, format: { with: VALID_BIRTHDAY_REGEX }
  validates :hourly_rate, allow_nil: true, format: { with: VALID_RATE_REGEX }
  validates :phone_number, presence: true, format: { with: VALID_PHONE_REGEX }
  validate :picture_size

  def self.get_active_sitters
    response = User.nanny.where(is_deleted: false, active: true).order(created_at: :desc).all

    @sitters = []
    @sitter_data = {}
    @all_counties = []

    response.each do |sitter|
      @sitter_data = {"sitter_id" => sitter.id, "first_name" => sitter.first_name,
                      "last_name" => sitter.last_name, "email" => sitter.email,
                      "phone" => sitter.phone_number, "birthday" => sitter.birthday,
                      "hourly_rate" => sitter.hourly_rate,
                      "cpr_certification" => sitter.cpr_certification,
                      "first_aid_certification" => sitter.first_aid_certification,
                      "street" => sitter.street, "city" => sitter.city,
                      "state" => sitter.state, "zip_code" => sitter.zip_code,
                      "county" => sitter.county, "active" => sitter.active,
                      "is_deleted" => sitter.is_deleted,
                      "recommendation_one_name" => sitter.recommendation_one_name,
                      "recommendation_one_email" => sitter.recommendation_one_email,
                      "recommendation_two_name" => sitter.recommendation_two_name,
                      "recommendation_two_email" => sitter.recommendation_two_email,
                      "recommendation_three_name" => sitter.recommendation_three_name,
                      "recommendation_three_email" => sitter.recommendation_three_email,
                      "joined" => sitter.created_at
                    }

      if sitter.picture.model["picture"]
        @sitter_data["picture_url"] = "#{sitter.picture}"
      end

      @all_counties << sitter.county

      @sitters << @sitter_data
    end

    @counties = @all_counties.uniq

    @data = { "sitters" => @sitters, "counties" => @counties}

    return @data
  end

  def self.get_sitter(options)
    sitter = User.find(options)

    @sitter = {"sitter_id" => sitter.id, "first_name" => sitter.first_name,
                    "last_name" => sitter.last_name, "email" => sitter.email,
                    "phone" => sitter.phone_number, "birthday" => sitter.birthday,
                    "hourly_rate" => sitter.hourly_rate,
                    "cpr_certification" => sitter.cpr_certification,
                    "first_aid_certification" => sitter.first_aid_certification,
                    "street" => sitter.street, "city" => sitter.city,
                    "state" => sitter.state, "zip_code" => sitter.zip_code,
                    "county" => sitter.county,
                    "recommendation_one_name" => sitter.recommendation_one_name,
                    "recommendation_one_email" => sitter.recommendation_one_email,
                    "recommendation_two_name" => sitter.recommendation_two_name,
                    "recommendation_two_email" => sitter.recommendation_two_email,
                    "recommendation_three_name" => sitter.recommendation_three_name,
                    "recommendation_three_email" => sitter.recommendation_three_email,
                    "joined" => sitter.created_at
                  }

    if sitter.picture.model["picture"]
      @sitter["picture_url"] = "#{sitter.picture}"
    end
  end

  def self.get_approved_families
    response = User.family.where( { is_deleted: false, approved: true, active: true } ).all

    @families = []
    @family_data = {}
    @all_counties = []

    response.each do |family|
      @family_data = {"family_id" => family.id, "first_name" => family.first_name,
                      "last_name" => family.last_name, "email" => family.email,
                      "phone" => family.phone_number, "county" => family.county,
                      "about" => family.about, "active" => family.active,
                    }

      if family.picture.model["picture"]
        @family_data["picture_url"] = "#{family.picture}"
      end

      @all_counties << family.county

      @families << @family_data
    end

    @counties = @all_counties.uniq

    @data = { "families" => @families, "counties" => @counties}

    return @data
  end

  def self.get_approved_families_count
    @approved_families = User.family.where( { is_deleted: false, approved: true, active: true } ).all.count
  end

  def self.get_family(options)
    family = User.find(options)

    @family = {"family_id" => family.id, "first_name" => family.first_name,
                    "last_name" => family.last_name, "email" => family.email,
                    "phone" => family.phone_number, "street" => family.street,
                    "city" => family.city, "state" => family.state,
                    "zip_code" => family.zip_code, "county" => family.county,
                    "about" => family.about, "active" => family.active,
                  }

    if family.picture.model["picture"]
      @family["picture_url"] = "#{family.picture}"
    end

    return @family
  end

  def self.get_new_applicants
    @all_applicants = User.family.where({ active: true, approved: false }).or(User.nanny.where({ active: true, approved: false }))
    @five_applicants = @all_applicants.order(created_at: :asc).limit(5)

    @new_applicants = []
    @application_data = {}

    @five_applicants.each do |application|
      name = "#{application.first_name} #{application.last_name}"
      @application_data = { "application_id" => application.id, "name" => name,
                           "role" => application.role,
                           "submitted" => application.created_at.strftime("%m/%d/%Y %I:%M %p")
                         }

       if application.picture.model["picture"]
         @application_data["picture_url"] = "#{application.picture}"
       end

       @new_applicants << @application_data
    end

    @new_applicants

  end

  def self.get_pending_sitter_count
    pending_sitter_count = User.nanny.where( {active: false, is_deleted: false, approved: false} ).all.count

    if pending_sitter_count == 0
      return 0
    else
      return pending_sitter_count
    end

  end

  def self.get_pending_family_count
    pending_family_count = User.family.where( {active: true, is_deleted: false, approved: false} ).all.count

    if pending_family_count == 0
      return 0
    else
      return pending_family_count
    end

  end

  def self.get_application(options)
    response = User.find(options)
  end

  def self.get_pending_sitters
    pending_sitters = User.nanny.where( { active: false, is_deleted: false, approved: false } ).order(created_at: :asc).all

    @all_counties = []

    pending_sitters.each do |sitter|
      @all_counties << sitter.county
    end

    @counties = @all_counties.uniq

    @data = { "sitters" => pending_sitters, "counties" => @counties}
  end

  def self.get_pending_families
    pending_families = User.family.where( { active: true, is_deleted: false, approved: false } ).order(created_at: :asc).all

    @all_counties = []

    pending_families.each do |family|
      @all_counties << family.county
    end

    @counties = @all_counties.uniq

    @data = { "families" => pending_families, "counties" => @counties}
  end

  def self.get_recipients
    possible_recipients = User.where(is_deleted: false).order(first_name: :asc).all

    @all_recipients = []
    @recipient_data = {}

    possible_recipients.each do |user|
      full_name = "#{user.first_name} #{user.last_name}"
      @recipient_data = { "id" => user.id,
                          "name" => full_name, "role" => user.role}

      if user.picture.model["picture"]
        @recipient_data["picture_url"] = "#{user.picture}"
      end

      @all_recipients << @recipient_data
    end

    return @all_recipients

  end

  def self.get_available_sitters
    sitters = User.nanny.where( { is_deleted: false, active: true, approved: true  }).order(created_at: :asc).all

    @available_sitters = []
    @all_counties = []
    @data = {}

    sitters.each do |sitter|
      full_name = "#{sitter.first_name} #{sitter.last_name}"
      @sitter_data = { "approved" => sitter.approved,
                              "sitter_id" => sitter.id, "first_name" => sitter.first_name,
                              "last_name" => sitter.last_name, "email" => sitter.email,
                              "phone" => sitter.phone_number, "birthday" => sitter.birthday,
                              "hourly_rate" => sitter.hourly_rate,
                              "cpr_certification" => sitter.cpr_certification,
                              "first_aid_certification" => sitter.first_aid_certification,
                              "street" => sitter.street, "city" => sitter.city,
                              "state" => sitter.state, "zip_code" => sitter.zip_code,
                              "active" => sitter.active,
                              "is_deleted" => sitter.is_deleted,
                              "recommendation_one_name" => sitter.recommendation_one_name,
                              "recommendation_one_email" => sitter.recommendation_one_email,
                              "recommendation_two_name" => sitter.recommendation_two_name,
                              "recommendation_two_email" => sitter.recommendation_two_email,
                              "recommendation_three_name" => sitter.recommendation_three_name,
                              "recommendation_three_email" => sitter.recommendation_three_email,
                              "joined" => sitter.created_at}

        @available_sitters << @sitter_data

        @all_counties << sitter.county
      end

      @counties = @all_counties.uniq

      @data = { "sitters" => @available_sitters, "counties" => @counties}

      return @data
    end

  def self.get_available_sitters_count
    sitters = User.nanny.where( { is_deleted: false, active: true, approved: true  }).all.count
  end

  private

    def picture_size
      if picture.size > 5.megabytes
        errors.add(:picture, "should be less than 5MB")
      end
    end

    def capitalize_county
      self.county = county.capitalize
    end

    def upcase_state
      self.state = state.upcase
    end

end

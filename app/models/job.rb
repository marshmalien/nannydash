class Job < ApplicationRecord
  belongs_to :posted_job, :foreign_key => :family_id, class_name: 'User'
  belongs_to :assignment, :foreign_key => :sitter_id, class_name: 'User'

  def self.get_assigned_jobs
    response = Job.where(is_deleted: false).where(is_assigned: true).all

    @jobs = []

    response.each do |job|
      @jobs << { "job_id" => job.id, "family_id" => job.family_id,
                 "family_first_name" => job.posted_job.first_name,
                 "family_last_name" => job.posted_job.last_name,
                 "sitter_first_name" => job.assignment.first_name,
                 "sitter_last_name" => job.assignment.last_name,
                 "date" => job.date,
                 "start_time" => job.start_time.strftime("%I:%M %p"),
                 "end_time" => job.end_time.strftime("%I:%M %p"),
                 "confirmed" => job.confirmed,
                 "created" => job.created_at.strftime("%m/%d/%Y %I:%M %p")
               }
    end

    return @jobs
  end

  def self.get_new_jobs
    response = Job.where({is_deleted: false, is_assigned: false}).all

    @new_jobs = []

    response.each do |job|
      @new_jobs << { "job_id" => job.id, "family_id" => job.family_id,
                 "family_first_name" => job.posted_job.first_name,
                 "family_last_name" => job.posted_job.last_name,
                 "date" => job.date,
                 "start_time" => job.start_time.strftime("%I:%M %p"),
                 "end_time" => job.end_time.strftime("%I:%M %p"),
                 "notes" => job.notes,
                 "created" => job.created_at.strftime("%m/%d/%Y %I:%M %p")
               }
    end

    return @new_jobs
  end

  def self.get_five_newest_jobs
    @response = Job.where({confirmed: false, is_assigned: false}).order(created_at: :desc).limit(5)

    @newest_jobs = []

    @response.each do |job|
      name = "#{job.posted_job.first_name} #{job.posted_job.last_name}"
      date_time = "#{job.date} #{job.start_time.strftime("%I:%M %p")}"
      @newest_jobs << { "name" => name, "date_time" => date_time,
                        "submitted" => job.created_at.strftime("%m/%d/%Y %I:%M %p") }
    end

    return @newest_jobs
  end

  def self.get_five_open_jobs
    @response = Job.where({confirmed: true, is_assigned: true}).order(created_at: :desc).limit(5)

    @upcoming_jobs = []

    @response.each do |job|
      family_name = "#{job.posted_job.first_name} #{job.posted_job.last_name}"
      sitter_name = "#{job.assignment.first_name} #{job.assignment.last_name}"
      date_time = "#{job.date} #{job.start_time.strftime("%I:%M %p")}"
      @upcoming_jobs << { "name" => family_name, "sitter" => sitter_name,
                        "submitted" => job.created_at.strftime("%m/%d/%Y %I:%M %p") }
    end

    return @upcoming_jobs
  end

end

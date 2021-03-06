
User.create!(first_name: Faker::Name.first_name,
              last_name: Faker::Name.last_name,
              email: Faker::Internet.email,
              password: Faker::Internet.password(8),
              street: Faker::Address.street_address,
              city: Faker::Address.city,
              state: Faker::Address.state_abbr,
              zip_code: Faker::Address.zip_code,
              county: "Wake",
              role: 0,
              phone_number: '555-555-5555')

User.create!(first_name: Faker::Name.first_name,
              last_name: Faker::Name.last_name,
              email: Faker::Internet.email,
              password: Faker::Internet.password(8),
              street: Faker::Address.street_address,
              city: Faker::Address.city,
              state: Faker::Address.state_abbr,
              zip_code: Faker::Address.zip_code,
              county: "Wake",
              role: 2,
              birthday: "04/29/1990",
              hourly_rate: 12.50,
              cpr_certification: true,
              first_aid_certification: false,
              recommendation_one_name: Faker::Name.name,
              recommendation_one_email: Faker::Internet.email,
              recommendation_two_name: Faker::Name.name,
              recommendation_two_email: Faker::Internet.email,
              recommendation_three_name: Faker::Name.name,
              recommendation_three_email: Faker::Internet.email,
              phone_number: '555-555-5555')

User.create!(first_name: Faker::Name.first_name,
              last_name: Faker::Name.last_name,
              email: Faker::Internet.email,
              password: Faker::Internet.password(8),
              street: Faker::Address.street_address,
              city: Faker::Address.city,
              state: Faker::Address.state_abbr,
              zip_code: Faker::Address.zip_code,
              county: "Orange",
              role: 1,
              about: "I love my family!",
              phone_number: '555-555-5555')

User.create!(first_name: Faker::Name.first_name,
              last_name: Faker::Name.last_name,
              email: Faker::Internet.email,
              password: Faker::Internet.password(8),
              street: Faker::Address.street_address,
              city: Faker::Address.city,
              state: Faker::Address.state_abbr,
              zip_code: Faker::Address.zip_code,
              county: "Durham",
              role: 2,
              birthday: "12/20/1990",
              hourly_rate: 12.25,
              cpr_certification: true,
              first_aid_certification: false,
              recommendation_one_name: Faker::Name.name,
              recommendation_one_email: Faker::Internet.email,
              recommendation_two_name: Faker::Name.name,
              recommendation_two_email: Faker::Internet.email,
              recommendation_three_name: Faker::Name.name,
              recommendation_three_email: Faker::Internet.email,
              phone_number: '555-555-5555')


5.times do |index|
  User.create!(first_name: Faker::Name.first_name,
                  last_name: Faker::Name.last_name,
                  email: Faker::Internet.email,
                  password: Faker::Internet.password(8),
                  street: Faker::Address.street_address,
                  city: Faker::Address.city,
                  state: Faker::Address.state_abbr,
                  zip_code: Faker::Address.zip_code,
                  county: "Wake",
                  role: 1,
                  phone_number: '555-555-5555',
                  is_deleted: false,
                  active: false,
                  approved: false)
end

5.times do |index|
  User.create!(first_name: Faker::Name.first_name,
                  last_name: Faker::Name.last_name,
                  email: Faker::Internet.email,
                  password: Faker::Internet.password(8),
                  street: Faker::Address.street_address,
                  city: Faker::Address.city,
                  state: Faker::Address.state_abbr,
                  zip_code: Faker::Address.zip_code,
                  county: "Durham",
                  role: 1,
                  phone_number: '555-555-5555',
                  is_deleted: false,
                  active: true,
                  approved: false)
end

5.times do |index|
  User.create!(first_name: Faker::Name.first_name,
                  last_name: Faker::Name.last_name,
                  email: Faker::Internet.email,
                  password: Faker::Internet.password(8),
                  street: Faker::Address.street_address,
                  city: Faker::Address.city,
                  state: Faker::Address.state_abbr,
                  zip_code: Faker::Address.zip_code,
                  county: "Orange",
                  role: 1,
                  phone_number: '555-555-5555',
                  is_deleted: false,
                  active: true,
                  approved: true)
end

3.times do |index|
  User.create!(first_name: Faker::Name.first_name,
                    last_name: Faker::Name.last_name,
                    email: Faker::Internet.email,
                    password: Faker::Internet.password(8),
                    street: Faker::Address.street_address,
                    city: Faker::Address.city,
                    state: Faker::Address.state_abbr,
                    zip_code: Faker::Address.zip_code,
                    county: "Wake",
                    role: 2,
                    birthday: "04/20/1995",
                    hourly_rate: 13.00,
                    cpr_certification: true,
                    first_aid_certification: true,
                    recommendation_one_name: Faker::Name.name,
                    recommendation_one_email: Faker::Internet.email,
                    recommendation_two_name: Faker::Name.name,
                    recommendation_two_email: Faker::Internet.email,
                    recommendation_three_name: Faker::Name.name,
                    recommendation_three_email: Faker::Internet.email,
                    phone_number: '555-555-5555',
                    is_deleted: false,
                    active: false,
                    approved: false)
end

3.times do |index|
  User.create!(first_name: Faker::Name.first_name,
                    last_name: Faker::Name.last_name,
                    email: Faker::Internet.email,
                    password: Faker::Internet.password(8),
                    street: Faker::Address.street_address,
                    city: Faker::Address.city,
                    state: Faker::Address.state_abbr,
                    zip_code: Faker::Address.zip_code,
                    county: "Durham",
                    role: 2,
                    birthday: "05/20/1980",
                    hourly_rate: 18.00,
                    cpr_certification: false,
                    first_aid_certification: true,
                    recommendation_one_name: Faker::Name.name,
                    recommendation_one_email: Faker::Internet.email,
                    recommendation_two_name: Faker::Name.name,
                    recommendation_two_email: Faker::Internet.email,
                    recommendation_three_name: Faker::Name.name,
                    recommendation_three_email: Faker::Internet.email,
                    phone_number: '555-555-5555',
                    is_deleted: false,
                    active: true,
                    approved: false)
  end

3.times do |index|
  User.create!(first_name: Faker::Name.first_name,
                    last_name: Faker::Name.last_name,
                    email: Faker::Internet.email,
                    password: Faker::Internet.password(8),
                    street: Faker::Address.street_address,
                    city: Faker::Address.city,
                    state: Faker::Address.state_abbr,
                    zip_code: Faker::Address.zip_code,
                    county: "Orange",
                    role: 2,
                    birthday: "05/20/1990",
                    hourly_rate: 10.00,
                    cpr_certification: false,
                    first_aid_certification: false,
                    recommendation_one_name: Faker::Name.name,
                    recommendation_one_email: Faker::Internet.email,
                    recommendation_two_name: Faker::Name.name,
                    recommendation_two_email: Faker::Internet.email,
                    recommendation_three_name: Faker::Name.name,
                    recommendation_three_email: Faker::Internet.email,
                    phone_number: '555-555-5555',
                    is_deleted: false,
                    active: true,
                    approved: true)
  end

Job.create!(family_id: 3,
              sitter_id: 2,
              date: "2016-12-4",
              start_time: "12:00",
              end_time: "17:00",
              notes: "Charlie and Violet love when you craft with them!",
              confirmed: false,
              is_deleted: false,
              is_assigned: true)

Job.create!(family_id: 7,
              sitter_id: 2,
              date: "2016-12-15",
              start_time: "17:00",
              end_time: "23:00",
              notes: "None",
              confirmed: false,
              is_deleted: false,
              is_assigned: true)

Job.create!(family_id: 10,
              sitter_id: 2,
              date: "2017-01-15",
              start_time: "17:00",
              end_time: "23:00",
              notes: "None",
              confirmed: false,
              is_deleted: false,
              is_assigned: false)

Job.create!(family_id: 8,
              sitter_id: 23,
              date: '2017-1-03',
              start_time: Time.now,
              end_time: 3.hours.from_now,
              notes: "",
              confirmed: true,
              is_deleted: false,
              is_assigned: true)

Job.create!(family_id: 9,
              date: '2016-12-04',
              start_time: Time.now,
              end_time: 3.hours.from_now,
              notes: "",
              confirmed: false,
              is_deleted: false,
              is_assigned: false)

Job.create!(family_id: 10,
              date: "2016-12-03",
              start_time: Time.now,
              end_time: 3.hours.from_now,
              notes: "",
              confirmed: false,
              is_deleted: false,
              is_assigned: false)

Conversation.create!(subject: "Inquiry",
                     sender_id: 8,
                     recipient_id: 1)

Conversation.create!(subject: "Question about tonight",
                    sender_id: 25,
                    recipient_id: 3)

Conversation.create!(subject: "The kids though you were great!",
                     sender_id: 3,
                     recipient_id: 2)

Conversation.create!(subject: "Going on family vacation",
                    sender_id: 2,
                    recipient_id: 1)

Message.create!(body: "Should I update my hourly rate?",
                recipient_id: 1,
                subject: "Inquiry",
                user_id: 8,
                conversation_id: 1,
                is_read: false,
                is_deleted: false)

Message.create!(body: "Maybe when you've built up a few more months of experience!",
                recipient_id: 8,
                subject: "Inquiry",
                user_id: 1,
                conversation_id: 1,
                is_read: false,
                is_deleted: false)

Message.create!(body: "What will the kids need for dinner?",
                recipient_id: 3,
                subject: "Question about tonight",
                user_id: 25,
                conversation_id: 2,
                is_read: false,
                is_deleted: false)

Message.create!(subject: "The kids were great!",
                user_id: 2,
                recipient_id: 3,
                body: "Had such a good time hanging out with Violet and Charlie last night. Look forward to working with your family again soon!",
                conversation_id: 3,
                is_read: false,
                is_deleted: false)

Message.create!(subject: "Thanks",
                user_id: 3,
                recipient_id: 2,
                body: "The kids couldn't stop talking about the game you taught them. See you soon.",
                conversation_id: 3,
                is_read: false,
                is_deleted: false)

Message.create!(subject: "Going on family vacation",
                user_id: 2,
                recipient_id: 1,
                body: "Just FYI that I will be out of town Dec. 20-Jan. 5.",
                conversation_id: 4,
                is_read: false,
                is_deleted: false)

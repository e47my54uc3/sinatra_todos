require 'faker'


4.times do 
  Note.create( front: Faker::Lorem.sentence,
              back_info: Faker::Lorem.paragraph
      )
end
require 'faker'

# Defin a method to generate sample tracks
def generate_sample_tracks(count = 10)
  sample_tracks = []

  count.times do
    track = {
      name: Faker::Company.unique.name,            
      address: Faker::Address.full_address,        
      contact_number: Faker::PhoneNumber.phone_number,  
      main_image: "https://picsum.photos/800/600?random=#{rand(1..1000)}",
      length: Faker::Number.decimal(l_digits: 2),
      email: Faker::Internet.unique.email         
    }
    sample_tracks << track
  end

  sample_tracks
end

Track.create(generate_sample_tracks)

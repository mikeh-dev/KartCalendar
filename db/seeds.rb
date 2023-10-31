unless User.exists?(email: 'mikeh112@hotmail.com')
  User.create!(
    email: 'mikeh112@hotmail.com',
    password: ENV['ADMIN_PASSWORD'],
    admin: true,
    first_name: 'Mike',
    last_name: 'Howard'
  )
end

Track.destroy_all

track_data = [
  {
    name: 'Hooton Park',
    address: 'Hooton Park Airfield, West Rd, Hooton, Birkenhead, Ellesmere Port CH65 1BR',
    contact_number: '0151 355 7513',
    length: 876,
    email: 'mail@hootonparkcircuit.co.uk',
    description: 'Hooton Park Circuit was constructed in 2006 on the site of the old Hooton Airfield near Ellesmere Port. Corporate Karting was introducted in 2007 and has proved to be very popular, drivers being able to experience the thrills of motor racing without the high cost. Large groups visit the circuit for full corporate entertaining of staff and customers alike.
    Of course, owner drivers enjoy the use of a proper race circuit for testing, which is available most days.
    The circuit has the facility to hold A.R.K.S. examinations, should you want to progress to MSUK racing.',
    location: 'Cheshire',
    website: 'www.hootonparkcircuit.co.uk',
    short_desc: 'The Home of Cheshire Kart Racing Club',
    tagline: '',
    facilities: ['Cafe', 'Toilets', 'Overnight Camping', 'Parking', 'Arrive & Drive Karting'],
    social_media: { facebook: 'https://www.facebook.com/profile.php?id=100057041637287', instagram: 'https://www.instagram.com/hootonparkkarting/' },
    static_map_url: 'https://www.google.com/maps/embed?pb=!1m14!1m8!1m3!1d9535.354945862806!2d-2.9416328!3d53.3103343!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x487adefa53aa7143%3A0x2d37a59a97a86742!2sHooton%20Park%20Circuit!5e0!3m2!1sen!2suk!4v1697815886011!5m2!1sen!2suk'
  },
  {
    name: 'PFI - Paul Fletcher International',
    address: 'Stragglethorpe Ln, Brandon, Grantham NG32 2AY',
    contact_number: '01636 626747',
    length: 1382,
    email: 'kartpfi@gmail.com',
    description: 'PFi is the UK\'s largest outdoor karting circuit and caters for many different karting events. The UK\'s Premier Circuit provides track time for Rental and Owner Drivers. The circuit is open every day of the week, as well as weekends when there is not an MSA Race Meeting taking place at the circuit. PF International kart circuit was first opened in 1994 and was, and still is, the brain-child of Mr Paul Fletcher.  The circuit is located in the village of Brandon, close to Grantham, in the lovely Lincolnshire countryside.

    Over the years, PFi has developed and grown and is now recognised as the UK\’s premier Karting facility.
    During 2011, PFi saw perhaps it\’s largest transformation to date \– a track extension that incorporates a bridge with flyover!  
    
    This sensational new feature has increased the overall track length to 1382m and helped the circuit to secure it\’s International \‘A\’ grade track licence \– the only short circuit kart track in the UK to achieve this level.
    
     Attaining this grade of track licence has firmly placed PFi on the Global Karting scene and has helped to secure several CIK-FIA kart race events to date.',
    location: 'Grantham',
    website: 'www.kartpfi.com',
    short_desc: 'The UK\'s Finest Karting Circuit',
    tagline: '',
    facilities: ['Bar & Cafe', 'Toilets', 'Overnight Camping', 'Parking', 'Arrive & Drive Karting', 'Indoor Viewing Area', 'Showers', 'Kart Shop', 'Pit Bays for Hire', 'Digital Display Board', 'On Circuit CCTV' ],
    social_media: { facebook: 'https://www.facebook.com/kartpfi', instagram: 'https://www.instagram.com/pfikarting/' },
    static_map_url: 'https://www.google.com/maps/embed?pb=!1m14!1m8!1m3!1d9595.877661542745!2d-0.6599833!3d53.038887!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x4878362d729a50f1%3A0x738a765849950a00!2sPF%20International%20Kart%20Circuit!5e0!3m2!1sen!2suk!4v1698767265042!5m2!1sen!2suk',
    mobile: '07545 131099'
  }
]

track_data.each do |data|
  track = Track.create!(data)
  
  image_types = [:main_image, :logo, :race_image, :test_image, :champ_image, :contact_image]

  image_types.each do |type|
    file_path = Rails.root.join('db', 'seed_images', track.name, "#{type}.jpg")
    if File.exist?(file_path)
      track.send(type).attach(io: File.open(file_path), filename: "#{type}.jpg", content_type: 'image/jpg')
    else
      puts "Warning: #{file_path} does not exist. Skipping."
    end
  end
end

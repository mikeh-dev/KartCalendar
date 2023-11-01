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
    description: 'PFi is the UK\'s largest outdoor karting circuit and caters for many different karting events. The UK\'s Premier Circuit provides track time for Rental and Owner Drivers. The circuit is open every day of the week, as well as weekends when there is not an MSA Race Meeting taking place at the circuit. PF International kart circuit was first opened in 1994 and was, and still is, the brain-child of Mr Paul Fletcher.  The circuit is located in the village of Brandon, close to Grantham, in the lovely Lincolnshire countryside. Over the years, PFi has developed and grown and is now recognised as the UK\’s premier Karting facility. During 2011, PFi saw perhaps it\’s largest transformation to date \– a track extension that incorporates a bridge with flyover! This sensational new feature has increased the overall track length to 1382m and helped the circuit to secure it\’s International \‘A\’ grade track licence \– the only short circuit kart track in the UK to achieve this level. Attaining this grade of track licence has firmly placed PFi on the Global Karting scene and has helped to secure several CIK-FIA kart race events to date.',
    location: 'Grantham',
    website: 'www.kartpfi.com',
    short_desc: 'The UK\'s Finest Karting Circuit',
    tagline: '',
    facilities: ['Bar & Cafe', 'Toilets', 'Overnight Camping', 'Electric Hook Up', 'Parking', 'Arrive & Drive Karting', 'Indoor Viewing Area', 'Showers', 'Kart Shop', 'Pit Bays for Hire', 'Digital Timing Screen', 'On Circuit CCTV', 'Floodlights' ],
    social_media: { facebook: 'https://www.facebook.com/kartpfi', instagram: 'https://www.instagram.com/pfikarting/' },
    static_map_url: 'https://www.google.com/maps/embed?pb=!1m14!1m8!1m3!1d9595.877661542745!2d-0.6599833!3d53.038887!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x4878362d729a50f1%3A0x738a765849950a00!2sPF%20International%20Kart%20Circuit!5e0!3m2!1sen!2suk!4v1698767265042!5m2!1sen!2suk',
    mobile: '07545 131099'
  },
  {
    name: 'Whilton Mill',
    address: 'Whilton Locks, Whilton, Daventry, NN11 2NH',
    contact_number: '01327 843822',
    length: 1077,
    email: 'info@whiltonmill.co.uk',
    description: 'Specialists in outdoor activities since 1991; karting, quad bikes, clay shooting, archery and more. Our 100-acre site, set in the Northamptonshire countryside is an Historic mill on a vast estate with 2 karting tracks and best in industry hospitality facilties. Whilton Mill is home to the WMKC FastR Club Championship and boasts a full calendar of events throughout the year.',
    location: 'Daventry',
    website: 'www.whiltonmillkc.co.uk',
    short_desc: 'Home of FastR Championship',
    tagline: '',
    facilities: ['Bar & Cafe', 'Toilets', 'Overnight Camping', 'Electric Hook Up', 'Parking', 'Arrive & Drive Karting', 'Indoor Viewing Area', 'Showers', 'Kart Shop', 'Pit Bays for Hire', 'Floodlights' ],
    social_media: { facebook: 'https://www.facebook.com/WhiltonMillLtd', instagram: 'https://www.instagram.com/whiltonmillkartclub/' },
    static_map_url: 'https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d2441.206589865352!2d-1.0891450999999999!3d52.275951299999996!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x4877141b639e4695%3A0x47d41a4446091c2a!2sWhilton%20Mill%20Karting%20%26%20Outdoor%20Activities!5e0!3m2!1sen!2suk!4v1698776707177!5m2!1sen!2suk',
    mobile: ''
  },
  {
    name: 'Rissington',
    address: 'Cheltenham, GL54 2LR',
    contact_number: '0118 983 6070',
    length: 970,
    email: 'debbie@rissingtonkartclub.co.uk',
    description: 'Situated in the heart of the picturesque Cotswolds, the Little Rissington circuit offers superb high-speed racing under Motorsport UK rules for all major karting classes, from Cadets to the awesome 250 Gearbox karts. With its fast, wide sweeping bends, billiard smooth surface and big run-off areas makes it one of the best drivers’ circuits in the country.
    Rissington prides itself of being a friendly club, run by the members for the members. The club particularly encourages novices, families and visiting drivers. It is also possible to take your ARKS test at the track. We are located on the Little Rissington RAF Base. The postcode for the Airbase itself is GL54 2QB. Access to the circuit can be found on a small lane between Upper Rissington and Great Barrington. Look for large silver metal gates that show signs for the Glider Training.',
    location: 'Little Rissington',
    website: 'http://www.rissingtonkartclub.co.uk/',
    short_desc: 'Situated in the heart of the picturesque Cotswolds',
    tagline: '',
    facilities: ['Hot Food Available', 'Toilets', 'No Overnight Camping Currently', '£5 Parking Per Car on Race Day', 'Spares Shop', 'Pit Bays for Hire', 'Electric Hook Up' ],
    social_media: { facebook: 'https://facebook.com/officialrissikc', instagram: 'https://www.instagram.com/rissingtonkc/' },
    static_map_url: 'https://www.google.com/maps/embed?pb=!1m14!1m8!1m3!1d315274.9778407117!2d-1.653888!3d51.87764700000001!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x48712fc376e76cfb%3A0x11ea5becbc3a5057!2sGreat%20Rissington%2C%20Cheltenham%2C%20UK!5e0!3m2!1sen!2sus!4v1698784245535!5m2!1sen!2sus',
    mobile: ''
  },
  {
    name: 'Kimbolton',
    address: 'The Old Airfield, Huntingdon, United Kingdom, PE28 OHU',
    contact_number: '07730 786869',
    length: 989.5,
    email: 'info@hkrc.co.uk',
    description: 'Hunts Kart Racing Club (HKRC), or Kimbolton (or Kim as it’s affectionately known as!) was founded in 1959 by a group of karters who wanted somewhere to race their recently purchased karts.

    As the years went by, various changes and improvements were made to this circuit and during the late sixties and early seventies Kimbolton was the largest karting circuit in East Anglia and was a very popular circuit even then.
    
    Throughout the years Kim has been improved and extended. The present track was complete in the early 90’s and occupies what was the home of the 379th USAF Bomber Squadron during World War Two.
    
    HKRC has been home to Motorsport UK racing for over 50 years and our race meetings are on the second weekend of the month.',
    location: 'Cambridgeshire',
    website: 'www.hkrc.co.uk',
    short_desc: 'The Home of Hunts Kart Racing Club',
    tagline: 'Affectionately known as Kim!',
    facilities: ['Hot Food Available', 'Toilets', 'Overnight Camping', 'Parking', 'Spares Shop', 'Pit Bays for Hire' ],
    social_media: { facebook: 'https://www.facebook.com/OfficialHKRC', instagram: 'https://www.instagram.com/hunts_kart_club/' },
    static_map_url: 'https://www.google.com/maps/embed?pb=!1m14!1m8!1m3!1d9755.913367887408!2d-0.3703701!3d52.3163955!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x4877c089cf206129%3A0x219ffcaa3a0e227!2sHunts%20Kart%20Racing%20Club!5e0!3m2!1sen!2suk!4v1698785743035!5m2!1sen!2suk',
    mobile: ''
  },
  {
    name: 'Warden Law',
    address: 'Hangman’s Lane, Sunderland, SR3 2PR',
    contact_number: '0191 5214050',
    length: 1200,
    email: 'ownerdrivers@kartingnortheast.com',
    description: 'Warden Law first officially opened for motorsport over 25 years ago and has since grown to become a multi activity venue as well as host to the biggest UK karting championships, including the Wera Tools British Kart Championship

    The centre is situated between Sunderland and Durham on the North East coast and covers over 25 acres. The centrepiece of the venue is the 1200m National Kart circuit, which has recently been upgraded to the latest safety technology – Pixel digital warning lights rather than a traditional flag system.
    
    Alongside the kart track is a 350m training circuit which can removed to create further paddock space, a 2500m2 Paintball Arena, a 12000m2 Trials bike area and WLMC is also home to the Durham County Model Car Club!
    
    The venue also has a club house on site with classic homemade food using locally sourced ingredients which can be accompanied by award winning barista coffee.
    
    A huge amount of further plans are in the making to ensure Warden Law becomes the premier Kart & Motorsports venue in the North',
    location: 'Sunderland',
    website: 'https://kartingnortheast.com/',
    short_desc: 'Home of Kai and Rhys Hunter',
    tagline: '',
    facilities: ['Hot Food Available', 'Toilets', 'Overnight Camping', 'Parking', 'Pit Bays for Hire', 'Floodlights', 'Showers', 'Electric Hook Up' ],
    social_media: { facebook: 'https://www.facebook.com/WardenLawKC', instagram: 'https://www.instagram.com/wardenlaw_karting/' },
    static_map_url: 'https://www.google.com/maps/embed?pb=!1m14!1m8!1m3!1d9188.5055676099!2d-1.4228292!3d54.84803!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x487e6394abe71c27%3A0xecdc02d8b8f6d2a4!2sKarting%20North%20East!5e0!3m2!1sen!2suk!4v1698786566459!5m2!1sen!2suk',
    mobile: ''
  },
  {
    name: 'Three Sisters',
    address: 'Three Sisters Road, Ashton-in-Makerfield, Wigan WN4 8DD',
    contact_number: '01942 719030',
    length: 1250,
    email: 'info@threesisterscircuit.co.uk',
    description: 'Three huge spoil heaps, referred to as the Three Sisters, were a legacy of extensive coal mining at Garswood Hall Colliery. Begun in 1867, this was a ceaseless enterprise until 1958, nearly a century later. Postindustrial Revolution slag heaps were a common sight around the country, often blighting the landscape for years before re-greening and reclamation plans brought benefits for the people living around them. The people of Wigan were no exception; and whilst their slag heaps also became affectionally known to locals as the Wigan Alps, it took a further 20 years until these vast eye-sores metamorphosed into a glorious 44-hectare country park and woodland.

    Work began in the late 1970’s, and today the Three Sisters Local Nature Reserve, aside from featuring a boating lake and picnic area, also boasts a thriving wildlife wetland. An extensive network of footpaths attracts walkers, cyclists and even horse riders. It is also home to one of the UK’s most exciting race circuits.
    
    Notable motorsport celebrities associated with the circuit include Neil Hodgson, who won the 2000 British Superbike Championship - his first win came in 1990 at the Three Sisters Circuit. The circuit was also one of five to be chosen to host the 2006 season for McLaren Mercedes’ Champions of the Future, a series aimed at creating an environment in which young, aspiring drivers from all backgrounds could excel. The class champions that year were Formula 1 superstar Lewis Hamilton (Cadet), Andrew Delahunty (Yamaha), and German Touring Car champion Gary Paffett (Intercontinental).',
    location: 'Wigan',
    website: 'www.threesisterscircuit.co.uk',
    short_desc: 'The North West\'s premier outdoor circuit.',
    tagline: '',
    facilities: ['Hot Food Available', 'Toilets', 'Overnight Camping', 'Parking', 'Pit Bays for Hire' ],
    social_media: { facebook: 'https://www.facebook.com/threesisterscircuit', instagram: 'https://www.instagram.com/3sisterscircuit/' },
    static_map_url: 'https://www.google.com/maps/embed?pb=!1m14!1m8!1m3!1d9491.579114575537!2d-2.6351784!3d53.506075!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x487b05a6d8cee531%3A0x9cfa82ae14deb236!2sThree%20Sisters%20Race%20Circuit!5e0!3m2!1sen!2suk!4v1698787756126!5m2!1sen!2suk',
    mobile: ''
  },
  {
    name: 'GYG',
    address: 'Glan Y Gors Park
    Cerrig Y Drudion
    Corwen, Conwy
    LL21 0RU',
    contact_number: '01490 420 770',
    length: 1100,
    email: 'info@gygkarting.co.uk',
    description: 'A prime venue for any Motorsport enthusiast. Largest Karting Circuit in the UK set in the heart of North Wales near Snowdonia National Park and voted as Number One in the UK by RedBull. Track is superb with a mix of tight and twisty to flat out sections. Staff are very welcoming, friendly and helpful. All facilities are extremely well kept.',
    location: 'Corwen, Wales',
    website: 'www.gygkarting.com',
    short_desc: 'Voted Number 1 Track in the UK by RedBull',
    tagline: 'Set in a rural location in the heart of North Wales, Snowdonia.',
    facilities: ['Hot Food Available', 'Toilets', 'Overnight Camping', 'Parking', 'Pit Bays for Hire', 'Arrive and Drive Karting', 'Floodlights', 'Showers', 'Electric Hook Up' ],
    social_media: { facebook: 'https://www.facebook.com/GYGKarting', instagram: 'https://www.instagram.com/gygkarting/' },
    static_map_url: 'https://www.google.com/maps/embed?pb=!1m14!1m8!1m3!1d9596.795436825123!2d-3.5844905!3d53.0347633!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x486538d5b383ed39%3A0xda8bc09c1439c1bc!2sGYG%20KARTING%20LTD!5e0!3m2!1sen!2suk!4v1698833795549!5m2!1sen!2suk',
    mobile: ''
  },
  {
    name: 'Clay Pigeon',
    address: 'Clay Pigeon Raceway, Wardon Hill, Dorchester, Dorset, DT2 9PW',
    contact_number: '01935 83713',
    length: 887,
    email: 'enquiries@claypigeonraceway.com',
    description: 'The Clay Pigeon Raceway was founded in the late 1950\'s early 1960\'s on a disused Second World War Military Hospital site. The original track was built by joining the hut (ward) concrete bases together with tarmac to make a 500 metre track. The Blandford Karting Club was formed and a Roval Automobile Club Permit was obtained and the first "official" race took place on Sunday 5th May 1963.

 

    Shortly after this first race meeting the Bath Karting Club assumed the responsibility of organising RACMSA race meetings.
    
     
    
    In the early 1970\'s the Clay Pigeon Kart Club was formed and has continued to organise and promote MSA race meetings at Clay, leasing the circuit for 14 days a year from a long list of owners of the circuit. Neil Hann was chairman in the early years and he and his volunteers extended the circuit to the 815 metres that it is today.
    
     
    
    In the mid 1980\'s Ian Rennison joined the committee of the Clay Pigeon Kart Club and together with Neil Hann, Trevor Brown, John Donovan, Colin Clark (and later Ron Davies) were responsible for saving the circuit in 1989 when the owners Lane Racing Ltd went into liquidation. They formed Chelborough Ltd, who purchased the freehold of the circuit to maintain MSA racing in this area.
    
     
    
    The circuit was in a poor state and once the trade tenants of the circuit were removed in 1994 improvements to the circuit were started - new fencing, track widened and totally resurfaced, tarmac pit areas etc. The club erected a new clubhouse followed by a new lap scorers hut and new scrutineering facilities.
    
     
    
    The circuit has now become a seven days a week business organising arrive and drive hire karts, Corporate events, practice and hosting most major championships that tour Britain.
    
     
    
    Recently Chelborough Ltd (the Circuit owners) has come under control of Southern Counties Leisure who now own all the leisure facilities around the circuit including the new 39 room George Albert Hotel and new improvements to the circuit and it facilities are on the way including a new purpose built Clubhouse and corporate area.
    
     
    
    The future is bright for the Clay Pigeon Kart Circuit and Clay Pigeon Kart Club.',
    location: 'Dorchester',
    website: 'www.claypigeonraceway.com',
    short_desc: 'Home of Clay Pigeon Kart Club',
    tagline: 'Outdoor kart track, hosting national championship meetings, public and corporate races.', 
    facilities: ['Hot Food Available', 'Toilets', 'Overnight Camping', 'Parking', 'Pit Bays for Hire', 'Arrive and Drive Karting', 'Floodlights', 'Showers', 'Electric Hook Up', 'Kart Shop', 'ARKS Testing Available' ],
    social_media: { facebook: 'https://www.facebook.com/claypigeonraceway', instagram: 'https://www.instagram.com/claypigeonraceway/' },
    static_map_url: 'https://www.google.com/maps/embed?pb=!1m14!1m8!1m3!1d10081.510932252502!2d-2.5547235!3d50.8241669!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x4872434bfcde60db%3A0x86d381aabfc9e1f1!2sClay%20Pigeon%20Raceway!5e0!3m2!1sen!2suk!4v1698833950420!5m2!1sen!2suk'
  },
  {
    name: 'Teeside Karting',
    address: 'Motor Sports Park, Teesside Autodrome South Tees, S Bank Rd, Middlesbrough TS6 6XH',
    contact_number: '01642 231117',
    length: 1309,
    email: 'teessidekarting.co.uk',
    description: 'Welcome to the world\'s longest kart circuit, managed by the current owners since 1998. Previously called Langburgh Circuit, it has since become the home of the British 24-hour kart race and has been developed into a multipurpose venue for karts, bikes and cars. Our karts are hand-built racing karts, built to give you the full experience of speed, reaching up to 60mph hour on the long straights of the Teesside Circuit. As the home of the Pro-Kart and the 24-hour race, we are uniquely placed to give you the thrill of karting at the highest level. ',
    location: 'Middlesborough',
    website: 'teessidekarting.co.uk/',
    short_desc: 'Home of the British 24 Hour Race',
    tagline: 'Long-established track for drivers aged 8 and up, with special karts for children and a cafe/bar.',
    facilities: ['Hot Food Available', 'Toilets', 'Overnight Camping', 'Parking', 'Pit Bays for Hire', 'Arrive and Drive Karting', 'Showers' ],
    social_media: { facebook: 'https://www.facebook.com/teessidekarting.middlesbrough', instagram: 'https://www.instagram.com/teessidekarting/' },
    static_map_url: 'https://www.google.com/maps/embed?pb=!1m14!1m8!1m3!1d9250.00285478609!2d-1.1895201!3d54.5775508!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x487eee44f668cb37%3A0xc5b9e92817eeecbc!2sTeesside%20Karting!5e0!3m2!1sen!2suk!4v1698834373242!5m2!1sen!2suk',
    mobile: ''
  },
  {
    name: 'Rowrah',
    address: 'Kirkland, Frizington CA26 3XU',
    contact_number: '01229 463748',
    length: 1030,
    email: 'www.cumbriakrc.co.uk/',
    description: 'From a small enthusiastic group of volunteers who created the circuit in 1963 the club and circuit has grown into the fantastic facility it is today. Even today, the circuit is still run by a small enthusiastic group of volunteers who continue to strive to make the circuit one of the best in the UK which is constantly voted for by the drivers and competitors who make long journeys to visit us.

    The Club continues to run the Lets go Karting Scheme, where you can come along to the circuit and have a go on a race kart, with full tuition and safety equipment (further details elsewhere on the CKRC website). CKRC pioneered the "Racing For Buttons" program, our search for a young driver to become the next Formula 1 sensation, and this was taken up by the Motorsport UK, who introduced the Lets go Karting Scheme to encourage more people into the sport.   With the current success of ex-karting sensations such as David Coulthard, Jenson Button, Lewis Hamilton,Paul DiResta, George Russell and Llando Norris, all of whom started their careers in karting and, indeed, visited Rowrah on many occasions during their karting career, karting is becoming more and more popular so why not visit us and see if the karting bug bites? The 2016 season saw the opening of our new Lets Go Karting Training and Education Centre – this purpose built building is now complete and will provides a base for newcomers to our sport to gain experience and education.',
    location: 'Cumbria',
    website: 'www.cumbriakrc.co.uk/',
    short_desc: 'The Lakeland Circuit',
    tagline: 'Home of Cumbria Kart Racing Club',
    facilities: ['Hot Food Available', 'Toilets', 'Overnight Camping', 'Parking', 'Pit Bays for Hire', 'Arrive and Drive Karting', 'Showers', 'Floodlight', 'Electric Hook Up' ],
    social_media: { facebook: 'https://www.facebook.com/profile.php?id=100062070679732', instagram: 'https://www.instagram.com/cumbriakartracingclub/' },
    static_map_url: 'https://www.google.com/maps/embed?pb=!1m14!1m8!1m3!1d9255.997607950627!2d-3.4429247!3d54.551136!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x487ca5f441d97d5d%3A0x51c9c510c27314a2!2sCumbria%20Kart%20Racing%20Club!5e0!3m2!1sen!2suk!4v1698835235449!5m2!1sen!2suk',
    mobile: ''
  },
  {
    name: 'Larkhall',
    address: 'Merryton Rd, Larkhall ML9 2UL',
    contact_number: '01698 909808',
    length: 1140,
    email: 'info@larkhallcircuit.com',
    description: 'Larkhall Circuit was built on the site of Summerlee Colliery in 1961. In 2019 the track received significant redevelopment and investment, which has resulted in Larkhall Circuit being able to lay claim to being the most technical karting track in the UK and the longest track in Scotland. As part of the redevelopment, the track was extended and many new safety features were installed, ensuring a world class facility for both drivers and spectators.

    The track is well-known for being home to the WSKC Karting club. However the Larkhall Track is open to the public, companies, private groups and available all year round for events, conferences and team days out. Within the circuit complex, you’ll find the impressive Kart Republic Cafe.
    
    Many of today’s motorsports stars are current or former members of WSKC including David Coulthard, Dario Franchitti, Mario Franchitti, Ryan Dalziel, Allan McNish, Paul Di Resta, Stefan Di Resta, Barry Horne, Susie Wolff, Dean MacDonald. Ross Martin, Dexter Patterson, Angus Moulsdale, Lewis Gilbert and Ciaran Haggerty.
    
    Conveniently located just minutes from the M74, the circuit is easily accessible from all over Scotland and the UK.
    
    Larkhall Circuit is open and offering you the opportunity to experience motorsport karting at it’s finest, with both entry level karting available as well as owner practice days and international competitions.

    Karts are available to hire for both individuals and groups, with full use of the international circuit.  
    
     A cafe and indoor/outdoor viewing areas are also situated on-site.
    
    British Championships are held at Larkhall Circuit, as well as a club race once a month by West of Scotland Kart Club who are based at the track.
    
    Recently the track has gone through major refurbishment including the track being extended to 1140 metres, new Kart Republic café and complete renovation of the paddock and pit bays.
    
    Conveniently located just minutes from the M74, the circuit is easily accessible from all over Scotland and the UK.
    
    We welcome all experience levels and provide everything you need: suit, balaclava, helmet, gloves and kart.',
    location: 'Scotland',
    website: 'www.larkhallcircuit.com',
    short_desc: 'The Longest Outdoor Circuit in Scotland',
    tagline: 'Larkhall Circuit is the UK\'s Newest Outdoor Karting Circuit',
    facilities: ['Hot Food Available', 'Toilets', 'Overnight Camping', 'Parking', 'Pit Bays for Hire', 'Arrive and Drive Karting', 'Showers', 'Floodlight', 'Electric Hook Up' ],
    social_media: { facebook: 'https://www.facebook.com/larkhallcircuit', instagram: 'https://www.instagram.com/larkhallcircuit/' },
    static_map_url: 'https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d147513.54937898627!2d-4.102294696017218!3d55.812827307528416!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x488815ec575164b7%3A0xd6ae35f45a28be03!2sLarkhall%20Circuit!5e0!3m2!1sen!2suk!4v1698835887384!5m2!1sen!2suk',
    mobile: ''
  },
  {
    name: 'Shennington',
    address: 'Shenington Airfield, Shenington, Banbury OX15 6NW',
    contact_number: '01926 812177',
    length: 1018,
    email: 'secretary@sheningtonkrc.co.uk',
    description: 'Shenington Kart Racing Club is a well-known and prestigious kart racing club located in Shenington, a village in Oxfordshire, England. Founded in 1960, it is one of the oldest and most respected karting clubs in the country. Shenington Kart Racing Club caters to racers of all ages and skill levels, from beginners to seasoned professionals. The club organizes various race events throughout the year, including club championships,  and national-level competitions. These events attract a diverse range of participants, from local enthusiasts to nationally recognized drivers.

    The club has a vibrant and friendly community, with members who are passionate about karting and dedicated to promoting the sport. Shenington Kart Racing Club has a strong focus on safety, implementing strict regulations and procedures to ensure a secure racing environment. Shenington Kart Racing Club has gained a reputation as a breeding ground for talented drivers, with many successful racers having started their careers at the club. It serves as a stepping stone for aspiring motorsport professionals, providing them with the opportunity to gain experience, improve their skills, and progress to higher levels of competition.
    
    PLEASE NOTE: Shenington village, as a route to the circuit, is OUT OF BOUNDS (unless you are using the facilities in the village, eg for accommodation or food).  We regret that any kart team reported using this route will automatically be excluded from the meeting.  Please help us to preserve the good relations with our Shenington village neighbours.  Thank you for your co-operation.  Do not speed in the villages, the Police are informed.',
    location: 'Oxford',
    website: 'www.sheningtonkrc.co.uk/',
    short_desc: 'Founded in 1960, it is one of the oldest and most respected karting clubs in the country.',
    tagline: 'Home of Shenington Kart Racing Club',
    facilities: ['Hot Food Available', 'Toilets', 'Overnight Camping', 'Parking', 'Pit Bays for Hire', 'Arrive and Drive Karting', 'Showers', 'Floodlight', 'Electric Hook Up' ],
    social_media: { facebook: 'https://www.facebook.com/sheningtonkrc', instagram: 'https://www.instagram.com/sheningtonkrc/' },
    static_map_url: 'https://www.google.com/maps/embed?pb=!1m14!1m8!1m3!1d9807.628398867175!2d-1.476714!3d52.081421!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x48772bec06e9bbcd%3A0x38e7b8d82c6f4242!2sShenington%20Kart%20Racing%20Club!5e0!3m2!1sen!2suk!4v1698836453541!5m2!1sen!2suk',
    mobile: ''
  },
  {
    name: 'Buckmore Park',
    address: 'Maidstone Rd, Chatham ME5 9QG',
    contact_number: '01634 201562',
    length: 1000,
    email: 'sales@buckmore.co.uk',
    description: 'We’ve been at the forefront of British karting for several decades. Now, we’re pioneering the next generation of kart circuit.

    When my father, John Surtees (7 time Motorcycle World Champion and Ferrari Formula 1 World Champion), bought Buckmore in 2015 we had the opportunity to invest in upgrading all the facilities, both on and off track, and we\'re proud to be recognised as one of the most impressive and advanced karting circuits in the world.
    
    Sadly Dad passed away in March 2017 leaving a rich motorsport legacy and a big vision for Buckmore. Every day we strive to realise his grand plans and we continue to deliver the excitement, the thrill and the emotion that he wanted to bring to everyone who visits us.',
    location: 'Kent',
    website: 'www.buckmore.co.uk/',
    short_desc: 'Buckmore Park saw its inception in the early 1960’s with the initial 400m circuit.',
    tagline: 'Home of Medway Valley Kart Club',
    facilities: ['Hot Food Available', 'Toilets', 'Overnight Camping', 'Parking', 'Pit Bays for Hire', 'Arrive and Drive Karting' ],
    social_media: { facebook: 'https://www.facebook.com/buckmorepark', instagram: 'https://www.instagram.com/buckmorepark/' },
    static_map_url: 'https://www.google.com/maps/embed?pb=!1m14!1m8!1m3!1d9969.007474834503!2d0.501862!3d51.343279!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x47df333258701513%3A0x27bc7cc3da5517ab!2sBuckmore%20Park%20Kart%20Circuit!5e0!3m2!1sen!2suk!4v1698841800120!5m2!1sen!2suk',
    mobile: ''
  },
  {
    name: 'Fulbeck',
    address: 'Stragglethorpe Ln, Grantham NG32 3JE',
    contact_number: '0114 2302381',
    length: 930,
    email: 'compsec@fulbeckkartclub.co.uk',
    description: 'The home of real racing since 1954.

    Located in Lincolnshire we host two meetings a month challenging you to drive at one of the most technical tracks in the UK.
    
    We welcome drivers of all experience levels to compete in a fair and fun way. Our team are dedicated to giving you a great service and competitive racing from Bambino to Senior grids.',
    location: 'Grantham',
    website: 'www.fulbeckkartclub.co.uk',
    short_desc: 'The home of real racing since 1954.',
    tagline: '',
    facilities: ['Hot Food Available', 'Toilets', 'Overnight Camping', 'Parking', 'Pit Bays for Hire' ],
    social_media: { facebook: 'https://www.facebook.com/FulbeckKartClub', instagram: 'https://www.instagram.com/fulbeckkartclub/' },
    static_map_url: 'https://www.google.com/maps/embed?pb=!1m14!1m8!1m3!1d9594.64737699518!2d-0.6551306!3d53.0444145!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x4878482af751e4ab%3A0xf8624acce7648106!2sFulbeck%20Kart%20Circuit!5e0!3m2!1sen!2suk!4v1698842362350!5m2!1sen!2suk',
    mobile: '07749 106101'
  },
  {
    name: 'Wombwell',
    address: 'Atheletic Stadium, Barnsley, Station Rd, Wombwell, Barnsley S73 0BJ',
    contact_number: '0771 1975572',
    length: 865,
    email: 'wombwellkarting64@gmail.com',
    description: 'Wombwell Karting (previously known as South Yorkshire Kart Club) has one of the oldest and most unique kart circuits in the UK, with records dating back to 1959.

    ​
    
    It\'s success may be down to the anti-clockwise layout, or possibly the infamous turn 3 which is approached flat out in all classes from the straight and is entered blind due to the perimeter fence, tightening into turn 4, presenting fantastic overtaking opportunities for the brave. It has been the point of many championship deciding moves (and bumps) over the years.
    
    The track is fairly short at only 865m long, with a breeze block wall separating the main straight from the return straight, just one metre from the edge of the track!
  
    Over the years the circuit has been raced by a number of driver that have gone on to be successful. These are just a few - Lewis Hamilton, George Russell, Jenson Button, David Coulthard, Mike Wilson, Dan Wheldon, Justin Wilson and local Formula E driver Oliver Rowland. 
    
    The club is run by a committee of volunteers with a team of voluntary officials. A friendly, welcoming circuit and a great place to begin your karting journey. Race meetings are held monthly for owner drivers. As a registered Motorsport UK circuit we can offer ARKS Test to enable drivers to become licenced to race in MSUK events.
    
    Well worth a visit!',
    location: 'Barnsley',
    website: 'www.wombwellkarting64.wixsite.com/website',
    short_desc: 'The home of teh Joe Dale Championship',
    tagline: 'Cock O North',
    facilities: ['Hot Food Available', 'Toilets', 'Overnight Camping', 'Parking' ],
    social_media: { facebook: 'https://www.facebook.com/WombwellKarting', instagram: 'https://www.instagram.com/wombwellkarting/' },
    static_map_url: 'https://www.google.com/maps/embed?pb=!1m14!1m8!1m3!1d9487.160751035994!2d-1.397073!3d53.5258039!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x4879704454e4a415%3A0xfd0a14a2241c51c2!2sWombwell%20Kart%20Circuit!5e0!3m2!1sen!2suk!4v1698842755935!5m2!1sen!2suk',
    mobile: '07711975572'
  },
  {
    name: 'Rye House',
    address: 'Rye Rd, Hoddesdon EN11 0EH',
    contact_number: '01992 460895',
    length: 900,
    email: 'info@rye-house.co.uk',
    description: 'Rye House Kart Raceway is now a famous venue that has become the UK’s foremost karting centres and offers the perfect introduction into the world of motorsport. It is a great opportunity to enjoy the thrills and exhilaration of go-karting, the ultimate race experience.

    The historic racing circuit is one of the oldest in existence and over the years has hosted many national and international meetings, as well as club meetings
    
    “Rye House has always been a great circuit, run by great people who have been incredibly supportive throughout my career. This is where I started and let’s hope that for every one of you, this could be where your career begins too” Lewis Hamilton – Formula 1 seven time world champion ',
    location: 'Hertfordshire',
    website: 'www.rye-house.co.uk',
    short_desc: 'Lewis Hamilton\s Home Track',
    tagline: '',
    facilities: ['Hot Food Available', 'Toilets', 'Overnight Camping', 'Parking', 'Arrive & Drive Karting',  ],
    social_media: { facebook: 'https://www.facebook.com/RyeHouseKartRacewayGoKarting', instagram: 'https://www.instagram.com/ryehousekarting/' },
    static_map_url: 'https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d1239031.9397841273!2d-2.3672386931598077!3d52.66026192561268!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x47d89dfd755f6bcb%3A0x68e250e8f76a21d5!2sRye%20House%20Kart%20Raceway!5e0!3m2!1sen!2suk!4v1698843076499!5m2!1sen!2suk',
    mobile: ''
  },
  {
    name: 'Lydd',
    address: 'Dengemarsh Rd, Lydd TN29 9JH',
    contact_number: '01797 321747',
    length: 1040,
    email: 'info@lyddkartcircuit.com/',
    description: 'Established in 1993, Lydd Kart Circuit is the fastest for outdoor Go Karting in Kent and one of the fastest in the Country. The 1040 meter track is very popular with drivers, whether they be ‘Owner Drivers’ racing their own karts or ‘Arrive & Drive’ customers using our Hire Karts.

    The current layout has existed since an extension was added in 1996, while our Junior Circuit measures approx 500m and is ideal for kids sessions, family sessions or children’s birthday parties.
    
    The owner, James Clarke, took control of the Circuit in February 2011 and is investing in his vision of the future of Lydd as a Karting venue.
    
    James is very passionate about Lydd and Karting, so the circuit is in safe hands, and the improvements to the whole venue will continue to be ‘work in progress’.
    
    A new workshop/garage building for the hire kart fleet/owner driver kart storage was built, creating a much better base to work from, while the next phase of James’ original plan to resurface the track, also ticked off the list as done. In 2016/2017 many customers who have known the track of old have re-visited, feedback on the track surface continues to be been very positive. Winter 2017/2018 the new build clubhouse/café/offices got underway, and finally opened in March 2020.
    
    We host owner driver monthly club race meetings providing drivers with the chance to go racing in a friendly family atmosphere. Also for owner drivers we can offer (subject to availability) one-to-one tuition, kart preparation and kart storage. For more information – please click on the Owner/Driver page.',
    location: 'South East',
    website: 'www.lyddkartcircuit.com',
    short_desc: 'The Biggest & Fastest Kart Circuit in the South',
    tagline: '',
    facilities: ['Hot Food Available', 'Toilets', 'Overnight Camping', 'Parking', 'Arrive & Drive Karting', 'Kart Shop',   ],
    social_media: { facebook: 'https://www.facebook.com/lydd.kartcircuit', instagram: 'https://www.instagram.com/lydd_kart_circuit/' },
    static_map_url: 'https://www.google.com/maps/embed?pb=!1m14!1m8!1m3!1d45415.38629455035!2d0.8671727295675298!3d50.93819879500111!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x47dee60de523691b%3A0x7f559f24cfa1a96b!2sLydd%20Karting%20Ltd!5e0!3m2!1sen!2suk!4v1698843621211!5m2!1sen!2suk',
    mobile: ''
  },
  {
    name: 'Mansell Raceway',
    address: 'Dunkeswell Aerodrome, Dunkeswell, Honiton, Devon EX14 4AH',
    contact_number: '0344 5441992',
    length: 1032,
    email: 'njal@mansellraceway.com',
    description: 'Based in the west country it had early links with Exeter and Plymouth Kart clubs which are no longer on the karting map, but the two clubs have since left a legacy of experienced drivers and enthusiasts who are now using their skills at Dunkeswell and other UK circuits. Like our present day club many of the UK’s early Motor Sports organisations used some of the old American and RAF Airfields which were left behind after the the ‘Yankee’ soldiers and Battle Groups from America and Europe departed at the end of the last war. Many of these great Landing Strips have now been dug up, returned to arable pastures or redeveloped, but fortunately the early Club was lucky to have a good group of dedicated Karting and Motorsport enthusiasts to seal the fate of part of the old Airfield Fuel Bay and Runway and put the area to good Sporting use.

    Although the Race circuit of today is situated on the southern side of the Blackdown Hills – recognised for its outstanding natural beauty, those early days at Dunkeswell or any other venue were rustic to say the least. Some parts of the early airfields were surfaced in concrete and most were left open to the elements, barren and in disrepair which meant a bumpy ride for those early drivers who sought to experience the thrills of driving at speed.
    
    As a member club of the ‘ Devon Four Motorsport Partnership’, Association of South Western Motor Clubs (ASWMC), Association of British Kart Clubs (ABkC) we hope to provide those with Karting Interests with a stepping stone to other forms of Motorsport. Of course you don’t have to be a Kart, Single seater or car driver to enjoy our sports as our gates are open free of charge to spectators and visitors on Saturday Practice Sessions and you are invited to enjoy views of the Airfield activities and Race Day excitment from our Track Side parking areas for a small fee on Race Sundays.

    If you are interested in any of Dunkeswell Kart Clubs Sporting activities the club can be contacted on most days by telephone, email or post and you are welcome to visit us and see some of our drivers in action at the circuit.

    Membership is open to all local and UK Kart drivers, friends, families and groups of any age.',
    location: 'South West',
    website: 'www.mansellraceway.com',
    short_desc: 'Established over 50 years ago Mansell Kart Racing Club has grown from the early roots of karting and motorsports interests in the UK.',
    tagline: '',
    facilities: ['Hot Food Available', 'Toilets', 'Overnight Camping', 'Parking', 'Arrive & Drive Karting', 'Kart Shop',   ],
    social_media: { facebook: 'https://www.facebook.com/mansellracewayofficial', instagram: 'https://www.instagram.com/mansell_kart_club/' },
    static_map_url: 'https://www.google.com/maps/embed?pb=!1m14!1m8!1m3!1d10071.969631313614!2d-3.2343932!3d50.8683403!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x486d91e607c5bcf7%3A0x1cb33215802a326a!2sMansell%20Raceway!5e0!3m2!1sen!2suk!4v1698844578546!5m2!1sen!2suk',
    mobile: ''
  },
  {
    name: 'Bayford Meadows',
    address: 'Symmonds Drive, Sittingbourne ME10 3RY',
    contact_number: '01795 410707',
    length: 1100,
    email: 'info@bayfordmeadows.co.uk',
    description: 'Bayford boasts a 1100m MSUK-licensed circuit and a 300m leisure track, both set within a spacious 12-acre landscaped site. Running regular MSUK-licensed race meetings, Bayford Meadows is considered to be one of the leading competition kart circuits in the country. Enjoy the excitement of karting for both young and old on weekdays, evenings and weekends
    
    Bayford Meadows can host events for a group of friends or a multinational company. Running regular MSUK-licensed race meetings, Bayford Meadows is considered one of the leading competition kart circuits in the country. Enjoy the excitement of karting for both young and old at one of the UK\'s top kart circuits.

    The circuit was designed and built by owner Gerry Lilley, on what was previously wasteland behind the Eurolink Industrial Estate and first opened to the public in 1997.

    The circuit is managed by Gerry\'s daughter, Corinne Murphy (pictured below) and has a great team who work together with the aim of making every karting experience at Bayford Meadows an enjoyable one. The circuit features a fast and consistent asphalt racing surface, and is regularly enjoyed by both leisure karters and owner drivers.

    Bayford Meadows\’ commitment to exceptional customer care and personal service has made it one of the country’s premier outdoor floodlit kart circuits.

    We hope to continue to increase our base of happy customers, so if there is a particular type of karting event you require, we will do our best to accommodate your requirements. We look forward to speaking to you.',
    location: 'Kent',
    website: 'www.bayfordmeadows.co.uk',
    short_desc: '1100m NKA/MSA licensed circuit set within a 12 acre site.',
    tagline: '',
    facilities: ['60 Seater Diner on Site', 'Toilets', 'Overnight Camping', 'Parking', 'Arrive & Drive Karting' ],
    social_media: { facebook: 'https://www.facebook.com/pages/Bayford-Meadows-Kart-circuit-Sittingbourne/100930626669209', instagram: 'https://www.instagram.com/officialbayfordmeadowscircuit/' },
    static_map_url: 'https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d2492.017985164377!2d0.7435908174438512!3d51.347579900000014!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x47d8d5547b2f01c9%3A0x44a6c5eedae5416d!2sBayford%20Meadows%20Kart%20Circuit%20Ltd!5e0!3m2!1sen!2suk!4v1698844682544!5m2!1sen!2suk',
    mobile: ''
  },
  {
    name: 'Llandow',
    address: 'Llandow Trading Estate
    Cowbridge
    Vale of Glamorgan CF71 7PB',
    contact_number: '01446 795568',
    length: 1050,
    email: 'karting@swkc.co.uk',
    description: 'Racing circuits around the world have particular names for parts of the track. The names aid drivers, observers and spectators to identify the position where the action is or the location of an incident which may be out of sight to the majority.

    The names may be geographical, technical or often named after individuals. They are part of the history of a circuit and to enthusiasts they can produce a mental image of any particular track.
    
    The South Wales Karting Centre, at Llandow, is no different. Developed following adoption by the St Athan Kart Club and from the year 2000 by the renamed Llandow Kart Club, the names may be familiar to many drivers but the reasons for the names can be lost in the mists of time.
    
    We have recently added a new name to the list of designations so it presents an opportunity to review and explain the names.
    
    Clockwise, from the starting lights.
    
    Raymonds
    This sharp hairpin recognises the early support and involvement by the nationally known John Raymond Transport Ltd. Jonathon Raymond was a multiple Welsh Karting Champion in the 1970s and 80s, and his son Richie raced at Llandow.
    
    Start/Finish Straight
    Although the position of the start has changed the finish line is still part way along the ‘straight’.
    
    The Hook
    A descriptive name for this right \' left \' right \' left section.
    
    Bomber Straight
    More a shallow curve, the name remembers the part played by RAF Llandow during the Second World War. The airfield was a ‘satellite’ to RAF St Athan, in fact connected by a green track. RAF Llandow hosted two and four engined aircraft as a maintenance unit and storage facility.
    
    Surtees
    Named in honour of Sir John Surtees, the only man to have ever won the Formula One and World Bike Championships, was at Llandow in August 2005 and officially ‘opened’ the first bend into the newly completed extension to the track.
    
    MacWhirters
    Another nationally known early supporter, MacWhirter Ltd., supplier of refrigeration and air conditioning products.
    
    Lancaster Curve
    A reference to Llandow’s post wartime period. As a storage depot many hundreds of aircraft spent time in the fields around the runways. The Battle of Britain Memorial Flight Lancaster PA 474 and ‘Just Jane’, NX 611 the Lincolnshire Aviation Heritage Lancaster were parked here before disposal. PA 474 had left by 1948 but NX 611 was here until 1952.
    
    Chandlers
    The third major company to support the Club and circuit from the beginning, Chandler KBS, advises on construction cost and project management.
    
    Spitfire Straight
    Living up to the name, this fast section pays tribute to the pilots who trained on Spitfires at RAF Llandow. Many went on to fly during the Battle of Britain and several were lost during training and in battle.
    
    The Dell
    The name seems to have nothing to do with the sometime home ground of Southampton FC! The name describes the location of this right / left turn and the line of trees that separate the current circuit from the public road and the site of the original Llandow kart track.
    
    Diggers
    This corner was named in 2013 in memory of Richard Dowers. Richard was known by family, friends and the Karting community as ‘Diggers’. He made major contributions to the Club and SWKC over many years.
    
    Hangar Straight
    The fastest part of the track is on the line of one of RAF Llandow’s main runways. Several of the 1940s hangars can still be seen from the circuit. Also named after Hangar Straight at Silverstone, one of the most famous straights in motor sport.
    
    NGK Chicane
    Part way along the straight is part of an earlier layout. Formally known as the NGK Kink. Following the continuation of the straight the ‘kink’ was renamed a ‘chicane’. Not used in the regular race circuit it does form part of the Bambino circuit. NGK Spark Plug Co. Ltd. was a long time supporter of the Club and circuit. The ‘kink’ was bypassed when the straight was extended and Raymond’s Hairpin was re-paved and re-profiled during the summer of 2006 before Llandow hosted the ABkC Internations.',
    location: 'South Wales',
    website: 'www.swkc.co.uk',
    short_desc: 'South Wales Karting Centre is one of the largest, fastest and most exciting circuits in Wales.',
    tagline: '',
    facilities: ['Cafe', 'Toilets', 'Overnight Camping', 'Parking', 'Floodlights', 'Showers'],
    social_media: { facebook: 'https://www.facebook.com/southwaleskartingcentreltd/'},
    static_map_url: 'https://www.google.com/maps/embed?pb=!1m14!1m8!1m3!1d9949.4111464195!2d-3.4957645!3d51.4333147!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x486e72c5ce9d0795%3A0xa7439f09687b3480!2sThe%20South%20Wales%20Karting%20Centre%20Ltd!5e0!3m2!1sen!2suk!4v1698845156762!5m2!1sen!2suk',
    mobile: ''
  },
  {
    name: 'Stretton',
    address: 'Gartree Rd, Leicester LE2 2FG',
    contact_number: '0116 259 2900',
    length: 950,
    email: 'info@strettoncircuit.co.uk',
    description: 'Home of Leicester Go Karting - We\'re a family owned circuit run by racers, for racers!
    Based in the Leicester, we\'re at the heart of the Midland\'s go karting scene. With a wide range of events will suit your every need, we welcome drivers of all levels to challenge themselves on our 950m floodlit outdoor karting circuit. Stretton has a reputation as a ‘racers circuit’, and outdoor karting offers a thrill like no other. The feeling of wind, weather and tarmac as you race around the track cannot be matched, providing a real sense of speed and an authentic motorsport experience.
    ',
    location: 'Leicester',
    website: 'www.strettoncircuit.co.uk',
    short_desc: 'Home of Kart Racing in Leicestershire',
    tagline: '',
    facilities: ['Licensed Bar', 'Cafe', 'Toilets', 'Overnight Camping', 'Parking', 'Floodlights', 'Showers'],
    social_media: { facebook: 'https://www.facebook.com/StrettonKarting/', instagram: 'https://www.instagram.com/strettoncircuit/'},
    static_map_url: 'https://www.google.com/maps/embed?pb=!1m14!1m8!1m3!1d9691.90315095583!2d-1.0382852!3d52.6062085!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x487764707c4c09b7%3A0x25ae37c5264a3901!2sStretton%20Circuit%2C%20Leicester%20Karting!5e0!3m2!1sen!2suk!4v1698845861000!5m2!1sen!2suk',
    mobile: ''
  },
  {
    name: 'Forest Edge',
    address: 'Barton Stacey, Winchester SO21 3BF',
    contact_number: '07555 112012',
    length: 1100,
    email: 'compsec@fekc.co.uk',
    description: 'Forest Edge Kart Club is situated on the A303 in Barton Stacey.
    The circuit is situated on MOD land so the FEKC team of Marshalls and Officials build the track with military organisation at the start of the race weekend and equally pack the infrastructure away at the end of the event.
    The circuit consists if fast straights but technical corner complexes, drivers love the combination of speed and skill as they compete on this amazing track.
    ',
    location: 'Hampshire',
    website: 'www.fekc.co.uk',
    short_desc: '',
    tagline: '',
    facilities: ['Cafe', 'Toilets', 'Overnight Camping', 'Parking'],
    social_media: { facebook: 'https://www.facebook.com/StrettonKarting/', instagram: 'https://www.instagram.com/strettoncircuit/'},
    static_map_url: 'https://www.google.com/maps/embed?pb=!1m14!1m8!1m3!1d10004.415687419852!2d-1.3643614!3d51.1803075!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x48740582a8d0036d%3A0x7417c274d8cad5a3!2sForest%20Edge%20Kart%20Club!5e0!3m2!1sen!2suk!4v1698846130172!5m2!1sen!2suk',
    mobile: ''
  },
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




champ_data = [ 
  {
    name: 'Super One',
    description: 'Be assured that 2024 is going to be a fantastic season with a Bambino Karting Championship, Honda Cadet and Rotax classes. Race weekends will have a two day format with one Round on the Saturday and one Round on the Sunday.

    FRIDAY – Optional Open Practice
    SATURDAY – Practice, Timed Qualifying, 2 Heats and a Final.
    SUNDAY – Timed Qualifying, 2 Heats and a Final.
    
    Trophies presented on both days.
    
    6 weekends
    12 Rounds
    2 drop rounds. 
    
    There will be Live Streamed filming with extensive YouTube coverage.',
    price:'' ,
    champ_type: 'Series',
    contact_number: '01928 740090',
    mobile: '07774 646784',
    website: 'www.superoneseries.com',
    email: 'mail@superoneseries.com',
    short_name: 'S1',
    long_name: 'Super One Series',
    test_fee: 70,
    race_fee: 185,
    champ_fee: 150,
    tagline: '41 Years in the Making'
  },
  {
    name: 'UKC',
    description: 'ARE YOU THE ULTIMATE KARTING CHAMPION?

    The 2024 UKC series will be hosted over 6 rounds and offers drivers prestigious awards and exclusive opportunities in their career development.
    
    The series offers a unique platform for drivers and race teams to promote and showcase their talents on the global stage.
    
     
    
    We invite you to join us in our search for the ultimate karting champion.',
    price:'' ,
    champ_type: 'Series',
    contact_number: '',
    mobile: '',
    website: 'www.ukcglobal.com',
    email: 'paul@ukcglobal.com',
    short_name: 'UKC',
    long_name: 'Ultimate Karting Championship',
    test_fee: 75,
    race_fee: 195,
    champ_fee: 175,
    tagline: 'Are You the ULTIMATE Karting Champion?'
  },
  {
    name: 'TKC',
    description: 'The Kart Championship is designed to allow your child the chance to compete on a even playing field. All the dates for 2024 are set in stone, along with all the classes that will be competing throughout the year, from March all the way to December.
    It\'s another exciting year, that has taken a lot of hard work to put together, but it\'s going to showcase UK karting at its very best!
    Don\'t forget that registrations for next year officially open at 11 a.m. on November 11th.',
    price: '' ,
    champ_type: 'Series',
    contact_number: '',
    mobile: '',
    website: 'www.thekartchampionship.co.uk',
    email: 'hello@thekartchampionship.co.uk',
    short_name: 'TKC',
    long_name: 'The Kart Champonship',
    test_fee: 75,
    race_fee: 165,
    champ_fee: 150,
    tagline: 'Join the Revolution'
  },
  {
    name: 'IPKC',
    description: 'Welcome To The IPKC!
    The IPKC is a national kart championship that embraces drivers from the privateer sector. Giving the independent drivers a taste of a full national championship whilst maintaining the community feel & fun of a club event.
    
    Being mindful of the constant rising costs of motorsport, the IPKC try to keep costs as low as possible by restricting tyres, budget friendly entry fees & not forcing drivers to spend a small fortune on equipment and parts that are required at other championships.
    
    An event should be a weekend away that includes the racing! We try to emphasise the friendly and fun environment on our events that maintains a friendly and welcoming atmosphere. From paddock members attempting their skills at karaoke, to a simple game of football.. We get involved.
    
    A championship is about you: THE DRIVERS! and we love nothing more than seeing participants walk away with a smile on their face.
    
    Join us now and experience a kart championship that has been quoted as:
    “The Way It Used To Be!”',
    price: '' ,
    champ_type: 'Series',
    contact_number: '',
    mobile: '',
    website: 'www.ipkc.co.uk',
    email: 'inquiries@ipkc.co.uk',
    short_name: 'IPKC',
    long_name: 'Independent Privateer Kart Championship',
    test_fee: 75,
    race_fee: 155,
    champ_fee: 155,
    tagline: 'The Way it Used to Be!'
  },
  {
    name: 'British Champs',
    description: 'The Championships are split into six categories, each featuring multiple classes. British Champion titles are awarded for all classes. Some of world motorsport’s most famous drivers have British Kart Championship titles on their CVs, including Anthony Davidson, Paul di Resta, Mike Conway, Oliver Jarvis, Oliver Rowland and George Russell, to name but a few.

    This year, the Wera Tools British Championships are bigger, better and more prestigious than ever. That’s because motorsport’s national governing body, Motorsport UK, is organising them for the first time through its new Karting UK operation.
    
    With an average of 500 drivers competing each year, this is the biggest karting championship in decades. Are you one of our Champions? Register below to secure your place on the grid. Let’s go Racing!',
    price: '' ,
    champ_type: 'Series',
    contact_number: '07951 785 211',
    mobile: '',
    website: 'www.britishkartchampionships.org',
    email: 'kart@motorsportuk.org',
    short_name: 'British',
    long_name: 'British Kart Championships',
    test_fee: 90,
    race_fee: 235,
    champ_fee: '',
    tagline: 'Get closer to the action!'
  },
  {
    name: 'NKC',
    description: 'Renowned for its friendly atmosphere and excellent value, NKC, now in its 8th year, is back. 2024 brings new tracks, new classes and the return of the regional Southern and Northern cups.

    NKC is a national kart racing championship taking place over six rounds at six different circuits across England with a special ‘O’ plate event in July open to all drivers.
    
    We have classes for Juniors and Seniors in Rotax and TKM and KZ.
    
    Drivers are strictly limited to TWO SETS OF SLICKS for the whole championship (other than KZ) which along with low entry fees, makes NKC the best value owner driver national karting championships in the UK.',
    price: '' ,
    champ_type: 'Series',
    contact_number: '07951 785 211',
    mobile: '',
    website: 'www.kartcup.co.uk/',
    email: 'kart@motorsportuk.org',
    short_name: 'NKC',
    long_name: 'National Kart Cup',
    test_fee: 65,
    race_fee: 165,
    champ_fee: 265,
    tagline: 'Welcome to NKC 2024!'
  },
]

champ_data.each do |data|
  championship = Championship.create!(data)
  
  image_types = [:image, :logo]

  image_types.each do |type|
    file_path = Rails.root.join('db', 'seed_images', championship.name, "#{type}.jpg")
    if File.exist?(file_path)
      championship.send(type).attach(io: File.open(file_path), filename: "#{type}.jpg", content_type: 'image/jpg')
    else
      puts "Warning: #{file_path} does not exist. Skipping."
    end
  end
end


event_data = [
  {
    title: 'Super One Round 1',
    description: 'The Opening Round of the 2024 Super One Series',
    date: '2024-03-30',
    price: 185,
    event_type: "Race",
    championship_id: 1,
    track_id: 8,
  }
]

event_data.each do |data|
  event = Event.create!(data)
end
KartCalendar - KartStream in it's current state...

Self Guided Solo Rails project to serve the Owner Driver Karting World in the UK.

Rails 7... a little Hotwire here and there, PostGres, Pundit, Devise, Image Processing and a few API's for weather, maps, locations etc

It's not perfect, it's not pretty but I did it.

Allows Driver, Parents, Team Owners and Mechanics to View information on all Tracks, Events and Championships available to them. Also added a feature for them to create an account, follow some tracks/events etc and then it will create them their own calendar on their dashboard. Helps them refer to dates quickly, check race clashes etc

Also recently working on a feature to allow them to create an engine in their account so they can store it's information and also the records of it service's carried out and Dyno performance, sorts of acts like a digital logbook.

More to come...



30/9/2024 - Plenty of work to do yet, but I'm happy with the progress.

Worked on Refactoring, Performance and Code Quality over the last month. Looked at Event and Track models and controllers to make them more efficient and faster, cleaned up the views on the way through to use a few more partials and reuse those components where possible.

Learnt alot about the correct use db queries, eager loading and caching in an attempt to make the site more performant.

Cleaned up the services too and removed some of that code from the controllers.

The Championships Model and controller still needs some work but happy with September 2024.





10/10/2024 - Clean up and Improved the UX

Worked on refactoring the code in all areas, removing more redundant methods, adding a few more partials here and there, removing more SVG from show views, added some DB indexed columns to aid the search queries.

Also improved the US on the Tracks Index and Event Index page, added tabbed view for the map and search on the track index and a filtering tab for the events index.






16/10/2024 - Added API Key Authentication to the API - Simple and works.

Playing around with an idea for another small project related to Karting but not quite ready to share, I wanted to use some of the data inside Kartstream for it just to play around with some ideas. I may even add the feature for the new project into Kartstream itself instead of creating a whole new app.

Anyway, Step 1 was a little feature to open up the Event data so could call it using an API request, I've not done much with API's before so it was a case of learning as I go.

I've added a simple API Key system to the project so can be used in the future for something like a mobile app.

Added a little security, not great but the accessible data is limted anyway.
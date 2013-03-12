Notes App

Features:

(required)
- Allows users to add notes with a title and description
- Allows users to view all notes in a table
- Allows users to select a note in the table and be taken to a detail view that contains more information about the note
	- Title
	- Description
	- Map indicating where the note was left off

(extra)
- Allows users to use the foursquare API to select a location venue
	- Location selected will be shown in the detail view, both as the Location Name as well as on the Map
- Allows the users to update the Note Title, Description, and Location Name while in the detail view
- Includes normal and retina icon
- Includes 3 already populated sample notes


Comments:

- Takes roughly 5 seconds before the app starts tracking the users current location. If you try to add a note before then, the lat/long will still be 0 since the user's location hasn't been tracked yet.
# hw_4

A new Flutter project.

## Getting Started

How to run the project:

Welcome Screen:
Functionality: Shows an instruction screen along with a welcome screen.
Implementation: Tracks the initial launch and decides whether to provide 
the instructional based on shared preferences.

Functionality on the second screen includes displaying a list of users,
retrieving additional users via an API, and saving specific users in a local SQLite database.

Implementation: 
    Integrates SQLite for local storage, uses the HTTP package to collect user data, 
    and offers Third Screen navigation.

Third Screen:
    Features: Shows a list of people that were retrieved from the nearby SQLite database.
    Implementation: Retrieves user data from SQLite and presents it in a list 
    using the LocalDatabase class. samples, guidance on mobile development, and a full API reference.

The functionality of LocalDatabase is to manage SQLite database operations. 
    Implementation: Sets up the database and offers ways to add and retrieve information.

List of Users: 
    Features: Depicts a user object with particular characteristics. 
    Implementation: Specifies how user data is organized and saved in the database after being obtained via the API.


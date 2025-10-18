# flutter_task

## This project follows the MVVM (Model-View-ViewModel) architecture pattern for a clean and maintainable structure.

 Layers

1. Data Layer

Contains the DAO, Repository, and Local Data Source.

Uses SQLite for local data storage.

Initially, the app loads data from JSON assets and then converts & stores it into the SQLite database.

2. Presentation Layer

Includes View Widgets (UI screens) and ViewModels for managing state and business logic.

The ViewModel communicates with the Repository to fetch or update data, exposing reactive UI states.

3. Core Layer

Contains reusable and app-wide modules such as:

Error handling

Utilities

Dependency Injection (DI)

Helpers



<img width="594" height="640" alt="image" src="https://github.com/user-attachments/assets/6a557d79-1f8d-4057-881c-b6a01a2f74d2" />

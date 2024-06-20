# Hotel App
Hotel App that lists out hotels and all the details regarding hotels with the users who signs in through socail Media.

- **Project Owner:** Megha Pradeetha
- **Owner Contact:** pradeetha1997@gmail.com | +94 77 123 9794
- **Project Reason:** Coding Test for Elegant Media

## Assumptions Made
- To Get List of hotels and Login with multiple social platform like Google, Facebook, Apple, Outlook.
- In the hotel detail page, user must have access to the complete information of that hotel inclusive of its location on a map.
- The app should give the user some kind of feedback for network errors and not just crash.
- Target device is Android; screen resolution should be at least 720p.

## Improvements Made
- Added multiple social login options (Google, Facebook, Apple, Outlook).
- Added a search bar to live filter hotels.
- Added clickable list view that leads to a detailed view for each hotel.
- Created reusable widgets for future use.
- Provided a visually appealing UI/UX with appropriate padding and margin.
- Architecture of the app is MVVM (Model-View-ViewModel).
- Used Provider for dependency injection.
- Added Google Map to share hotel locations.

## Future Improvement Suggestions
- Configure additional login options.
- Introduce Multi-Factor Authentication (MFA) and encrypted data transfer for enhanced security.
- Organize the MVVM architecture by feature, such as login, home, and map features.
- Resolve issues with hotel pictures by providing working image URLs from the backend.
- Implement environment flavoring for development, testing, and production purposes (e.g., separate codebases for DEV, TEST, and PROD).
- Establish a continuous integration/continuous deployment (CI/CD) pipeline for automated rollouts.
- Implement data caching for improved performance on devices.
- Implement hotel booking feature.

## How to Test the Project on a New Machine

### Prerequisites
- Flutter SDK version >= 3.1.2 < 4.0.0
- Android Studio or Visual Studio Code with Flutter and Dart plugins installed.

### Steps to Set Up and Test

1. **Clone the repository:**
    ```bash
    git clone https://github.com/MeghaPradeetha/HotelApp.git
    ```

2. **Install dependencies:**
    ```bash
    flutter pub get
    ```

3. **Run the project:**
    ```bash
    flutter run
    ```

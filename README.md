# Hotel App
This is a hotel app that displays a list of hotels with all their details for users who log in using social media.

- **Project Owner:** Megha Pradeetha
- **Owner Contact:** pradeetha1997@gmail.com | +94 77 123 9794
- **Project Reason:** Coding Test for Elegant Media

## Assumptions Made
- Users should be able to view a list of hotels and log in using multiple social platforms (Google, Facebook, Apple, Outlook).
- In the detailed view, users should be able to see comprehensive information about the hotel, including its location displayed on a map.
- The app should handle network errors gracefully, providing appropriate feedback to the user.
- The target device is Android with a minimum screen resolution of 720p.

## Improvements Made
- Added multiple social login options (Google, Facebook, Apple, Outlook).
- Added a search bar to live filter hotels.
- Added clickable list view that leads to a detailed view for each hotel.
- Created reusable widgets for future use.
- Provided a visually appealing UI/UX with appropriate padding and margin.
- Architecture of the app is MVVM (Model-View-ViewModel).
- Used Provider for dependency injection.
- Added Google Map to share hotel locations.

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

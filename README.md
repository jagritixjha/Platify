# Platify

Platify is a Flutter app that provides an efficient solution for managing contacts, chats, calls, and profile settings. It supports both Android and iOS UI styles, with a toggle to switch between them, and includes light and dark theme options, with settings stored using persistent local storage.

## Features

### 1. Add Contact Screen
- A user-friendly form for adding new contacts with fields for:
    - **Picture**: Upload a profile image.
    - **Name**: Input the contact's name.
    - **Phone Number**: Enter a valid phone number.
    - **Chat Message**: Set an initial message for the contact.
    - **Date & Time Pickers**: Choose a date and time.

### 2. Chat Screen
- Displays a list of contacts with:
    - **Contact Name and Message**: Shows each contact's name and the initial message.
    - **Tap to Edit**: Allows editing the message for any contact by tapping on the list item.

### 3. Calls Screen
- Displays all added contacts with:
    - **Contact Name and Message**: Displays both in the list.
    - **Call Icon**: A trailing icon to simulate calling the contact.

### 4. Settings Screen
- Provides profile customization with:
    - **Profile Picture**: Update the user profile image.
    - **Name**: Update the user's name.
    - **Bio**: Add or update the user's bio.
    - **Theme Toggle**: Switch between light and dark modes, with settings stored locally.

### 5. Platform UI Toggle
- Global switch to toggle between Android and iOS UI styles for the entire app.

## Technologies Used
- **Flutter**: For building a cross-platform application.
- **Persistent Local Storage**: To store and retrieve user preferences (such as the selected theme).
- **Dart**: Programming language used for building the app.
- **State Management**: Provider state management for managing state of the app .

## App Architecture
The app follows a separation of concerns, ensuring a clean codebase:
- **State Management**: The app handles state updates and data management efficiently, allowing smooth interactions across different screens using **Provider**.
- **Dynamic UI**: The app dynamically adjusts its layout and design to match either Android or iOS styles based on the user’s preferences.

## Screenshots
[View all screenshots here](https://github.com/jagritixjha/Platify/blob/master/screenshot.md)

### Prerequisites
- [Flutter SDK](https://flutter.dev/docs/get-started/install)
- Android Studio or Xcode for emulating the app on Android/iOS devices.

### Installation
1. Clone the repository:
   ```bash
   git clone https://github.com/jagritixjha/Platify.git

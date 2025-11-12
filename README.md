# E-Learning Application

This is a Flutter-based e-learning application designed to provide a seamless and engaging learning experience. The app allows users to browse courses, watch video lessons, and track their progress. It is built with a focus on clean architecture, state management using BLoC, and a high-quality user experience.

## User Experience

The application is designed with the user in mind, providing a smooth and intuitive experience:

*   **Onboarding:** A beautiful and informative onboarding experience for new users to get acquainted with the app's features.
*   **Intuitive Navigation:** A clean and organized interface that makes it easy to find and enroll in courses.
*   **Engaging UI:** The use of `smooth_page_indicator` for carousels and `shimmer` effects for loading content provides a modern and responsive feel.
*   **Seamless Video Playback:** An integrated video player powered by `chewie` and `video_player` allows for uninterrupted learning.
*   **Offline Capabilities:** `get_storage` and `shared_preferences` are used to cache essential data, allowing for a better offline experience.

## Tech Stack

*   **Framework:** [Flutter](https://flutter.dev/)
*   **Language:** [Dart](https://dart.dev/)
*   **State Management:** [flutter_bloc](https://pub.dev/packages/flutter_bloc)
*   **Routing & Dependency Injection:** [get](https://pub.dev/packages/get)
*   **UI Components:**
    *   [smooth_page_indicator](https://pub.dev/packages/smooth_page_indicator)
    *   [flutter_svg](https://pub.dev/packages/flutter_svg)
    *   [shimmer](https://pub.dev/packages/shimmer)
    *   [cached_network_image](https://pub.dev/packages/cached_network_image)
*   **Video Playback:**
    *   [video_player](https://pub.dev/packages/video_player)
    *   [chewie](https://pub.dev/packages/chewie)
*   **Local Storage:**
    *   [get_storage](https://pub.dev/packages/get_storage)
    *   [shared_preferences](https://pub.dev/packages/shared_preferences)
*   **API Communication:** [http](https://pub.dev/packages/http)
*   **Fonts:** [google_fonts](https://pub.dev/packages/google_fonts)

## Features in Detail

*   **Onboarding Flow:** A welcoming introduction for first-time users to showcase the app's primary features and value.
*   **Course Discovery:**
    *   **Categorized Courses:** Courses are organized into categories for easy browsing and discovery.
    *   **Smart Search:** A prominent search bar allows users to quickly find specific courses, topics, or instructors.
    *   **Featured & Popular Courses:** The home screen highlights new, featured, and trending courses to engage users.
*   **Course Content:**
    *   **Detailed Course Pages:** Each course has a dedicated page with its curriculum, lesson list, description, and instructor information.
    *   **Engaging Video Lessons:** In-app video player with `chewie` provides a rich learning experience, including playback controls, full-screen mode, and progress tracking.
*   **Performance & UX:**
    *   **Responsive UI:** A fluid and adaptive interface that works seamlessly across different screen sizes and orientations.
    *   **Optimized Loading:** `shimmer` effects provide visual feedback while content is loading, and `cached_network_image` reduces redundant data fetching and improves image loading times.
    *   **Offline Access:** Key user data and preferences are stored locally using `get_storage` and `shared_preferences` for a consistent experience even with intermittent connectivity.

## Project Structure

The project follows a clean and scalable architecture:

```
lib/
├── bloc/           # BLoC files for state management
├── controllers/    # Business logic controllers
├── core/           # Core utilities and constants
├── main.dart       # Application entry point
├── main_screen.dart # Main screen after launch
├── models/         # Data models for the application
├── routes/         # Navigation routes and routing logic
├── services/       # Services for API, storage, etc.
└── views/          # UI screens and widgets
```

## Getting Started

To get a local copy up and running, follow these simple steps.

### Prerequisites

*   Flutter SDK: Make sure you have the Flutter SDK installed. For more information, see the [Flutter documentation](https://flutter.dev/docs/get-started/install).

### Installation

1.  **Clone the repository:**
    ```bash
    git clone https://github.com/your_username/e_learning_application.git
    ```
2.  **Navigate to the project directory:**
    ```bash
    cd e_learning_application
    ```
3.  **Install dependencies:**
    ```bash
    flutter pub get
    ```
4.  **Run the application:**
    ```bash
    flutter run
    ```

## Contributing

Contributions are what make the open-source community such an amazing place to learn, inspire, and create. Any contributions you make are **greatly appreciated**.

1.  Fork the Project
2.  Create your Feature Branch (`git checkout -b feature/AmazingFeature`)
3.  Commit your Changes (`git commit -m 'Add some AmazingFeature'`)
4.  Push to the Branch (`git push origin feature/AmazingFeature`)
5.  Open a Pull Request

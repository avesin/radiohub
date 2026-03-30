# RadioApp

A cross-platform Flutter application for streaming radio stations.

## Features
- Stream radio stations from around the world
- Modern, responsive UI
- Platform support: Android, iOS, Web, macOS, Windows, Linux
- Core features modularized under `lib/core/`

## Getting Started

### Prerequisites
- [Flutter SDK](https://flutter.dev/docs/get-started/install)
- Dart 3.x

### Installation
1. Clone the repository:
	```sh
	git clone <your-repo-url>
	cd radioapp
	```
2. Get dependencies:
	```sh
	flutter pub get
	```
3. Run the app:
	```sh
	flutter run
	```

## Project Structure
- `lib/` - Main Dart source code
- `assets/` - App assets (icons, lottie animations, etc.)
- `android/`, `ios/`, `macos/`, `windows/`, `linux/`, `web/` - Platform-specific code
- `test/` - Unit and widget tests

## Architecture (MVVM - In Progress)
This project is being refactored to follow the **MVVM (Model-View-ViewModel)** architecture for better separation of concerns and testability. The migration is ongoing, and some parts may not fully adhere to MVVM yet.

- **Model**: Data classes and business logic (e.g., `Station`, repositories)
- **View**: UI widgets (e.g., screens, components)
- **ViewModel**: State management and logic for views (e.g., `StationViewmodel`, `ListItemViewmodel`)

### State Management: Riverpod
We use [Riverpod](https://riverpod.dev/) (via `flutter_riverpod`) for robust, testable, and scalable state management. Riverpod enables us to:
- Create providers for app-wide or feature-specific state
- Use `NotifierProvider` for ViewModels, encapsulating logic and state
- Easily test and mock providers
- Avoid context-related issues present in other state management solutions

**Example:**
```dart
final stationProvider = NotifierProvider<StationViewmodel, StationState>(
	StationViewmodel.new,
);
```

### Key Libraries Used
- **flutter_riverpod**: Main state management solution, powering MVVM ViewModels and providers
- **just_audio**: Audio playback
- **dio**: HTTP networking
- **encrypt_shared_preferences**: Secure local storage
- **geolocator / geocoding**: Location services
- **lottie**: Animations
- **freezed / json_serializable**: Data classes and serialization
- **audio_service / audio_session**: Background audio and session management
- **volume_controller**: System volume control
- **pretty_dio_logger**: HTTP logging
- **permission_handler**: Runtime permissions

See `pubspec.yaml` for the full list of dependencies.

## Contributing
Pull requests are welcome! For major changes, please open an issue first to discuss what you would like to change.

## License
[MIT](LICENSE)

## Getting Started


# Flutter News App

A Flutter project for displaying news articles. The project is organized using a clean architecture and follows best practices for state management, dependency injection, and API integration.

## Project Structure

```plaintext
lib/
|-- core/
|   |-- constant/
|   |   |-- app_constant.dart
|   |   |-- app_sizes.dart
|   |   |-- app_text_style.dart
|   |-- resources/
|   |   |-- data_state.dart
|   |-- util/
|   |   |-- appUtil.dart
|   |-- usecase/
|       |-- usecase.dart
|-- config/
|   |-- routes/
|   |   |-- app_route.dart
|   |-- theme/
|       |-- light_theme.dart
|-- data/
|   |-- api/
|   |   |-- api_provider.dart
|   |   |-- news_requests.dart
|   |-- datasource/
|   |   |-- remote/
|   |       |-- news_datasource.dart
|   |-- exeptions/
|   |   |-- api_exeption.dart
|   |-- model/
|   |   |-- news_model.dart
|   |-- repository/
|       |-- news_repository.dart
|       |-- storeToHive.dart
|-- domain/
|   |-- entity/
|   |   |-- news_model_entity.dart
|   |   |-- news_model_entity.g.dart
|   |-- repository/
|   |   |-- Inews_repository.dart
|   |-- use_case/
|       |-- get_news_use_case.dart
|       |-- get_save_data_user_case.dart
|       |-- save_news_use_case.dart
|-- presentation/
|   |-- bloc/
|   |   |-- news_bloc/
|   |       |-- news_bloc.dart
|   |       |-- news_event.dart
|   |       |-- news_state.dart
|   |-- pages/
|   |   |-- news_screen.dart
|   |   |-- single_news_screen.dart
|   |-- widgets/
|       |-- news_widget.dart
|       |-- pop_up_menu.dart
|-- injection.dart
|-- main.dart
```



### Prerequisites

- [Flutter](https://flutter.dev/docs/get-started/install)
- [Dart](https://dart.dev/get-dart)
- Any IDE with Flutter support (VSCode, Android Studio, IntelliJ)

### Installation

1. Clone the repository:

    ```bash
    git clone https://github.com/y4cn/flutter_news_app
    cd flutter_news_app
    ```

2. Install the dependencies:

    ```bash
    flutter pub get
    ```

3. Run the app:

    ```bash
    flutter run
    ```

## Key Components

- **main.dart**: Initializes the app and sets up the main widget tree.
- **injection.dart**: Configures dependency injection using a service locator.
- **API Integration**: Handled by files in `lib/data/api/`.
- **State Management**: Implemented using Bloc pattern in `lib/presentation/bloc/`.
- **UI Components**: Defined in `lib/presentation/pages/` and `lib/presentation/widgets/`.



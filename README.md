# Sunly Weather App

Sunly is a simple and beautiful weather application built with Flutter. It allows you to get the current weather and a 5-day forecast for any city in the world.

## Features

*   **Current Weather:** Get the current temperature, condition, humidity, wind speed, and "feels like" temperature.
*   **5-Day Forecast:** View the weather forecast for the next 5 days, including daily high and low temperatures.
*   **City Search:** Search for any city to get its weather forecast.
*   **Light & Dark Themes:** Switch between light and dark themes for a comfortable viewing experience.
*   **Celsius & Fahrenheit:** Toggle between Celsius and Fahrenheit temperature units.
*   **Favorite Cities:** Save up to 5 of your favorite cities for quick access.
*   **Persistent State:** The app remembers your last searched city and your favorite cities.

## Setup Instructions

1.  **Clone the repository:**
    ```bash
    git clone https://github.com/your-username/sunly.git
    cd sunly
    ```

2.  **Get Flutter dependencies:**
    ```bash
    flutter pub get
    ```

3.  **Set up API Key:**
    See the "API Key Setup Guide" section below.

4.  **Run the app:**
    ```bash
    flutter run
    ```

## API Key Setup Guide

This project uses the [WeatherAPI](https://www.weatherapi.com/) to fetch weather data. You'll need to get your own API key to run the app.

1.  **Create an account:** Go to [https://www.weatherapi.com/](https://www.weatherapi.com/) and sign up for a free account.

2.  **Get your API key:** Once you've signed up, you'll find your API key on your dashboard.

3.  **Create a `.env` file:** In the root of the project, create a new file named `.env`.

4.  **Add your API key to the `.env` file:**
    ```
    WEATHER_API_KEY=your_api_key_here
    ```
    Replace `your_api_key_here` with the API key you got from the WeatherAPI dashboard.

## Architecture Overview

The app follows a clean architecture pattern, with a clear separation of concerns between the UI, business logic, and data layers.

*   **UI Layer (`lib/views`):** This layer contains all the widgets that make up the UI of the app. It's responsible for displaying the data and handling user input.

*   **Business Logic Layer (`lib/cubits`):** This layer contains the business logic of the app, implemented using the `flutter_bloc` package. The cubits are responsible for managing the state of the app and responding to user actions.

*   **Data Layer (`lib/core`):** This layer is responsible for fetching data from the API and managing data persistence.
    *   **`services`:** Contains the `WeatherService` for interacting with the WeatherAPI and `get_it` for service location.
    *   **`models`:** Contains the data models for the weather and forecast data.
    *   **`utils`:** Contains utility classes and functions, such as the app router, themes, and constants.

## Assumptions and Design Decisions

*   **State Management:** `flutter_bloc` (specifically `Cubit`) was chosen for state management due to its simplicity and scalability. It provides a clear separation between the UI and business logic.

*   **Navigation:** `go_router` is used for navigation. It's a powerful and flexible routing solution that handles deep linking and declarative routing.

*   **Data Persistence:** `shared_preferences` is used for simple data persistence, such as storing the last searched city and the list of favorite cities. For more complex data, a more robust solution like a local database (e.g., `sqflite` or `hive`) would be considered.

*   **API Interaction:** The `dio` package is used for making HTTP requests to the WeatherAPI. It's a powerful and easy-to-use HTTP client for Dart.

*   **Dependency Injection:** `get_it` is used as a service locator for dependency injection. This helps to decouple the different parts of the app and makes it more testable.
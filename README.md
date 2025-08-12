# Responsive Country Info Cards

A visually appealing Flutter application that displays country information in a responsive grid layout. The number of columns in the grid automatically adjusts to the screen size, providing an optimal viewing experience on mobile phones, tablets, and desktops.

This project is a great example of building responsive UIs in Flutter and handling dynamic data in a grid.

*(It's highly recommended to add a screenshot or, even better, a GIF here showing the app working on different screen sizes.)*


## Features

* **📱 Responsive Grid Layout:** The core feature of the app. The grid displays:
    * **2 columns** on small screens (phones).
    * **3 columns** on medium screens (tablets).
    * **4 columns** on large screens (desktops/web).
* **✨ Custom Card UI:** Each country is displayed on a custom-designed `Card` widget with rounded corners, elevation, and a clean layout.
* **🌐 Network Image Loading:** Country flags are loaded dynamically from an online source using `Image.network`.
* **🔧 Error Handling:** Includes a fallback UI (`Icon(Icons.broken_image)`) that is displayed if a country's flag fails to load.
* **Efficient List Building:** Uses `GridView.builder` to efficiently render the list of countries, ensuring smooth performance even with a large amount of data.

## Technology Stack

* **Framework:** Flutter
* **Language:** Dart

## Getting Started

To get a local copy up and running, follow these simple steps.

### Prerequisites

You need to have the Flutter SDK installed on your machine.
* [Flutter Installation Guide](https://docs.flutter.dev/get-started/install)

### How to Run

1.  **Clone the repository:**
    ```sh
    git clone [https://github.com/your-username/your-repository-name.git](https://github.com/your-username/your-repository-name.git)
    ```

2.  **Navigate to the project directory:**
    ```sh
    cd your-repository-name
    ```

3.  **Install dependencies:**
    ```sh
    flutter pub get
    ```

4.  **Run the app:**
    ```sh
    flutter run
    ```

## Future Improvements

This is a great starting point. Here are some ideas for future enhancements:

* **Live Data:** Fetch country data from a free public API (like the [REST Countries API](https://restcountries.com/)) instead of using a hardcoded list.
* **Search & Filter:** Add a search bar to allow users to filter the countries by name.
* **Detail Screen:** Implement a feature where tapping on a country card navigates to a new screen with more detailed information about that country.

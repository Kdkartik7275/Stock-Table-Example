Scrolling Table App

This project demonstrates a synchronized scrolling functionality for a table with three sections: left, middle, and right. The middle table contains centered columns ("Strike" and "IV"), while the left and right tables contain related data that scroll horizontally in sync.

Overview
Left Table: Displays columns with "Volume", "OL", and "OL Change".
Middle Table: Displays centered columns with "Strike" and "IV".
Right Table: Displays columns with "OL", "OL Change", and "Volume".

The app ensures that horizontal scrolling of the left and right tables is synchronized, while vertical scrolling is mirrored.


Setup Instructions
  1. Clone the Repository
    git clone https://github.com/Kdkartik7275/Stock-Table-Example.git.
    cd scrolling-table-app

  3. Get Flutter Packages:
     flutter pub get

  4. Run the App:
     flutter run

Code Explanation:
  main.dart: Initializes the app and sets up the TableScreen widget.
  table_screen.dart: Contains the main UI with three synchronized tables. Handles scroll synchronization.
  data_sources.dart: Provides data sources for the left, middle, and right tables.
  data_model.dart: Defines the data models for stock data.
  sf_table.dart: Custom widget for displaying a table using SfDataGrid.


import 'package:flutter/material.dart';

/// The business logic for the BottomNavbar widget.
class BottomNavbarModel with ChangeNotifier {
  //

  /// The index of the selected destination in the bottom navigation
  /// bar.
  int _selectedIndex = 0;

  int get selectedIndex => _selectedIndex;

  void updateSelectedIndex(int index) {
    if (index >= 0 && index != _selectedIndex) {
      _selectedIndex = index;
      notifyListeners();
    }
  }
}

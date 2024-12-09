import 'package:flutter/animation.dart';
import 'package:flutter/cupertino.dart';

class ScrollProvider extends ChangeNotifier {
  late ScrollController _scrollController;
  int _selectedIndex = 0;

  int get selectedIndex => _selectedIndex;

  void setScrollController(ScrollController controller) {
    _scrollController = controller;
  }

  void scrollTo(int index) {
    _selectedIndex = index;
    notifyListeners();

    // Scroll to the target section
    final targetPosition = index * _scrollController.position.viewportDimension;
    _scrollController.animateTo(
      targetPosition,
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeInOut,
    );
  }
}
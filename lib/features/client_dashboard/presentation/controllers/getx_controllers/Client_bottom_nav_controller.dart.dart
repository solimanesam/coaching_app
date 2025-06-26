import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ClientBottomNavController extends GetxController {
  final List<BottomNavigationBarItem> clientBottomNavigationBarItems = [
    const BottomNavigationBarItem(icon: Icon(Icons.home_filled), label: ''),
    const BottomNavigationBarItem(icon: Icon(Icons.work_outline), label: ''),
    const BottomNavigationBarItem(icon: Icon(Icons.fitness_center), label: ''),
    const BottomNavigationBarItem(
        icon: Icon(Icons.chat_bubble_outline), label: ''),
    const BottomNavigationBarItem(icon: Icon(Icons.auto_awesome), label: ''),
    const BottomNavigationBarItem(icon: Icon(Icons.person), label: ''),
  ];
  final List<BottomNavigationBarItem> coashBottomNavigationBarItems = [
    const BottomNavigationBarItem(icon: Icon(Icons.home_filled), label: ''),
    const BottomNavigationBarItem(
        icon: Icon(Icons.chat_bubble_outline), label: ''),
    const BottomNavigationBarItem(icon: Icon(Icons.group), label: ''),
    const BottomNavigationBarItem(icon: Icon(Icons.person), label: ''),
  ];

  int selectedTapIndex = 0;
  final PageController pageController = PageController();

  void onPageChanged(int index) {
    selectedTapIndex = index;
    update();
  }

  void onChangeTabIndex(int index) {
    if (index != selectedTapIndex) {
      selectedTapIndex = index;
      pageController.jumpToPage(selectedTapIndex);
      update();
    }
  }

  int selectedContainer = -1;

  void pressedButton(int index) {
    if (selectedContainer != index) {
      selectedContainer = index;
    } else {
      selectedContainer = -1;
    }
    update();
  }

  List<String> questions = [
    'Can I customize my plan?',
    'How do I create an account?',
    'How do I track my workouts?',
    'How do I choose a coach?'
  ];

  List<String> answers = [
    'Yes, you can do this with your coach.',
    'You can create an account by signing up with your email or phone number in the app and following the registration steps.',
    'You can track your workouts by logging in to your account and accessing your workout history.',
    'You can choose a coach from the coaches section in the app.'
  ];
  @override
void onClose() {
  pageController.dispose();
  super.onClose();
}

}

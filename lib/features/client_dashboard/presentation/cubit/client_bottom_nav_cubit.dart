import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

part 'client_bottom_nav_state.dart';

class ClientBottomNavCubit extends Cubit<ClientBottomNavigationBarState> {
  ClientBottomNavCubit() : super(ClientBottmNavigationBarInitial());
  final List<BottomNavigationBarItem> bottomNavigationBarItems = [
    BottomNavigationBarItem(icon: const Icon(Icons.home_filled), label: ''),
    BottomNavigationBarItem(icon: const Icon(Icons.fitness_center), label: ''),
    BottomNavigationBarItem(
        icon: const Icon(Icons.chat_bubble_outline), label: ''),
    BottomNavigationBarItem(icon: const Icon(Icons.auto_awesome), label: ''),
    BottomNavigationBarItem(icon: const Icon(Icons.person), label: ''),
  ];
  int selectedTapIndex = 0;
  final PageController pageController = PageController();

  void onPageChanged(int index) {
    selectedTapIndex = index; // تحديث المؤشر عند تغيير الصفحة
    emit(ClientDashBoardChangeItemState()); // تحديث الحالة
  }

  void onChangeTabIndex(int index) {
    if (index != selectedTapIndex) {
      selectedTapIndex = index;
      pageController
          .jumpToPage(selectedTapIndex); // الانتقال إلى الصفحة المطلوبة
      emit(ClientDashBoardChangeItemState()); // تحديث الحالة
    }
  }

  int selectedContainer = -1;

  pressedbutton(int index) {
    if (selectedContainer != index) {
      selectedContainer = index;
      emit(PressedButton());
    } else {
      selectedContainer = -1;
      emit(PressedButton());
    }
  }

  List<String> questions = [
    'Can I customize my plan?',
    'How do I create an account?',
    'How do I track my workouts?',
    'How do I choose a coach?'
  ];
  List<String> answers = [
    'yes you can do this with your coach',
    'You can create an account by signing up with your email or phone number in the app and following the registration steps.',
    'You can track your workouts by logging in to your account and accessing your workout history.',
    'You can choose a coach from the coaches section in the app.'
  ];
}

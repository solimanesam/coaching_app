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
}

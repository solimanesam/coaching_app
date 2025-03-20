part of 'client_bottom_nav_cubit.dart';


sealed class ClientBottomNavigationBarState {}

final class ClientBottmNavigationBarInitial extends ClientBottomNavigationBarState {}

final class ClientDashBoardChangeItemState extends ClientBottomNavigationBarState {}

final class PressedButton extends ClientBottomNavigationBarState {}


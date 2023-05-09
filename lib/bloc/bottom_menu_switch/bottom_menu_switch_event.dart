part of 'bottom_menu_switch_bloc.dart';

abstract class BottomMenuSwitchEvent extends Equatable {
  const BottomMenuSwitchEvent();

  @override
  List<Object> get props => [];
}

class TapSwitchIndex extends BottomMenuSwitchEvent {
  int indexFromWidget;

  TapSwitchIndex({required this.indexFromWidget});
}

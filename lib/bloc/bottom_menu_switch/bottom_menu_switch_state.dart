// ignore_for_file: non_constant_identifier_names, must_be_immutable

part of 'bottom_menu_switch_bloc.dart';

class BottomMenuSwitchState extends Equatable {
  int bottomSwitch_index;
  BottomMenuSwitchState({required this.bottomSwitch_index});

  BottomMenuSwitchState copyWith({int? bottomSwitch_index}) {
    return BottomMenuSwitchState(
        bottomSwitch_index: bottomSwitch_index ?? this.bottomSwitch_index);
  }

  @override
  List<Object> get props => [bottomSwitch_index];
}

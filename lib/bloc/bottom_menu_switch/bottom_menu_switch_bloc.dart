import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
part 'bottom_menu_switch_event.dart';
part 'bottom_menu_switch_state.dart';

class BottomMenuSwitchBloc
    extends Bloc<BottomMenuSwitchEvent, BottomMenuSwitchState> {
  BottomMenuSwitchBloc() : super(BottomMenuSwitchState(bottomSwitch_index: 2)) {
    //-
    on<TapSwitchIndex>((event, emit) {
      emit(state.copyWith(bottomSwitch_index: event.indexFromWidget));
   
    });
  }
}

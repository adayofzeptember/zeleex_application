import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'check_event.dart';
part 'check_state.dart';

class CheckBloc extends Bloc<CheckEvent, CheckState> {
  CheckBloc() : super(CheckState(isCheck: false, defaultOrNot: 0)) {
    on<CheckboxChangeMainAddressx>((event, emit) {
      emit(state.copyWith(isCheck: event.getCheck));
      if (state.isCheck == true) {
        emit(state.copyWith(isCheck: event.getCheck, defaultOrNot: 1));
      } else {
        emit(state.copyWith(isCheck: event.getCheck, defaultOrNot: 0));
      }
    });

    on<ClearCheck>(
      (event, emit) {
        emit(state.copyWith(isCheck: false, defaultOrNot: 0));
      },
    );
  }
}

// ignore_for_file: must_be_immutable

part of 'check_bloc.dart';

class CheckState extends Equatable {
  bool isCheck;
  int defaultOrNot;
  CheckState({required this.isCheck, required this.defaultOrNot});

  CheckState copyWith({bool? isCheck, int? defaultOrNot}) {
    return CheckState(
      defaultOrNot: defaultOrNot ?? this.defaultOrNot,
      isCheck: isCheck ?? this.isCheck,
    );
  }

  @override
  List<Object> get props => [isCheck, defaultOrNot];
}

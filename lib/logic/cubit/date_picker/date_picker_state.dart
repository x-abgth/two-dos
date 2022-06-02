part of 'date_picker_cubit.dart';

class DatePickerState extends Equatable {
  final String date;

  DatePickerState({required this.date});

  @override
  List<Object?> get props => [date];
}

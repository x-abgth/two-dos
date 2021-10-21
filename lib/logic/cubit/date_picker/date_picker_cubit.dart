import 'package:bloc/bloc.dart';

part 'date_picker_state.dart';

class DatePickerCubit extends Cubit<DatePickerState> {
  DatePickerCubit() : super(DatePickerState(date: ""));

  void pickDate({required String date}) => emit(DatePickerState(date: date));
}

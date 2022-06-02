import 'package:flutter_test/flutter_test.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:two_dos/logic/cubit/date_picker/date_picker_cubit.dart';

void main() {
  group('Date Picker Cubit', () {
    DatePickerCubit datePickerCubit = DatePickerCubit();

    test('The initial value of datePickerCubit should be "" ', () {
      expect(datePickerCubit.state, DatePickerState(date: ''));
    });

    blocTest<DatePickerCubit, DatePickerState>(
      'emits date when cubit.pickdate() is called',
      build: () => datePickerCubit,
      act: (DatePickerCubit _datePickerCubit) =>
          _datePickerCubit.pickDate(date: "hello"),
      expect: () => [DatePickerState(date: "hello")],
    );
  });
}

import 'package:bloc/bloc.dart';

part 'theme_picker_state.dart';

class ThemePickerCubit extends Cubit<ThemePickerState> {
  ThemePickerCubit() : super(ThemePickerState(selectedThemeIndex: -1));

  void seclectColor(int index) =>
      emit(ThemePickerState(selectedThemeIndex: index));
}

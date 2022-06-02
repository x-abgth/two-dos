part of 'theme_picker_cubit.dart';

class ThemePickerState extends Equatable {
  final int selectedThemeIndex;

  ThemePickerState({required this.selectedThemeIndex});

  @override
  List<Object?> get props => [selectedThemeIndex];
}

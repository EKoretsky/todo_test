import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_test/view/cubits/theme_cubit/theme_state.dart';

class ThemeCubit extends Cubit<ThemeState> {
  ThemeCubit() : super(LightThemeState());

  void changeTheme() {
    if (state is LightThemeState) {
      emit(DarkThemeState());
    } else {
      emit(LightThemeState());
    }
  }
}

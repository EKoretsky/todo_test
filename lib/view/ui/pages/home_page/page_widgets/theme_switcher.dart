import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_test/view/cubits/theme_cubit/theme_cubit.dart';
import 'package:todo_test/view/cubits/theme_cubit/theme_state.dart';

class ThemeSwitcher extends StatefulWidget {
  const ThemeSwitcher({Key? key}) : super(key: key);

  @override
  State<ThemeSwitcher> createState() => _ThemeSwitcherState();
}

class _ThemeSwitcherState extends State<ThemeSwitcher> {
  @override
  Widget build(BuildContext context) {
    final themeCubit = BlocProvider.of<ThemeCubit>(context, listen: false);
    return BlocBuilder<ThemeCubit, ThemeState>(
      builder: (_, state) {
        final value = state is LightThemeState;
        return Switch.adaptive(
          value: value,
          onChanged: (value) => themeCubit.changeTheme(),
        );
      },
    );
  }
}

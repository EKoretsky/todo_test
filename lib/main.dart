import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:todo_test/view/cubits/task_cubit/task_cubit.dart';
import 'package:todo_test/view/cubits/theme_cubit/theme_cubit.dart';
import 'package:todo_test/view/cubits/theme_cubit/theme_state.dart';
import 'package:todo_test/view/ui/pages/home_page/task_page.dart';
import 'package:todo_test/view/ui/ui_constants/theme.dart';

Future<void> main() async {
  await Hive.initFlutter();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  final appTheme = AppTheme();

  @override
  Widget build(BuildContext context) {
    return BlocProvider<ThemeCubit>(
      create: (_) => ThemeCubit(),
      child: BlocBuilder<ThemeCubit, ThemeState>(
        builder: (_, state) {
          final themeMode =
              state is LightThemeState ? ThemeMode.light : ThemeMode.dark;
          return MaterialApp(
            themeMode: themeMode,
            title: 'Todo test',
            theme: appTheme.light,
            darkTheme: appTheme.dark,
            home: BlocProvider<TaskCubit>(
              create: (_) => TaskCubit(),
              child: const TaskPage(),
            ),
          );
        },
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_test/view/cubits/task_cubit/task_cubit.dart';
import 'package:todo_test/view/ui/pages/home_page/page_widgets/theme_switcher.dart';
import 'package:todo_test/view/ui/shared_widgets/custom_text_field_dialig.dart';
import 'package:todo_test/view/ui/ui_constants/palette.dart';

class HeaderWidget extends StatefulWidget {
  const HeaderWidget({Key? key}) : super(key: key);

  @override
  State<HeaderWidget> createState() => _HeaderWidgetState();
}

class _HeaderWidgetState extends State<HeaderWidget> {
  final _controller = TextEditingController();

  void _onPress(BuildContext context, TaskCubit cubit) {
    showDialog(
      context: context,
      builder: (context) {
        return CustomTextFieldDialog(
          title: 'Add Task',
          textTrueButton: 'Add',
          textFalseButton: 'Cancel',
          okHandler: () {
            cubit.addTask(title: _controller.text);
            Navigator.pop(context);
          },
          content: TextField(
            controller: _controller,
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final taskCubit = BlocProvider.of<TaskCubit>(context, listen: false);

    final theme = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: DecoratedBox(
        decoration: const BoxDecoration(
          border: Border(
            bottom: BorderSide(color: Palette.color3),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            const ThemeSwitcher(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Tasks',
                  style:
                      TextStyle(fontSize: theme.textTheme.headline1!.fontSize),
                ),
                ConstrainedBox(
                  constraints:
                      const BoxConstraints(minHeight: 56, maxWidth: 56),
                  child: TextButton(
                    style: TextButton.styleFrom(
                      backgroundColor: Palette.color1,
                      shape: RoundedRectangleBorder(
                        side: const BorderSide(color: Palette.color3),
                        borderRadius: BorderRadius.circular(6),
                      ),
                    ),
                    onPressed: () => _onPress(context, taskCubit),
                    child: const Icon(
                      Icons.add,
                      size: 40,
                      color: Palette.color2,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 32),
          ],
        ),
      ),
    );
  }
}

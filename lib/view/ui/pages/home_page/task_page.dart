import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_test/domain/entity/task.dart';
import 'package:todo_test/view/cubits/task_cubit/task_cubit.dart';
import 'package:todo_test/view/ui/pages/home_page/page_widgets/header_widget.dart';

class TaskPage extends StatelessWidget {
  const TaskPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final taskCubit = BlocProvider.of<TaskCubit>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tasks'),
      ),
      body: BlocBuilder<TaskCubit, List<Task>>(
        builder: (_, state) {
          return CustomScrollView(
            slivers: [
              const SliverToBoxAdapter(
                child: HeaderWidget(),
              ),
              SliverList(
                delegate: SliverChildBuilderDelegate(
                  (_, index) {
                    final task = state[index];
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0),
                      child: ListTile(
                        contentPadding: EdgeInsets.zero,
                        leading: Transform.scale(
                          scale: 1.0,
                          child: Checkbox(
                            value: task.isDone,
                            onChanged: (value) => taskCubit.changeStatusTask(
                              id: task.id,
                              value: value!,
                            ),
                          ),
                        ),
                        visualDensity: const VisualDensity(
                          horizontal: VisualDensity.minimumDensity,
                        ),
                        title: Text(
                          task.title,
                          style: TextStyle(
                            decoration: task.isDone
                                ? TextDecoration.lineThrough
                                : TextDecoration.none,
                          ),
                        ),
                      ),
                    );
                  },
                  childCount: state.length,
                ),
              )
            ],
          );
        },
      ),
    );
  }
}

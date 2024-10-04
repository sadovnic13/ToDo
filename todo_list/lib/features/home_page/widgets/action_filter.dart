import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_list/features/home_page/bloc/homepage_bloc.dart';
import 'package:todo_list/generated/l10n.dart';
import 'package:todo_list/util/util.dart';

///Widget for creating filter and sorting menus
///[homepageBloc] - page block
////[parameter] - sorting parameter
///[hideDoneTask] - method of displaying completed tasks
///[onParameterChanged] - method of sorting parameter change
///[onHideDoneTasksChanged] - method of changing the display of tasks
class ActionFilter extends StatefulWidget {
  const ActionFilter({super.key});

  @override
  State<ActionFilter> createState() => _ActionFilterState();
}

class _ActionFilterState extends State<ActionFilter> {
  @override
  Widget build(BuildContext context) {
    final homepageBloc = BlocProvider.of<HomepageBloc>(context);
    homepageBloc.add(FilteringTodoList(parameter: parameter, hideDoneTasks: hideDoneTasks));

    return PopupMenuButton(
      icon: const Icon(Icons.filter_alt_outlined),
      onSelected: (value) {},
      itemBuilder: (context) {
        return <PopupMenuEntry<String>>[
          //performance filtering
          PopupMenuItem(
            child: ListTile(
              leading: const Icon(Icons.playlist_add_check),
              title: Text(
                S.of(context).performance,
                style: TextStyle(fontWeight: parameter == "is_ready" ? FontWeight.w900 : FontWeight.w400),
              ),
            ),
            onTap: () {
              parameter = "is_ready";

              homepageBloc.add(FilteringTodoList(parameter: "is_ready", hideDoneTasks: hideDoneTasks));
            },
          ),
          //end date filtering
          PopupMenuItem(
            child: ListTile(
              leading: const Icon(Icons.date_range),
              title: Text(
                S.of(context).finishDate,
                style: TextStyle(
                  fontWeight: parameter == "finish_date" ? FontWeight.w900 : FontWeight.w400,
                ),
              ),
            ),
            onTap: () {
              parameter = "finish_date";

              homepageBloc.add(FilteringTodoList(parameter: "finish_date", hideDoneTasks: hideDoneTasks));
            },
          ),
          //creation date filtering filtering
          PopupMenuItem(
            child: ListTile(
              leading: const Icon(Icons.add_comment_rounded),
              title: Text(
                S.of(context).creationDate,
                style: TextStyle(
                  fontWeight: parameter == "create_at" ? FontWeight.w900 : FontWeight.w400,
                ),
              ),
            ),
            onTap: () {
              parameter = "create_at";

              homepageBloc.add(FilteringTodoList(parameter: "create_at", hideDoneTasks: hideDoneTasks));
            },
          ),
          const PopupMenuDivider(),

          //hide tasks checker
          PopupMenuItem(
            child: ListTile(
              leading: Checkbox(
                value: hideDoneTasks,
                onChanged: (value) {
                  Navigator.pop(context);
                  hideDoneTasks = value!;
                  homepageBloc.add(FilteringTodoList(parameter: parameter, hideDoneTasks: value));
                },
              ),
              title: Text(
                S.of(context).hideDoneTasks,
                style: const TextStyle(
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
            onTap: () {
              bool newValue = !hideDoneTasks;
              hideDoneTasks = newValue;
              homepageBloc.add(FilteringTodoList(parameter: parameter, hideDoneTasks: newValue));
            },
          ),
        ];
      },
    );
  }
}

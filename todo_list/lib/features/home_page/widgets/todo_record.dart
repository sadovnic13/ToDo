import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:todo_list/features/home_page/bloc/homepage_bloc.dart';
import 'package:todo_list/generated/l10n.dart';

import '../../../repositories/repositories.dart';

///Task card widget
///[todo] - task instance
///[homepageBloc] - page block
///[parameter] - sorting parameter
///[hideDoneTasks] - display parameter
class ToDoRecord extends StatefulWidget {
  const ToDoRecord({super.key, required this.todo, required this.parameter, required this.hideDoneTasks});
  final ToDo todo;
  final String parameter;
  final bool hideDoneTasks;

  @override
  State<ToDoRecord> createState() => _ToDoRecordState();
}

class _ToDoRecordState extends State<ToDoRecord> {
  late bool isReady;

  @override
  void initState() {
    super.initState();
    isReady = widget.todo.isReady;
  }

  @override
  Widget build(BuildContext context) {
    final ToDoRepositories toDoRepositories = ToDoRepositories();
    final homepageBloc = BlocProvider.of<HomepageBloc>(context);

    return Card(
      child: ListTile(
        //task completion check box
        leading: IconButton(
          icon: isReady ? const Icon(Icons.check_box) : const Icon(Icons.check_box_outline_blank),
          onPressed: () async {
            await toDoRepositories.markTodo(widget.todo.id, !isReady);
            setState(() {
              isReady = !isReady;
            });
          },
        ),
        //title task
        title: Text(
          widget.todo.title,
          style: TextStyle(decoration: isReady ? TextDecoration.lineThrough : TextDecoration.none),
        ),
        //description task
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              widget.todo.description,
              maxLines: 15,
              overflow: TextOverflow.ellipsis,
            ),
            Text(S.of(context).readyDateX(DateFormat('dd.MM.yyyy').format(widget.todo.finishDate)))
          ],
        ),
        //context menu of task actions
        trailing: PopupMenuButton(
          onSelected: (value) {},
          itemBuilder: (context) {
            return [
              PopupMenuItem(
                child: ListTile(
                  leading: const Icon(Icons.edit),
                  title: Text(S.of(context).edit),
                  onTap: () {
                    Navigator.pushReplacementNamed(context, '/edit_todo_page_screen', arguments: widget.todo);
                  },
                ),
              ),
              PopupMenuItem(
                child: ListTile(
                  leading: const Icon(Icons.delete),
                  title: Text(S.of(context).delete),
                  onTap: () {
                    Navigator.pop(context);
                    homepageBloc.add(DeleteToDoRecord(
                      id: widget.todo.id,
                      parameter: widget.parameter,
                      hideDoneTasks: widget.hideDoneTasks,
                    ));
                    setState(() {});
                  },
                ),
              ),
            ];
          },
        ),
      ),
    );
  }
}

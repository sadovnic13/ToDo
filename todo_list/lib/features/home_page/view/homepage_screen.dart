import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_list/generated/l10n.dart';

import '../../../util/util.dart';
import '../bloc/homepage_bloc.dart';
import '../home_page.dart';

/// Home page
class HomepageScreen extends StatefulWidget {
  const HomepageScreen({super.key});

  @override
  State<HomepageScreen> createState() => _HomepageScreenState();
}

///Basic state of the main screen
class _HomepageScreenState extends State<HomepageScreen> {
  @override
  void didChangeDependencies() {
    // homepageBloc.add(FilteringTodoList(parameter: parameter, hideDoneTasks: hideDoneTasks));
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    final homepageBloc = BlocProvider.of<HomepageBloc>(context);
    // homepageBloc.add(FilteringTodoList(parameter: parameter, hideDoneTasks: hideDoneTasks));
    return Scaffold(
      floatingActionButton: FloatingActionButton(
          onPressed: () {
            // ToDoRepositories().getAllTodo();
            Navigator.pushNamed(context, '/add_todo_page_screen');
          },
          child: const Icon(Icons.add)),
      appBar: AppBar(
        title: Text(S.of(context).yourTodoList),
        actions: const [
          ActionFilter(
              // parameter: parameter,
              // hideDoneTasks: hideDoneTasks,
              // onParameterChanged: updateParameter,
              // onHideDoneTasksChanged: updateHideCompletedTasks,
              )
        ],
      ),
      drawer: const Drawer(child: SideMenu()),
      body: BlocBuilder<HomepageBloc, HomepageState>(
        bloc: homepageBloc,
        builder: (context, state) {
          //case of loading all page data
          if (state is HomepageLoaded) {
            return RefreshIndicator(
              onRefresh: () async {
                homepageBloc.add(FilteringTodoList(parameter: parameter, hideDoneTasks: hideDoneTasks));
              },
              child: state.todoList.isEmpty
                  ? Center(
                      child: Text(S.of(context).youDontHavePlans),
                    )
                  : ListView.builder(
                      padding: const EdgeInsets.only(left: 10, right: 10, bottom: 100),
                      itemCount: state.todoList.length,
                      itemBuilder: (context, index) {
                        return ToDoRecord(
                            parameter: parameter, hideDoneTasks: hideDoneTasks, todo: state.todoList[index]);
                      },
                    ),
            );
          }

          if (state is HomepageFailure) {
            debugPrint('Error');
          }

          //case of loading data
          return const Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}

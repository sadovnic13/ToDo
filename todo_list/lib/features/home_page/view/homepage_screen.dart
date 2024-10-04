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
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    final homepageBloc = BlocProvider.of<HomepageBloc>(context);
    return Scaffold(
      floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.pushNamed(context, '/add_todo_page_screen');
          },
          child: const Icon(Icons.add)),
      appBar: AppBar(
        title: Text(S.of(context).yourTodoList),
        actions: const [ActionFilter()],
      ),
      drawer: const Drawer(child: SideMenu()),
      body: BlocConsumer<HomepageBloc, HomepageState>(
        bloc: homepageBloc,
        listener: (context, state) {
          if (state is HomepageFailure) {
            ScaffoldMessenger.of(context)
              ..hideCurrentSnackBar()
              ..showSnackBar(SnackBar(
                backgroundColor: Colors.black,
                content: Text(
                  S.of(context).tryAgainLater,
                  style: const TextStyle(color: Colors.white),
                ),
                duration: const Duration(seconds: 3),
              ));
          }
        },
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
            return Center(
              child: Text(state.exception.toString()),
            );
          }

          //case of loading data
          return const Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}

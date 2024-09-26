import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_list/generated/l10n.dart';
import 'package:todo_list/repositories/repositories.dart';

import '../bloc/logpage_bloc.dart';
import '../widgets/widgets.dart';

///Authorization screen
class LogPageScreen extends StatefulWidget {
  const LogPageScreen({super.key});

  @override
  State<LogPageScreen> createState() => _LogPageScreenState();
}

const List<String> list = <String>['One', 'Two', 'Three', 'Four'];

enum SampleItem { itemOne, itemTwo, itemThree }

class _LogPageScreenState extends State<LogPageScreen> {
  final LogpageBloc logpageBloc = LogpageBloc(LoginRepositories());
  SampleItem? selectedItem;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocListener<LogpageBloc, LogpageState>(
        bloc: logpageBloc,
        listener: (context, state) {
          //successful authorization case
          if (state is LoginSuccess) {
            Navigator.pushNamedAndRemoveUntil(
              context,
              '/home_page_screen',
              (route) => false,
            );
          }
          //case of authorization problems
          if (state is LoginFailure) {
            debugPrint(state.exception.toString());
            ScaffoldMessenger.of(context)
              ..hideCurrentSnackBar()
              ..showSnackBar(SnackBar(
                backgroundColor: Colors.red[700],
                content: Text(
                  state.exception.toString(),
                  style: const TextStyle(color: Colors.black),
                ),
                duration: const Duration(seconds: 3),
              ));
          }
        },
        child: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                //body icon
                Container(
                  height: 150,
                  width: 150,
                  margin: const EdgeInsets.only(top: 50, bottom: 10),
                  padding: const EdgeInsets.all(35),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(75),
                  ),
                  child: const Icon(
                    Icons.person,
                    size: 100,
                  ),
                ),
                //data entry form
                InputForm(
                  logpageBloc: logpageBloc,
                ),
                //registration offer
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        S.of(context).noAccountYet,
                      ),
                      const SizedBox(width: 4),
                      GestureDetector(
                        onTap: () {
                          Navigator.pushReplacementNamed(context, '/reg_page_screen');
                        },
                        child: Text(
                          S.of(context).signUp,
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_list/generated/l10n.dart';
import 'package:todo_list/repositories/repositories.dart';

import '../bloc/regpage_bloc.dart';
import '../widgets/widgets.dart';

///Registration screen
class RegPageScreen extends StatefulWidget {
  const RegPageScreen({super.key});

  @override
  State<RegPageScreen> createState() => _RegPageScreenState();
}

class _RegPageScreenState extends State<RegPageScreen> {
  final RegpageBloc regpageBloc = RegpageBloc(RegistrationRepositories());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocListener<RegpageBloc, RegpageState>(
        bloc: regpageBloc,
        listener: (context, state) {
          //success transition
          if (state is RegistrationSuccess) {
            Navigator.pushNamedAndRemoveUntil(
              context,
              '/log_page_screen',
              (route) => false,
            );
          }
          //error message
          if (state is RegistrationFailure) {
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
                    Icons.person_add,
                    size: 100,
                  ),
                ),
                InputForm(
                  regpageBloc: regpageBloc,
                ),

                //authorization offer
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        S.of(context).alreadyHaveAnAccount,
                      ),
                      const SizedBox(width: 4),
                      GestureDetector(
                        onTap: () {
                          Navigator.pushReplacementNamed(context, '/log_page_screen');
                        },
                        child: Text(
                          S.of(context).logIn,
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

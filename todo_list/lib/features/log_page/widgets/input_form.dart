import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_list/generated/l10n.dart';

import '../bloc/logpage_bloc.dart';
import '../log_page.dart';

///Data entry form
///[logpageBloc] - screen bloc
class InputForm extends StatefulWidget {
  final LogpageBloc logpageBloc;
  const InputForm({super.key, required this.logpageBloc});

  @override
  State<InputForm> createState() => _InputFormState();
}

class _InputFormState extends State<InputForm> {
  //controllers
  final TextEditingController _loginController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  void dispose() {
    _loginController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 400,
      child: Column(
        children: [
          // username textfield
          DataTextField(
            controller: _loginController,
            hintText: S.of(context).login,
            obscureText: false,
          ),
          const SizedBox(height: 10),

          // password textfield
          DataTextField(
            controller: _passwordController,
            hintText: S.of(context).password,
            obscureText: true,
          ),

          const SizedBox(height: 25),

          // sign in button
          SizedBox(
            height: 40,
            width: 200,
            child: BlocBuilder<LogpageBloc, LogpageState>(
              bloc: widget.logpageBloc,
              builder: (context, state) {
                if (state is LoginLoading) {
                  return const ElevatedButton(
                    onPressed: null,
                    child: SizedBox(
                      height: 20,
                      width: 20,
                      child: CircularProgressIndicator(
                        strokeWidth: 3,
                      ),
                    ),
                  );
                }

                return ElevatedButton(
                  child: Text(
                    S.of(context).signIn,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  onPressed: () {
                    widget.logpageBloc
                        .add(SignInUser(email: _loginController.text, password: _passwordController.text));
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

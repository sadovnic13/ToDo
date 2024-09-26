import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_list/generated/l10n.dart';

import '../bloc/regpage_bloc.dart';
import 'widgets.dart';

///Data entry form
///[regpageBloc] - screen bloc
class InputForm extends StatefulWidget {
  final RegpageBloc regpageBloc;
  const InputForm({super.key, required this.regpageBloc});
  @override
  State<InputForm> createState() => _InputFormState();
}

class _InputFormState extends State<InputForm> {
  //controllers
  final TextEditingController _loginController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _repeatPasswordController = TextEditingController();

  @override
  void dispose() {
    _loginController.dispose();
    _passwordController.dispose();
    _repeatPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 400,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // username textfield
          DataTextField(
            controller: _loginController,
            // hintText: S.of(context).email,
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

          // password textfield
          DataTextField(
            controller: _repeatPasswordController,
            hintText: S.of(context).repeatPassword,
            obscureText: true,
          ),

          const SizedBox(height: 25),

          // sign up button
          SizedBox(
            height: 40,
            child: BlocBuilder<RegpageBloc, RegpageState>(
              bloc: widget.regpageBloc,
              builder: (context, state) {
                if (state is RegistrationLoading) {
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
                    S.of(context).signUp,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      // fontSize: fontSize20,
                    ),
                  ),
                  onPressed: () {
                    widget.regpageBloc.add(SignUpUser(
                      login: _loginController.text,
                      password: _passwordController.text,
                      repeatedPassword: _repeatPasswordController.text,
                    ));
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

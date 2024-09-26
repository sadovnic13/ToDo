import 'package:flutter/material.dart';

///data entry widget
///[controller] - controller
///[hintText] - hintText
///[obscureText] - obscureText
class DataTextField extends StatelessWidget {
  final controller;
  final String hintText;
  final bool obscureText;

  const DataTextField({
    super.key,
    required this.controller,
    required this.hintText,
    required this.obscureText,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25.0),
      child: TextField(
        controller: controller,
        obscureText: obscureText,
        style: theme.textTheme.titleMedium,
        decoration: InputDecoration(
          label: Text(hintText),
        ),
      ),
    );
  }
}

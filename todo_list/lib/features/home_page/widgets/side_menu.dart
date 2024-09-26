import 'package:flutter/material.dart';
import 'package:todo_list/features/settings_page/view/settings_page_screen.dart';
import 'package:todo_list/generated/l10n.dart';

class SideMenu extends StatelessWidget {
  const SideMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              DrawerHeader(
                decoration: BoxDecoration(
                  color: Theme.of(context).primaryColor,
                ),
                child: const Center(
                  child: Icon(
                    Icons.list_alt,
                    size: 100,
                  ),
                ),
              ),
              InkWell(
                child: Container(
                  padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                  child: Row(
                    children: [
                      const Icon(Icons.settings),
                      const SizedBox(width: 5),
                      Text(
                        S.of(context).settings,
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
                onTap: () {
                  Navigator.popAndPushNamed(context, '/settings_page_screen');
                },
              )
            ],
          ),
        ),
        TextButton(
          onPressed: () {
            settingsBox.delete("token");
            Navigator.pushNamedAndRemoveUntil(
              context,
              '/log_page_screen',
              (route) => false,
            );
          },
          style: const ButtonStyle(overlayColor: WidgetStatePropertyAll(Colors.transparent)),
          child: Text(
            S.of(context).logOut,
          ),
        )
      ],
    );
  }
}

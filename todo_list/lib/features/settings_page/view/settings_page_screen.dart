import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:todo_list/generated/l10n.dart';

class SettingsPageScreen extends StatefulWidget {
  const SettingsPageScreen({super.key});

  @override
  State<SettingsPageScreen> createState() => SettingsStatePageScreen();
}

class SettingsStatePageScreen extends State<SettingsPageScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(S.of(context).settings),
      ),
      body: const Padding(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            LanguageSelector(),
            ColorSelector(),
          ],
        ),
      ),
    );
  }
}

class LanguageSelector extends StatefulWidget {
  const LanguageSelector({super.key});

  @override
  State<LanguageSelector> createState() => _LanguageSelectorState();
}

Map<String, String> items = {
  "English": "en",
  "Русский": "ru",
  "中文": "zh",
  "العربية": "ar",
  "Español": "es",
};
final settingsBox = Hive.box('settings');

class _LanguageSelectorState extends State<LanguageSelector> {
  String? selectedItem = items.keys.firstWhere((k) => items[k] == settingsBox.get("language"), orElse: () => "English");
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          S.of(context).selectLanguage,
          style: const TextStyle(fontSize: 16),
        ),
        const SizedBox(width: 5),
        DropdownButton<String>(
          value: selectedItem,
          items: items.keys
              .map((item) => DropdownMenuItem<String>(
                    value: item,
                    child: Text(item),
                  ))
              .toList(),
          onChanged: (item) {
            setState(() => selectedItem = item);
            settingsBox.put('language', items[item]);
            ScaffoldMessenger.of(context)
              ..hideCurrentSnackBar()
              ..showSnackBar(SnackBar(
                backgroundColor: Colors.black,
                content: Text(
                  S.of(context).pleaseRestartTheApplication,
                  style: TextStyle(color: Colors.white),
                ),
                duration: Duration(seconds: 3),
              ));
          },
        ),
      ],
    );
  }
}

List<String> colors = ["65558F", "304FFE", "0091EA", "00C853", "F4FF81", "FF9100"];

class ColorSelector extends StatefulWidget {
  const ColorSelector({super.key});

  @override
  State<ColorSelector> createState() => _ColorSelectorState();
}

class _ColorSelectorState extends State<ColorSelector> {
  String? selectedItem = settingsBox.get("systemColor");
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          S.of(context).selectColor,
          style: const TextStyle(fontSize: 16),
        ),
        const SizedBox(width: 5),
        DropdownButton<String>(
          value: selectedItem,
          items: colors
              .map((color) => DropdownMenuItem<String>(
                    value: color,
                    child: Container(
                      margin: const EdgeInsets.all(5),
                      width: 50,
                      color: Color(int.parse('0xff$color')),
                    ),
                  ))
              .toList(),
          onChanged: (item) {
            setState(() => selectedItem = item);
            settingsBox.put('systemColor', item);
            ScaffoldMessenger.of(context)
              ..hideCurrentSnackBar()
              ..showSnackBar(const SnackBar(
                backgroundColor: Colors.black,
                content: Text(
                  "Please, restart the application.",
                  style: TextStyle(color: Colors.white),
                ),
                duration: Duration(seconds: 3),
              ));
          },
        ),
      ],
    );
  }
}

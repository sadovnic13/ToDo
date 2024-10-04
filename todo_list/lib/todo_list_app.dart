import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:hive/hive.dart';

import 'features/home_page/bloc/homepage_bloc.dart';
import 'generated/l10n.dart';
import 'repositories/repositories.dart';
import 'router/router.dart';

final settingsBox = Hive.box('settings');

class ToDoList extends StatelessWidget {
  const ToDoList({super.key});

  @override
  Widget build(BuildContext context) {
    BoxDefaultParameterInit();
    return BlocProvider(
      create: (context) => HomepageBloc(ToDoRepositories()),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        routes: routes,
        localizationsDelegates: const [
          S.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: S.delegate.supportedLocales,
        locale: Locale(settingsBox.get('language')),
        theme: ThemeData(
          fontFamily: 'Sora',
          visualDensity: VisualDensity.adaptivePlatformDensity,
          colorScheme: ColorScheme.fromSeed(seedColor: Color(int.parse('0xff${settingsBox.get("systemColor")}'))),
        ),
        initialRoute: settingsBox.get("token") != null ? '/home_page_screen' : '/log_page_screen',
      ),
    );
  }

  void BoxDefaultParameterInit() {
    if (settingsBox.get('language') == null) {
      settingsBox.put('language', 'en');
    }

    if (settingsBox.get('systemColor') == null) {
      settingsBox.put('systemColor', '65558F');
    }
  }
}

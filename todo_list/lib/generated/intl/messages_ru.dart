// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a ru locale. All the
// messages from the main program should be duplicated here with the same
// function name.

// Ignore issues from commonly used lints in this file.
// ignore_for_file:unnecessary_brace_in_string_interps, unnecessary_new
// ignore_for_file:prefer_single_quotes,comment_references, directives_ordering
// ignore_for_file:annotate_overrides,prefer_generic_function_type_aliases
// ignore_for_file:unused_import, file_names, avoid_escaping_inner_quotes
// ignore_for_file:unnecessary_string_interpolations, unnecessary_string_escapes

import 'package:intl/intl.dart';
import 'package:intl/message_lookup_by_library.dart';

final messages = new MessageLookup();

typedef String MessageIfAbsent(String messageStr, List<dynamic> args);

class MessageLookup extends MessageLookupByLibrary {
  String get localeName => 'ru';

  static String m0(date) => "Дата готовности: ${date}";

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
        "alreadyHaveAnAccount":
            MessageLookupByLibrary.simpleMessage("Уже есть аккаунт?"),
        "creationDate": MessageLookupByLibrary.simpleMessage("Дата создания"),
        "delete": MessageLookupByLibrary.simpleMessage("Удалить"),
        "description": MessageLookupByLibrary.simpleMessage("Описание"),
        "edit": MessageLookupByLibrary.simpleMessage("Изменить"),
        "email": MessageLookupByLibrary.simpleMessage("Электронная почта"),
        "error": MessageLookupByLibrary.simpleMessage("Ошибка!"),
        "finishDate": MessageLookupByLibrary.simpleMessage("Срок выполнения"),
        "hideDoneTasks":
            MessageLookupByLibrary.simpleMessage("Скрыть выполненные"),
        "invalidLoginOrPassword":
            MessageLookupByLibrary.simpleMessage("Неверный логин или пароль"),
        "logIn": MessageLookupByLibrary.simpleMessage("Авторизуйся"),
        "logOut": MessageLookupByLibrary.simpleMessage("Выйти"),
        "login": MessageLookupByLibrary.simpleMessage("Войти"),
        "noAccountYet":
            MessageLookupByLibrary.simpleMessage("Еще нет аккаунта?"),
        "password": MessageLookupByLibrary.simpleMessage("Пароль"),
        "performance": MessageLookupByLibrary.simpleMessage("Завершенность"),
        "pleaseEnterText":
            MessageLookupByLibrary.simpleMessage("Пожалуйста введите текст"),
        "readyDateX": m0,
        "repeatPassword":
            MessageLookupByLibrary.simpleMessage("Повторите пароль"),
        "save": MessageLookupByLibrary.simpleMessage("Сохранить"),
        "selectColor": MessageLookupByLibrary.simpleMessage("Выберите цвет"),
        "selectLanguage": MessageLookupByLibrary.simpleMessage("Выберите язык"),
        "settings": MessageLookupByLibrary.simpleMessage("Настройки"),
        "signIn": MessageLookupByLibrary.simpleMessage("Войти"),
        "signUp": MessageLookupByLibrary.simpleMessage("Регистрируйся"),
        "title": MessageLookupByLibrary.simpleMessage("Заголовок"),
        "youDontHavePlans":
            MessageLookupByLibrary.simpleMessage("У вас нет задач"),
        "yourTodoList": MessageLookupByLibrary.simpleMessage("Ваш список задач")
      };
}

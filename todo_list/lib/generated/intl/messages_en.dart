// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a en locale. All the
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
  String get localeName => 'en';

  static String m0(date) => "Ready date: ${date}";

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
        "alreadyHaveAnAccount":
            MessageLookupByLibrary.simpleMessage("Already have an account?"),
        "creationDate": MessageLookupByLibrary.simpleMessage("Сreation date"),
        "delete": MessageLookupByLibrary.simpleMessage("Delete"),
        "description": MessageLookupByLibrary.simpleMessage("Description"),
        "edit": MessageLookupByLibrary.simpleMessage("Edit"),
        "email": MessageLookupByLibrary.simpleMessage("E-mail"),
        "error": MessageLookupByLibrary.simpleMessage("Error!"),
        "finishDate": MessageLookupByLibrary.simpleMessage("Finish date"),
        "hideDoneTasks":
            MessageLookupByLibrary.simpleMessage("Hide done tasks"),
        "invalidLoginOrPassword":
            MessageLookupByLibrary.simpleMessage("Invalid login or password"),
        "logIn": MessageLookupByLibrary.simpleMessage("Log in"),
        "logOut": MessageLookupByLibrary.simpleMessage("Log out"),
        "login": MessageLookupByLibrary.simpleMessage("Login"),
        "noAccountYet": MessageLookupByLibrary.simpleMessage("No account yet?"),
        "password": MessageLookupByLibrary.simpleMessage("Password"),
        "performance": MessageLookupByLibrary.simpleMessage("Performance"),
        "pleaseEnterText":
            MessageLookupByLibrary.simpleMessage("Please enter text"),
        "pleaseRestartTheApplication": MessageLookupByLibrary.simpleMessage(
            "Please, restart the application"),
        "readyDateX": m0,
        "reationDate": MessageLookupByLibrary.simpleMessage("Сreation date"),
        "repeatPassword":
            MessageLookupByLibrary.simpleMessage("Repeat password"),
        "save": MessageLookupByLibrary.simpleMessage("Save"),
        "selectColor": MessageLookupByLibrary.simpleMessage("Select color"),
        "selectLanguage":
            MessageLookupByLibrary.simpleMessage("Select language"),
        "settings": MessageLookupByLibrary.simpleMessage("Settings"),
        "signIn": MessageLookupByLibrary.simpleMessage("Sign in"),
        "signUp": MessageLookupByLibrary.simpleMessage("Sign up"),
        "title": MessageLookupByLibrary.simpleMessage("Title"),
        "tryAgainLater":
            MessageLookupByLibrary.simpleMessage("Try again later"),
        "youDontHavePlans":
            MessageLookupByLibrary.simpleMessage("You don\'t have plans"),
        "yourTodoList": MessageLookupByLibrary.simpleMessage("Your ToDo list")
      };
}

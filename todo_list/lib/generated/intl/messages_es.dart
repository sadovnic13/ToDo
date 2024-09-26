// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a es locale. All the
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
  String get localeName => 'es';

  static String m0(date) => "Fecha prevista: ${date}";

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
        "alreadyHaveAnAccount":
            MessageLookupByLibrary.simpleMessage("¿Ya tienes una cuenta?"),
        "creationDate":
            MessageLookupByLibrary.simpleMessage("Fecha de creación"),
        "delete": MessageLookupByLibrary.simpleMessage("Eliminar"),
        "description": MessageLookupByLibrary.simpleMessage("Descripción"),
        "edit": MessageLookupByLibrary.simpleMessage("Editar"),
        "email": MessageLookupByLibrary.simpleMessage("Correo electrónico"),
        "error": MessageLookupByLibrary.simpleMessage("¡Error!"),
        "finishDate":
            MessageLookupByLibrary.simpleMessage("Fecha de finalización"),
        "hideDoneTasks":
            MessageLookupByLibrary.simpleMessage("Ocultar tareas completadas"),
        "invalidLoginOrPassword": MessageLookupByLibrary.simpleMessage(
            "Usuario o contraseña inválidos"),
        "logIn": MessageLookupByLibrary.simpleMessage("Iniciar sesión"),
        "logOut": MessageLookupByLibrary.simpleMessage("Cerrar sesión"),
        "login": MessageLookupByLibrary.simpleMessage("Iniciar sesión"),
        "noAccountYet":
            MessageLookupByLibrary.simpleMessage("¿Aún no tienes cuenta?"),
        "password": MessageLookupByLibrary.simpleMessage("Contraseña"),
        "performance": MessageLookupByLibrary.simpleMessage("Rendimiento"),
        "pleaseEnterText":
            MessageLookupByLibrary.simpleMessage("Por favor, ingresa texto"),
        "readyDateX": m0,
        "repeatPassword":
            MessageLookupByLibrary.simpleMessage("Repetir contraseña"),
        "save": MessageLookupByLibrary.simpleMessage("Guardar"),
        "selectColor":
            MessageLookupByLibrary.simpleMessage("Seleccionar color"),
        "selectLanguage":
            MessageLookupByLibrary.simpleMessage("Seleccionar idioma"),
        "settings": MessageLookupByLibrary.simpleMessage("Ajustes"),
        "signIn": MessageLookupByLibrary.simpleMessage("Iniciar sesión"),
        "signUp": MessageLookupByLibrary.simpleMessage("Registrarse"),
        "title": MessageLookupByLibrary.simpleMessage("Título"),
        "youDontHavePlans":
            MessageLookupByLibrary.simpleMessage("No tienes planes"),
        "yourTodoList":
            MessageLookupByLibrary.simpleMessage("Tu lista de tareas")
      };
}

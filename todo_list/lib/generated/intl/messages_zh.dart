// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a zh locale. All the
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
  String get localeName => 'zh';

  static String m0(date) => "准备日期: ${date}";

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
        "alreadyHaveAnAccount": MessageLookupByLibrary.simpleMessage("已经有账号了?"),
        "creationDate": MessageLookupByLibrary.simpleMessage("创建日期"),
        "delete": MessageLookupByLibrary.simpleMessage("删除"),
        "description": MessageLookupByLibrary.simpleMessage("描述"),
        "edit": MessageLookupByLibrary.simpleMessage("编辑"),
        "email": MessageLookupByLibrary.simpleMessage("电子邮件"),
        "error": MessageLookupByLibrary.simpleMessage("错误!"),
        "finishDate": MessageLookupByLibrary.simpleMessage("截止日期"),
        "hideDoneTasks": MessageLookupByLibrary.simpleMessage("隐藏已完成任务"),
        "invalidLoginOrPassword":
            MessageLookupByLibrary.simpleMessage("无效的登录或密码"),
        "logIn": MessageLookupByLibrary.simpleMessage("登录"),
        "logOut": MessageLookupByLibrary.simpleMessage("登出"),
        "login": MessageLookupByLibrary.simpleMessage("登录"),
        "noAccountYet": MessageLookupByLibrary.simpleMessage("还没有账号?"),
        "password": MessageLookupByLibrary.simpleMessage("密码"),
        "performance": MessageLookupByLibrary.simpleMessage("完成情况"),
        "pleaseEnterText": MessageLookupByLibrary.simpleMessage("请输入文本"),
        "readyDateX": m0,
        "repeatPassword": MessageLookupByLibrary.simpleMessage("重复密码"),
        "save": MessageLookupByLibrary.simpleMessage("保存"),
        "selectColor": MessageLookupByLibrary.simpleMessage("选择颜色"),
        "selectLanguage": MessageLookupByLibrary.simpleMessage("选择语言"),
        "settings": MessageLookupByLibrary.simpleMessage("设置"),
        "signIn": MessageLookupByLibrary.simpleMessage("登录"),
        "signUp": MessageLookupByLibrary.simpleMessage("注册"),
        "title": MessageLookupByLibrary.simpleMessage("标题"),
        "youDontHavePlans": MessageLookupByLibrary.simpleMessage("你没有计划"),
        "yourTodoList": MessageLookupByLibrary.simpleMessage("你的待办事项")
      };
}

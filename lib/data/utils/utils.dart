import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:recipes/data/utils/print_utils.dart';

class Utils {
  static Map<int, String> languagesMap = {
    0: 'en',
  };
  static String appName = '';
  static String packageName = '';

  static String version = '';
  static String buildNumber = '';

  Future<void> init() async {}

  static bool identicalString(String s1, String s2) {
    return s1 == s2;
  }

  static List<Locale> locales() => [
        Locale('en'),
      ];

  static Future<void> captureException(
      Object exception, StackTrace stackTrace) async {
    if (kReleaseMode) {
      if (kDebugMode) {
        print('\x1B[31m$exception====>$stackTrace\x1B[0m');
      }
    } else {
      if (kDebugMode) {
        print('\x1B[31m$exception====>$stackTrace\x1B[0m');
      }
    }
  }

  static printNormal(String value) {
    PrintUtils.printColorText('-----Start-------', PrintColor.Yellow);
    PrintUtils.printColorText(value, PrintColor.Black);
    PrintUtils.printColorText('-----End-------', PrintColor.Cyan);
  }
}

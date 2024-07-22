
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:recipes/data/utils/base/bloc_wrapper.dart';
import 'package:recipes/data/utils/base/cubit.dart';


extension StringExtension on String {
  String append(String s) => this + s;

  String appendSpace() => "$this ";

  String appendDot() => "$this\u2022";

  String nextLine() => "$this\n";

  int toInt() => toDouble().toInt();

  double toDouble() => double.parse(isEmpty ? '0' : this);

  String format(List<String> params) => interpolate(this, params);

  String toFirstLetterCapital() =>
      substring(0, 1).toUpperCase().append(substring(1).toLowerCase());

  String showIf(bool condition) {
    return condition ? this : "";
  }

  toMaskedAccountOrUpi() {
    if (length > 4) {
      if (contains("@")) {
        String upi = splitBefore("@");
        String upiVendor = splitAfter("@");
        if (upi.length > 4) {
          String firstPart = upi.substring(0, upi.length - 4);
          String secondPart = upi.substring(upi.length - 4);
          return firstPart
              .replaceAll(RegExp("[0-9A-Za-z.-]"), "X")
              .append(secondPart)
              .append("@")
              .append(upiVendor);
        } else {
          return this;
        }
      } else {
        String firstPart = substring(0, length - 4);
        String secondPart = substring(length - 4);
        return firstPart
            .replaceAll(RegExp("[0-9A-Za-z.-]"), "X")
            .append(secondPart);
      }
    } else {
      return this;
    }
  }

  /// Splits from a [pattern] and returns remaining String after that
  String splitAfter(Pattern pattern) {
    ArgumentError.checkNotNull(pattern, 'pattern');
    var matchIterator = pattern.allMatches(this).iterator;

    if (matchIterator.moveNext()) {
      var match = matchIterator.current;
      var length = match.end - match.start;
      return validate().substring(match.start + length);
    }
    return '';
  }

  /// Splits from a [pattern] and returns String before that
  String splitBefore(Pattern pattern) {
    ArgumentError.checkNotNull(pattern, 'pattern');
    var matchIterator = pattern.allMatches(validate()).iterator;

    Match? match;
    while (matchIterator.moveNext()) {
      match = matchIterator.current;
    }

    if (match != null) {
      return validate().substring(0, match.start);
    }
    return '';
  }

  /// Returns true if given String is null or isEmpty
  bool get isEmptyOrNull => (this.isEmpty) || (this == 'null');

  // Check null string, return given value if null
  String validate({String value = ''}) {
    if (isEmptyOrNull) {
      return value;
    } else {
      return this;
    }
  }

  /// Capitalize given String
  String capitalizeFirstLetter() => (validate().length >= 1)
      ? (this.substring(0, 1).toUpperCase() + this.substring(1).toLowerCase())
      : validate();
}

extension StringNullExtension on String? {
  String toSafeValue() {
    return this ?? "";
  }

  String toProfilePicture() {
    return this ?? "";
  }
}

extension NumExtension on num? {
  num toSafeValue() {
    return this ?? 0;
  }

}

String interpolate(String string, List<String> params) {
  String result = string;
  for (int i = 1; i < params.length + 1; i++) {
    result = result.replaceAll('%$i\$', params[i - 1]);
  }

  return result;
}

extension IntExntension on int {
  int increment() => this + 1;

  int decrement() => this - 1;

  bool isValid() {
    return this > 0;
  }

  int toUntilPositive() {
    return this < 0 ? 0 : this;
  }



  /// Validate given int is not null and returns given value if null.
  int validate({int value = 0}) {
    return this;
  }

  /// Leaves given height of space
  Widget get height => SizedBox(height: this.toDouble());



  /// Leaves given width of space
  Widget get width => SizedBox(width: this.toDouble());
}


extension IntNullExntension on int? {
  int toSafeValue() {
    return this ?? 0;
  }

  bool isValid() {
    return toSafeValue() > 0;
  }
}

extension FileIntExntension on int {
  int toMB() {
    return (this ~/ 1024) ~/ 1024;
  }

  int toGB() {
    return ((this ~/ 1024) ~/ 1024) ~/ 1024;
  }

  int toKB() {
    return (this ~/ 1024);
  }
}

extension DoubleNullExntension on double? {
  double toSafeValue() {
    return this ?? 0;
  }
}

extension DoubleExntension on double {

  double toUntilPositive() {
    return this < 0 ? 0 : this;
  }

  /// Validate given double is not null and returns given value if null.
  double validate({double value = 0.0}) => this;
}

extension BoolNullExntension on bool? {
  bool toSafeValue() {
    return this ?? false;
  }

  /// Validate given bool is not null and returns given value if null.
  bool validate({bool value = false}) => this ?? value;
}

extension ContextExtension on BuildContext {

  TextTheme get textTheme {
    return Theme.of(this).textTheme;
  }

  NavigatorState get navigate {
    return Navigator.of(this);
  }

  T provider<T extends ChangeNotifier>() {
    return Provider.of<T>(this, listen: false);
  }

  push(Widget widget) => navigate.push(
        MaterialPageRoute(
          builder: (_) {
            if (widget is BlocWrapper) {
              return WrappedWidget(child: widget as BlocWrapper);
            }
            return widget;
          },
        ),
      );

  T readBloc<T extends Bloc>() => BlocProvider.of<T>(this, listen: false);

  T watchBloc<T extends Bloc>() => BlocProvider.of<T>(this, listen: true);
}

extension NotifierWidget on Widget {
  Consumer consumer<T>() {
    return Consumer<T>(builder: (context, notifier, child) {
      return this;
    });
  }

  BlocProvider<C> cubitProvider<C extends AppBloc>(AppBloc cubit) {
    return BlocProvider.value(
      value: cubit as C,
      child: this,
    );
  }

  ChangeNotifierProvider<C> notifierProvider<C extends ChangeNotifier>(
      ChangeNotifier notifier) {
    return ChangeNotifierProvider.value(
      value: notifier as C,
      child: this,
    );
  }
}

extension ExtObject on Object? {
  bool isNotNull() {
    return this != null;
  }

  T? passIfTrue<T>(bool condition) {
    return condition ? this as T : null;
  }
}

extension MapDefaultValue on Map<String, dynamic> {
  T getOrDefault<T>(String key, T defaultValue) {
    return this[key] ?? defaultValue;
  }

  int getInt(String key) {
    return getOrDefault(key, 0);
  }

  String getString(String key) {
    return getOrDefault(key, '');
  }

  bool getBool(String key) {
    return getOrDefault(key, false);
  }

  double getDouble(String key) {
    return (getOrDefault(key, 0.0)).toDouble();
  }

  num getNum(String key) {
    return (getOrDefault(key, 0));
  }
}

extension SettingDefaultValuesOnDynamic on dynamic {
  int toSafeInt({int defaultValue = 0}) {
    return this ?? defaultValue;
  }

  bool toSafeBool({bool defaultValue = false}) {
    return this ?? defaultValue;
  }

  double toSafeDouble({double defaultValue = 0}) {
    return this ?? defaultValue;
  }

  int toSafeNum({num defaultValue = 0}) {
    return this ?? defaultValue;
  }


}

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:recipes/presentation/styles/theme_color.dart';



class AppTheme {
  // Define your preferred light and dark colors
// Define your preferred light and dark colors
  static const Color lightBackgroundColor = Color(0xffF1F5FB);
  static const Color darkBackgroundColor = Colors.black54;

  static const Color lightPrimaryColor = Colors.blue;
  static const Color darkPrimaryColor = Colors.blueGrey;

  static const Color lightTextColor = Colors.black;
  static const Color darkTextColor = Colors.white;



  static ElevatedButtonThemeData get elevatedButtonThemeData =>
      ElevatedButtonThemeData(
        style: ButtonStyle(
          shape: MaterialStateProperty.all(RoundedRectangleBorder(
              side: const BorderSide(
                  style: BorderStyle.solid, color: ThemeColor.black),
              borderRadius: BorderRadius.circular(20))),
          backgroundColor: MaterialStateProperty.resolveWith<Color>(
              (Set<MaterialState> states) {
            return Colors.grey.shade400;
          }),
          foregroundColor: MaterialStateProperty.resolveWith<Color>(
              (Set<MaterialState> states) {
            if (states.contains(MaterialState.pressed)) {
              return Colors.black; // the color when button is pressed
            }
            return Colors.black; // the color when button is not pressed
          }),
        ),
      );

  OutlinedButtonThemeData get outlineButtonThemeData =>
      const OutlinedButtonThemeData(style: ButtonStyle());

  ButtonThemeData get buttonTheme => const ButtonThemeData();

  static ThemeData themeData(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: Colors.white,
        statusBarIconBrightness: Brightness.dark,
        statusBarBrightness: Brightness.dark,
      ),
    );
    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.light,
      cardColor: const Color(0xFFFFFFFF),
      appBarTheme: AppBarTheme(
          color: Colors.white,
          centerTitle: true,
          shadowColor: Colors.grey.shade200,
          foregroundColor: Colors.black,
          surfaceTintColor: Colors.white
          // backgroundColor: Colors.white,
          ),
      cardTheme: const CardTheme(color: Colors.white, surfaceTintColor: Colors.white),
      bottomSheetTheme: const BottomSheetThemeData(
          backgroundColor: Colors.white, surfaceTintColor: Colors.white),
      buttonTheme: const ButtonThemeData(
          buttonColor: Colors.white, disabledColor: Colors.grey),
      bottomAppBarTheme: BottomAppBarTheme(
          surfaceTintColor: Colors.white,
          color: Colors.white,
          elevation: 2,
          shadowColor: Colors.grey.shade200),
      bottomNavigationBarTheme:
          const BottomNavigationBarThemeData(backgroundColor: Colors.white),
      // elevatedButtonTheme: ElevatedButtonThemeData(
      //     style: ButtonStyle(
      //   // foregroundColor: MaterialStateProperty.resolveWith<Color>(
      //   //     (Set<MaterialState> states) {
      //   //   return Colors.black;
      //   // }),
      //   elevation: MaterialStateProperty.resolveWith<double>(
      //       (Set<MaterialState> states) {
      //     return 2.0;
      //   }),
      //
      //
      //   // surfaceTintColor: MaterialStateProperty.resolveWith<Color>(
      //   //     (Set<MaterialState> states) {
      //   //   return Colors.white;
      //   // }),
      //   // backgroundColor: MaterialStateProperty.resolveWith<Color>(
      //   //     (Set<MaterialState> states) {
      //   //   return Colors.white;
      //   // }),
      // )),
      colorScheme: const ColorScheme(
        brightness: Brightness.light,
        primary: Color(0xFF000000),
        onPrimary: Color(0xFFFFFFFF),
        primaryContainer: Color(0xFF000000),
        onPrimaryContainer: Color(0xFF082100),
        secondary: Color(0xFF55624C),
        onSecondary: Color(0xFFFFFFFF),
        secondaryContainer: Color(0xFFFFFFFF),
        onSecondaryContainer: Color(0xFF131F0D),
        tertiary: Color(0xFF396A1E),
        onTertiary: Color(0xFFFFFFFF),
        tertiaryContainer: Color(0xFFB9F396),
        onTertiaryContainer: Color(0xFF082100),
        error: Color(0xFFBA1A1A),
        errorContainer: Color(0xFFFFDAD6),
        onError: Color(0xFFFFFFFF),
        onErrorContainer: Color(0xFF410002),
        background: Color(0xFFFFFFFF),
        onBackground: Color(0xFF1A1C18),
        surface: Color(0xFFFDFDF5),
        onSurface: Color(0xFF000000),
        surfaceVariant: Color(0xFFFFFFFF),
        onSurfaceVariant: Color(0xFF43483E),
        outline: Color(0xFF74796D),
        onInverseSurface: Color(0xFFF1F1EA),
        inverseSurface: Color(0xFF2F312D),
        inversePrimary: Color(0xFF71DF36),
        shadow: Color(0xFF000000),
        surfaceTint: Color(0xFF000000),
        outlineVariant: Color(0xFFC3C8BB),
        scrim: Color(0xFF000000),
      ),
    );
  }

  static ThemeData themeDataDark(BuildContext context) {
    return ThemeData(
        useMaterial3: true,
        // colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.deepOrange),
        brightness: Brightness.dark,
        colorScheme: const ColorScheme(
          brightness: Brightness.dark,
          primary: Color(0xFFFFFFFF),
          onPrimary: Color(0xFF000000),
          primaryContainer: Color(0xFF1E5200),
          onPrimaryContainer: Color(0xFFFFFFFF),
          secondary: Color(0xFFBDCBAF),
          onSecondary: Color(0xFF283420),
          secondaryContainer: Color(0xFF3E4A35),
          onSecondaryContainer: Color(0xFFD9E7CB),
          tertiary: Color(0xFF9ED67D),
          onTertiary: Color(0xFF123800),
          tertiaryContainer: Color(0xFF215105),
          onTertiaryContainer: Color(0xFFB9F396),
          error: Color(0xFFFFB4AB),
          errorContainer: Color(0xFF93000A),
          onError: Color(0xFF690005),
          onErrorContainer: Color(0xFFFFDAD6),
          background: Color(0xFF000000),
          onBackground: Color(0xFFE3E3DC),
          surface: Color(0xFF1A1C18),
          onSurface: Color(0xFFE3E3DC),
          surfaceVariant: Color(0xFF43483E),
          onSurfaceVariant: Color(0xFFC3C8BB),
          outline: Color(0xFF8D9286),
          onInverseSurface: Color(0xFF1A1C18),
          inverseSurface: Color(0xFFE3E3DC),
          inversePrimary: Color(0xFF2A6C00),
          shadow: Color(0xFF000000),
          surfaceTint: Color(0xFF71DF36),
          outlineVariant: Color(0xFF43483E),
          scrim: Color(0xFF000000),
        ));
  }
}

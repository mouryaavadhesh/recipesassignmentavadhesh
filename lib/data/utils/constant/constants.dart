import 'package:flutter/material.dart';

class Constants {
  static String appName = 'MyStall';
  static const String version =
  String.fromEnvironment('versionname', defaultValue: '1.06');
  static const int testingVersion =
  int.fromEnvironment('buildnumber', defaultValue: 6);
  static const bool enableLogging = true;
  static const List<String> filterApi = [];
  static const bool isControlGroupForPaymentsEnabled = true;
  static const bool isTransactionPaymentsEnabled = false;
  static const kGoogleApiKey = 'AIzaSyCFQJ5_CEFm07io0EMwOfEYBUwEtqvAdEw';
  //Colors for theme
//  Color(0xfffcfcff);
  static Color lightPrimary = Color(0xfffcfcff);
  static Color darkPrimary = Colors.black;
  static Color lightAccent = Color(0xffE42256);
  static Color darkAccent = Color(0xade42256);
  static Color lightBG = Color(0xfffcfcff);
  static Color darkBG = Colors.black;
  static Color ratingBG = Color(0xffFEC84D);

  static const String termsAndConditions = 'https://www.mystall.co/terms';
  static const String privacyPolicy = 'https://www.mystall.co/privacy-policy';
  static const String instagram = 'https://www.instagram.com/mystallofficial/';

  static const String loadLiveBid = 'Waiting';
  static const String loadLiveLorryWaiting = 'Waiting';
  static const String authToken = 'authToken';
  static const String language = 'language';
  static const String languagePopUp = 'languagePopUp';
  static const String fcmToken = 'fcmToken';
  static const String phoneNumber = 'phoneNumber';
  static const String brand = 'brand';
  static const String model = 'model';
  static const String backLoadDetail = 'backLoadDetail';
  static const String dayCheck = 'dayCheck';
  static const String updateCheck = 'appUpdateCheck';
  static const String customerCareNumber = '7022280000';
  static const String companyRoutes = 'companyRoutes';
  static const String userId = 'userId';
  static const String qrCode = 'qrCode';
  static const String itemAddEdit = 'itemAddEdit';
}

class Dimension {
  static const double buttonSize = 42.0;
  static const double horizontalMarginScreen = 16.0;
  static const double verticalMarginScreen = 16.0;

  static const double leftMarginScreen = 16.0;
  static const double rightMarginScreen = 16.0;
  static const double allMargin = 20.0;
  static const int lengthLBH = 6;
  static const double headerHeightTop = 68.00;
  static const int materialControllerLength = 25;
}

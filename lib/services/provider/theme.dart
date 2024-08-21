import 'package:flutter/material.dart';

class ThemeProvider with ChangeNotifier {
  final Color _primaryColor = const Color(0xff56A5CC);
  final Color _background = const Color(0xffF8F9FB);
  final Color _onBackGround = Colors.black;
  final Color _lightGrey2 = const Color(0xFFD9DCE0);
  final Color _error = const Color(0xFFFF3F3F);
  final Color _warning = const Color(0xFFFDCF41);
  final Color _success = const Color(0xFF5CFF7E);

  // Getter methods to expose the defined colors.
  Color get lightGrey2 => _lightGrey2;
  Color get primaryColor => _primaryColor;
  Color get backgroundColor => _background;
  Color get onBackGroundColor => _onBackGround;
  Color get errorColor => _error;
  Color get warningColor => _warning;
  Color get successColor => _success;

  // Getter method to access the theme data.
  ThemeData get theme => _getThemeData();

  ThemeData _getThemeData() {
    return ThemeData(
      scaffoldBackgroundColor: _background,
      brightness: Brightness.light,
      fontFamily: "FontFamily.MontserratMedium",
      colorScheme: ColorScheme.fromSeed(
        seedColor: _primaryColor,
        primary: _primaryColor,
      ),
      appBarTheme: AppBarTheme(
        backgroundColor: _primaryColor,
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(17),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
        ),
      ),
    );
  }
}

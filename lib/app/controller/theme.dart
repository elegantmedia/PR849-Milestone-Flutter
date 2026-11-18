import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:milestone/app/app.dart';

/// A service provider class for managing the theme of the application.
/// This class provides methods to toggle the theme between light and dark,
/// and retrieve the current theme data and mode.
///
/// **Important**: Don't make colors public
/// Always access through [Theme] using [BuildContext]
///
/// Example Usage:
///
/// ```dart
/// color: Theme.of(context).colorScheme.primary
/// ```
class ThemeServiceProvider with ChangeNotifier {
  ThemeServiceProvider({bool isDark = true}) : _isDark = isDark;

  bool _isDark = true;
  bool get isDark => _isDark;

  ThemeData get lightTheme => _lightThemeData();
  ThemeData get darkTheme => _darkThemeData();
  ThemeMode get themeMode => _isDark ? ThemeMode.dark : ThemeMode.light;

  void toggleTheme() {
    _isDark = !_isDark;
    unawaited(Hive.box<bool>('themeMode').put('isDark', _isDark));
    //debugPrint('Theme toggled and its $_isDark');
    notifyListeners();
  }

  /// **Important**: Don't make colors public
  final Color _primaryColor = const Color(0xFFFFFFFF);
  final Color _secondaryColor = const Color(0xFF60B4EB);
  final Color _thirdColor = const Color(0xFF000000);
  final Color _fourthColor = const Color(0xFF161617);
  final Color _profilePlaceholderColor = const Color(0xFF262626);
  final Color _darkBlueGrayColor = const Color(0xFF0B1419);
  final Color _lightSurfaceColor = const Color(0xFF080808);
  final Color _darkSurfaceColor = const Color(0xFF080808);
  final Color _lightBackgroundColor = const Color(0xFF000000);
  final Color _lightShadowColor = const Color(0xFFE2E8F0);
  final Color _darkShadowColor = const Color(0xFF0D1117);
  final Color _errorColor = const Color(0xFFD32F2F);
  final Color _onSurfaceColor = const Color(0xFFFFFFFF);
  final Color _onSurfaceColorDark = const Color(0xFFF7F7F7);
  final Color _successColorLight = const Color(0xFF2E7D32);
  final Color _successColorDark = const Color(0xFF81C784);
  final Color _warningColorLight = const Color(0xFFED6C02);
  final Color _warningColorDark = const Color(0xFFFFB74D);
  final Color _darkBorderColor = const Color(0xFF262D2E);
  final Color _lightTrackColor = const Color(0xFFE5E7EB);
  final Color _darkTrackColor = const Color(0xFF374151);
  //final Color _transparent = const Color(0xFF90A4AE);

  Color get shimmersColor => _secondaryColor.withValues(alpha: 0.24);
  Color get shimmerHighlightColor => _secondaryColor.withValues(alpha: 0.2);
  Color get profilePlaceholderColor => _profilePlaceholderColor;
  Color get darkBlueGrayColor => _darkBlueGrayColor;
  Color get darkBorderColor => _darkBorderColor;

  Color get successColor => _isDark ? _successColorDark : _successColorLight;
  Color get onSuccessColor => Colors.white;
  Color get warningColor => _isDark ? _warningColorDark : _warningColorLight;
  Color get onWarningColor => Colors.white;

  Color get passwordWeakColor => _errorColor;
  Color get passwordMediumColor => warningColor;
  Color get passwordStrongColor => successColor;
  Color get passwordTrackColor => _isDark ? _darkTrackColor : _lightTrackColor;

  ThemeData _lightThemeData() {
    return ThemeData(
      scaffoldBackgroundColor: _lightBackgroundColor,
      colorScheme: ColorScheme.fromSeed(
        seedColor: _secondaryColor,
        primary: _primaryColor,
        onPrimary: Colors.black,
        secondary: _secondaryColor,
        onSecondary: Colors.white,
        tertiary: _fourthColor,
        onTertiary: Colors.white,
        surface: _lightSurfaceColor,
        onSurface: _onSurfaceColor,
        shadow: _lightShadowColor,
        outline: const Color(0xFF90A4AE),
        error: _errorColor,
      ),
      fontFamily: _fontFamily(),
      elevatedButtonTheme: _elevatedButtonThemeData(isDark: false),
      outlinedButtonTheme: _outlinedButtonThemeData(isDark: false),
      textButtonTheme: _textButtonThemeData(isDark: false),
      inputDecorationTheme: _inputDecorationTheme(),
      appBarTheme: _appBarTheme(),
      iconTheme: _iconThemeData(isDark: false),
      bottomNavigationBarTheme: _bottomNavigationBarThemeData(isDark: false),
      iconButtonTheme: _iconButtonThemeData(isDark: false),
    );
  }

  ThemeData _darkThemeData() {
    return ThemeData(
      scaffoldBackgroundColor: _darkSurfaceColor,
      colorScheme: ColorScheme.fromSeed(
        brightness: Brightness.dark,
        seedColor: _secondaryColor,
        primary: _primaryColor,
        onPrimary: Colors.black,
        secondary: _secondaryColor,
        onSecondary: Colors.white,
        tertiary: _fourthColor,
        onTertiary: Colors.white,
        surface: _darkSurfaceColor,
        onSurface: _onSurfaceColorDark,
        shadow: _darkShadowColor,
        outline: const Color(0xFF90A4AE),
        error: _errorColor,
      ),
      fontFamily: _fontFamily(),
      elevatedButtonTheme: _elevatedButtonThemeData(isDark: true),
      outlinedButtonTheme: _outlinedButtonThemeData(isDark: true),
      textButtonTheme: _textButtonThemeData(isDark: true),
      inputDecorationTheme: _inputDecorationTheme(),
      appBarTheme: _appBarTheme(),
      iconTheme: _iconThemeData(isDark: true),
      bottomNavigationBarTheme: _bottomNavigationBarThemeData(isDark: true),
      iconButtonTheme: _iconButtonThemeData(isDark: true),
    );
  }

  String? _fontFamily() {
    return GoogleFonts.jost().fontFamily;
  }

  ElevatedButtonThemeData _elevatedButtonThemeData({required bool isDark}) {
    return ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        foregroundColor: _thirdColor,
        backgroundColor: _secondaryColor,
        elevation: 0,
        textStyle: buttonPrimary(_thirdColor),
        padding: const EdgeInsets.symmetric(
          vertical: 16,
          horizontal: 24,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        minimumSize: const Size(double.infinity, 48),
      ),
    );
  }

  OutlinedButtonThemeData _outlinedButtonThemeData({required bool isDark}) {
    return OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        foregroundColor: _secondaryColor,
        backgroundColor: isDark ? _darkSurfaceColor : _lightSurfaceColor,
        elevation: 0,
        textStyle: buttonSecondary(_secondaryColor),
        padding: const EdgeInsets.symmetric(
          vertical: 16,
          horizontal: 24,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        minimumSize: const Size(double.infinity, 48),
      ),
    );
  }

  TextButtonThemeData _textButtonThemeData({required bool isDark}) {
    return TextButtonThemeData(
      style: TextButton.styleFrom(
        foregroundColor: _secondaryColor,
        elevation: 0,
        textStyle: buttonTertiary(_secondaryColor),
        padding: const EdgeInsets.symmetric(
          vertical: 8,
          horizontal: 12,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        maximumSize: const Size(double.infinity, 48),
      ),
    );
  }

  IconButtonThemeData _iconButtonThemeData({required bool isDark}) {
    return IconButtonThemeData(
      style: IconButton.styleFrom(
        minimumSize: Size.zero,
        padding: EdgeInsets.zero,
      ),
    );
  }

  InputDecorationTheme _inputDecorationTheme() {
    return InputDecorationTheme(
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(16),
        borderSide: BorderSide(
          color: _darkBorderColor,
          width: 1.5,
        ),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(16),
        borderSide: BorderSide(
          color: _secondaryColor,
        ),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(16),
        borderSide: BorderSide(
          color: _errorColor,
          width: 1.5,
        ),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(16),
        borderSide: BorderSide(
          color: _errorColor,
          width: 1.5,
        ),
      ),
      contentPadding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      disabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(16),
        borderSide: BorderSide(
          color: _darkBorderColor.withValues(alpha: 0.2),
          width: 0.5,
        ),
      ),
      filled: true,
      fillColor: _fourthColor,
      hintStyle: formHint(_onSurfaceColorDark.withValues(alpha: 0.55)),
      floatingLabelBehavior: FloatingLabelBehavior.never,
    );
  }

  AppBarTheme _appBarTheme() {
    return AppBarTheme(
      foregroundColor: isDark ? _onSurfaceColorDark : _onSurfaceColor,
      backgroundColor: isDark ? _darkSurfaceColor : _lightSurfaceColor,
      elevation: 0,
      iconTheme: IconThemeData(
        color: isDark ? _onSurfaceColorDark : _onSurfaceColor,
      ),
      titleTextStyle: navBarTitle(
        isDark ? _onSurfaceColorDark : _onSurfaceColor,
      ),
    );
  }

  IconThemeData _iconThemeData({required bool isDark}) {
    return IconThemeData(
      color: isDark ? _onSurfaceColorDark : _onSurfaceColor,
    );
  }

  BottomNavigationBarThemeData _bottomNavigationBarThemeData({required bool isDark}) {
    return BottomNavigationBarThemeData(
      backgroundColor: isDark ? _darkSurfaceColor : _lightSurfaceColor,
      type: BottomNavigationBarType.fixed,
      elevation: 16,
      selectedItemColor: _secondaryColor,
      unselectedItemColor: const Color(0xFF666666),
      showUnselectedLabels: true,
      selectedLabelStyle: tabSelected(_secondaryColor),
      unselectedLabelStyle: tabUnselected(const Color(0xFF666666)),
    );
  }

  static void setSystemUIOverlayStyle({bool isDark = false}) {
    if (isDark) {
      SystemChrome.setSystemUIOverlayStyle(
        const SystemUiOverlayStyle(
          statusBarColor: Colors.transparent,
          statusBarIconBrightness: Brightness.light,
          systemNavigationBarColor: Colors.black,
          systemNavigationBarIconBrightness: Brightness.light,
        ),
      );
    } else {
      SystemChrome.setSystemUIOverlayStyle(
        const SystemUiOverlayStyle(
          statusBarColor: Colors.transparent,
          statusBarIconBrightness: Brightness.dark,
          systemNavigationBarColor: Colors.white,
          systemNavigationBarIconBrightness: Brightness.dark,
        ),
      );
    }
  }
}

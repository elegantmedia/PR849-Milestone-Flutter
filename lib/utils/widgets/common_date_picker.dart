import 'package:flutter/material.dart';

abstract class CommonDatePicker {
  static Future<DateTime?> show({
    required BuildContext context,
    required DateTime initialDate,
    required DateTime firstDate,
    required DateTime lastDate,
  }) {
    final theme = Theme.of(context);
    final colors = theme.colorScheme;

    return showDatePicker(
      context: context,
      initialDate: initialDate,
      firstDate: firstDate,
      lastDate: lastDate,
      builder: (context, child) => Theme(
        data: theme.copyWith(
          colorScheme: colors.copyWith(
            primary: colors.secondary,
            onPrimary: colors.onSecondary,
          ),
          datePickerTheme: DatePickerThemeData(
            backgroundColor: colors.surfaceContainer,
            surfaceTintColor: Colors.transparent,
            headerBackgroundColor: colors.secondary,
            headerForegroundColor: colors.onSecondary,
            todayForegroundColor: WidgetStateProperty.resolveWith((states) {
              if (states.contains(WidgetState.disabled)) {
                return colors.onSurface.withValues(alpha: 0.38);
              }
              return Colors.black;
            }),
            todayBorder: BorderSide(color: colors.secondary),
            dayForegroundColor: WidgetStateProperty.resolveWith((states) {
              if (states.contains(WidgetState.disabled)) {
                return colors.onSurface.withValues(alpha: 0.38);
              }
              if (states.contains(WidgetState.selected)) {
                return colors.onSecondary;
              }
              return colors.onSurface;
            }),
            dayBackgroundColor: WidgetStateProperty.resolveWith((states) {
              if (states.contains(WidgetState.selected)) {
                return colors.secondary;
              }
              return null;
            }),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
          ),
        ),
        child: child!,
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:milestone/app/controller/controller.dart';
import 'package:milestone/utils/utils.dart';

class CommonDropDown<T> extends StatelessWidget {
  const CommonDropDown({
    required this.items,
    required this.itemLabel,
    required this.onChanged,
    super.key,
    this.value,
    this.hintText,
  });

  final List<T> items;
  final String Function(T item) itemLabel;
  final ValueChanged<T?> onChanged;
  final T? value;
  final String? hintText;

  @override
  Widget build(BuildContext context) {
    final colors = context.colorScheme;
    final borderRadius = BorderRadius.circular(16);

    return InputDecorator(
      decoration: InputDecoration(
        filled: true,
        fillColor: colors.surfaceContainer,
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 2),
        enabledBorder: OutlineInputBorder(
          borderRadius: borderRadius,
          borderSide: BorderSide(color: colors.outlineVariant),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: borderRadius,
          borderSide: BorderSide(color: colors.secondary),
        ),
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<T>(
          value: value,
          isExpanded: true,
          borderRadius: borderRadius,
          dropdownColor: colors.surfaceContainer,
          icon: Icon(Icons.keyboard_arrow_down, color: colors.secondary),
          hint: hintText == null
              ? null
              : Text(
                  hintText!,
                  style: context.bodyDefault(color: colors.onSurfaceVariant),
                ),
          style: context.bodyDefault(color: colors.onSurface),
          items: items
              .map(
                (item) => DropdownMenuItem<T>(
                  value: item,
                  child: Text(itemLabel(item)),
                ),
              )
              .toList(),
          onChanged: onChanged,
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

class CustomDropdown<T> extends StatelessWidget {
  final T? value;
  final List<T> items;
  final String Function(T)? labelBuilder;
  final void Function(T?) onChanged;
  final Widget Function(T?) itemBuilder;
  final String hint;
  final bool isExpanded;

  const CustomDropdown({
    super.key,
    required this.value,
    required this.items,
    required this.onChanged,
    required this.itemBuilder,
    this.labelBuilder,
    this.hint = 'Select an item',
    this.isExpanded = true,
  });

  @override
  Widget build(BuildContext context) {
    return DropdownButton<T>(
      value: value,
      isExpanded: isExpanded,
      hint: Text(hint),
      items: items.map((T item) {
        return DropdownMenuItem<T>(
          value: item,
          child: itemBuilder(item),
        );
      }).toList(),
      onChanged: onChanged,
    );
  }
}

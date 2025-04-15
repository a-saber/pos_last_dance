import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pos/core/translation/translation_keys.dart';
import 'package:pos/core/utils/app_decoration.dart';
import 'package:pos/core/utils/app_text_styles.dart';

class CustomDropdown<T> extends StatelessWidget {
  final T? value;
  final List<T> items;
  final void Function(T?) onChanged;
  final String hint;
  final bool isExpanded;
  final String? Function(T?)? validator;
  final bool search;
  final bool Function(T, T)? compareFn;
  final Widget Function(T?) builder;
  final bool Function(T, String)? filterFn;
  const CustomDropdown({
    super.key,
    required this.value,
    required this.items,
    required this.onChanged,
    this.hint = 'Select an item',
    this.isExpanded = true,
    this.validator,
    this.search = false,
    this.compareFn,
    required this.builder, this.filterFn
  });

  @override
  Widget build(BuildContext context) {
    return DropdownSearch<T>(
      compareFn: compareFn,
      selectedItem: value,
      filterFn: filterFn,
      items: (filter, infiniteScrollProps) => items,
      decoratorProps: DropDownDecoratorProps(
        baseStyle: AppTextStyles.formText(),
        decoration: AppDecoration.inputDecoration(labelText: hint),
      ),
      
      popupProps: PopupProps.menu(
        itemBuilder: (context, item, isSelected, x)
        {
          return Padding(
            padding: const EdgeInsets.all(15.0),
            child: builder(item),
          );
        },
        showSearchBox: search,
          searchFieldProps: TextFieldProps(
            decoration: AppDecoration.inputDecoration(labelText: TranslationsKeys.search.tr),
          ),
          fit: FlexFit.loose, constraints: BoxConstraints()
      ),
      dropdownBuilder: (context, selectedItem) => builder(selectedItem),
      onChanged: onChanged,
      validator: validator,
      //style: AppTextStyles.formText(),
    );
  }
}

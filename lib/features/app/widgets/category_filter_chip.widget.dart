import 'package:flutter/material.dart';
import 'package:safeway_api/safeway_api.dart';

class CategoryFilterChip extends StatelessWidget {
  const CategoryFilterChip({
    Key? key,
    required this.selected,
    required this.onSelected,
    required this.category,
  }) : super(key: key);

  final bool selected;
  final void Function(bool) onSelected;
  final POICategory category;
  // final POICategoryStyler _styler = POICategoryStyler();

  @override
  Widget build(BuildContext context) {
    return FilterChip(
      selected: selected,
      label: Row(
        children: [
          Text(category.name),
          // _styler.getIcon(category),
        ],
      ),
      showCheckmark: false,
      onSelected: onSelected,
      backgroundColor: Colors.transparent,
      // selectedColor: _styler.getColor(category),
    );
  }
}

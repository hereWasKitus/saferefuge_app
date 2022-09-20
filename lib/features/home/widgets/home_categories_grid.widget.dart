import 'package:flutter/material.dart';
import 'package:flutter_layout_grid/flutter_layout_grid.dart';

class HomeCategoriesGrid extends StatefulWidget {
  const HomeCategoriesGrid({
    Key? key,
    required this.onChange,
    required this.items,
  }) : super(key: key);

  final void Function(List<String> value) onChange;
  final List<Map> items;

  @override
  State<HomeCategoriesGrid> createState() => _HomeCategoriesGridState();
}

class _HomeCategoriesGridState extends State<HomeCategoriesGrid> {
  @override
  Widget build(BuildContext context) {
    return LayoutGrid(
      columnSizes: [1.fr, 1.fr, 1.fr],
      rowSizes: List.filled(
        widget.items.sublist(0, (widget.items.length / 3).floor()).length +
            1, // calculate the number of rows
        auto,
      ),
      rowGap: 8,
      columnGap: 8,
      children: widget.items
          .map(
            (cat) => _HomeCategoriesGridItem(
              categoryIcon: Icons.place,
              onSelect: (String value, bool selected) => {},
              name: cat['name'] as String,
              value: cat['name'] as String,
              categoryColorHEX: cat['color'] as int,
            ),
          )
          .toList(),
    );
  }
}

class _HomeCategoriesGridItem extends StatelessWidget {
  const _HomeCategoriesGridItem({
    Key? key,
    this.categoryColorHEX = 0xFF000000,
    required this.categoryIcon,
    this.selected = false,
    required this.onSelect,
    required this.name,
    required this.value,
  }) : super(key: key);

  final int categoryColorHEX;
  final IconData categoryIcon;
  final bool selected;
  final void Function(String value, bool selected) onSelect;
  final String name;
  final String value;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onSelect(value, !selected),
      child: Card(
        color: selected ? Color(categoryColorHEX) : Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
          side: BorderSide(color: Color(categoryColorHEX)),
        ),
        child: Container(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: 36,
                height: 36,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: selected
                      ? Colors.white.withOpacity(0.25)
                      : Color(categoryColorHEX).withOpacity(0.25),
                ),
                child: Icon(
                  categoryIcon,
                  color: selected ? Colors.white : Color(categoryColorHEX),
                ),
              ),
              const SizedBox(height: 14),
              Row(
                // use Row to make widget fill all available space in grid
                children: [
                  Flexible(
                    child: Text(
                      name,
                      style: TextStyle(
                        color:
                            selected ? Colors.white : Color(categoryColorHEX),
                        fontWeight: FontWeight.w500,
                        fontSize: 12,
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

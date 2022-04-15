import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:protect_ua_women/constants.dart';

class CategoryList extends StatefulWidget {
  void Function(List<String> selected) onSelected;

  CategoryList({Key? key, required this.onSelected}) : super(key: key);

  @override
  State<CategoryList> createState() => _CategoryListState();
}

class _CategoryListState extends State<CategoryList> {
  final List _categories = <String>[
    'Medicine',
    'Accomodation',
    'Transport',
    'Logistics',
    'Food / Meals',
    'Farmacy'
  ];

  var _selected = <String>[];

  _onSelected(bool selected, String value) {
    setState(() {
      if (selected) {
        _selected.add(value);
      } else {
        _selected.remove(value);
      }
    });
    widget.onSelected(_selected);
  }

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 4,
      runSpacing: -8,
      children: _categories
          .map(
            (category) => FilterChip(
              label: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    category,
                    style: const TextStyle(color: Colors.white, fontSize: 12),
                  ),
                  const SizedBox(
                    width: 6,
                  ),
                ],
              ),
              onSelected: (bool selected) => _onSelected(selected, category),
              showCheckmark: false,
              backgroundColor: const Color.fromRGBO(44, 83, 218, 0.8),
              selectedColor: const Color.fromRGBO(27, 50, 132, 1),
              selected: _selected.contains(category),
            ),
          )
          .toList(),
    );
  }
}

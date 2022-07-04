import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:map_repository/map_repository.dart';
import 'package:protect_ua_women/home/home.dart';

class CategoryList extends StatefulWidget {
  final void Function(List<String> selected) onSelected;
  final List<String> selected;

  const CategoryList({Key? key, required this.onSelected, this.selected = const <String>[]}) : super(key: key);

  @override
  State<CategoryList> createState() => _CategoryListState();
}

class _CategoryListState extends State<CategoryList> {
  List<String> _selected = [];

  @override
  void initState() {
    setState(() {
      _selected = [...widget.selected];
    });
    super.initState();
  }

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
    return BlocBuilder<HomeBloc, HomeState>(
      builder: (context, state) {
        return Wrap(
          spacing: 4,
          runSpacing: -8,
          children: state.categories.map(
            (category) {
              return FilterChip(
                label: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      category.name!,
                      style: const TextStyle(color: Colors.white, fontSize: 12),
                    ),
                    // const SizedBox(width: 6),
                  ],
                ),
                onSelected: (bool selected) => _onSelected(selected, category.name!),
                showCheckmark: false,
                backgroundColor: const Color.fromRGBO(44, 83, 218, 0.8),
                selectedColor: const Color.fromRGBO(27, 50, 132, 1),
                selected: _selected.contains(category.name!),
              );
            },
          ).toList(),
        );
      },
    );
  }

  // Widget _categoryIcon(String? url) {
  //   if (url == null || url.isEmpty) {
  //     return const SizedBox.shrink();
  //   } else {
  //     return Image.network(
  //       'https://upload.wikimedia.org/wikipedia/commons/thumb/6/6d/Windows_Settings_app_icon.png/1024px-Windows_Settings_app_icon.png',
  //       width: 10,
  //       height: 10,
  //     );
  //   }
  // }
}

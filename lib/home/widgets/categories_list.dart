import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:map_repository/map_repository.dart';
import 'package:protect_ua_women/config/constants.dart';

import '../home.dart';

class CategoriesList extends StatelessWidget {
  const CategoriesList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(
      builder: (context, state) {
        if (state.categories.isNotEmpty && !state.toShowSuggestions) {
          return SizedBox(
            height: 32.0,
            child: ListView.separated(
              shrinkWrap: true,
              padding: const EdgeInsets.only(
                left: defaultPadding,
                right: defaultPadding,
                top: 2,
                bottom: 2,
              ),
              separatorBuilder: (ctx, index) => const SizedBox(width: 4),
              scrollDirection: Axis.horizontal,
              itemCount: state.categories.length,
              itemBuilder: (BuildContext ctxt, int index) {
                Category cat = state.categories[index];
                return MapCategoryChip(
                  category: cat,
                  onSelected: (bool isSelected) {
                    List<String> _newSelectedTags = List<String>.from(state.selectedCategories);

                    if (isSelected) {
                      _newSelectedTags.add(cat.name);
                    } else {
                      _newSelectedTags.removeWhere((name) => name == cat.name);
                    }

                    context.read<HomeBloc>().add(SetSelectedCategoriesEvent(selectedCategories: _newSelectedTags));
                  },
                  isSelected: state.selectedCategories.contains(cat.name),
                );
              },
            ),
          );
        }

        return const SizedBox.shrink();
      },
    );
  }
}

class MapCategoryChip extends StatelessWidget {
  const MapCategoryChip({
    Key? key,
    required this.onSelected,
    required this.category,
    this.isSelected = false,
  }) : super(key: key);

  final Category category;
  final Function(bool) onSelected;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return FilterChip(
      label: Row(crossAxisAlignment: CrossAxisAlignment.center, children: [
        Text(
          category.name,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 12,
            fontWeight: FontWeight.w500,
          ),
        ),
      ]),
      onSelected: onSelected,
      showCheckmark: true,
      checkmarkColor: Colors.white,
      backgroundColor: const Color.fromRGBO(
          44, 83, 218, 0.8), // for some reason there is still white background underneath my background
      // backgroundColor: primaryColor,
      selectedColor: const Color.fromRGBO(27, 50, 132, 1),
      visualDensity: VisualDensity.compact,
      selected: isSelected,
    );
  }
}

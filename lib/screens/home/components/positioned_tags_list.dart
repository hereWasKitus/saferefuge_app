import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:protect_ua_women/bloc/map/map_bloc.dart';
import 'package:protect_ua_women/constants.dart';
import 'package:protect_ua_women/models/category.model.dart';

class PositionedTagsList extends StatelessWidget {
  const PositionedTagsList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return Positioned(
      top: 85,
      height: 32,
      width: screenWidth,
      // child: SizedBox.shrink(),
      child: BlocBuilder<MapBloc, MapState>(
        builder: (context, state) {
          if (state.categories.isNotEmpty) {
            return ListView.separated(
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
                    List<String> _newSelectedTags =
                        List<String>.from(state.selectedCategories);

                    if (isSelected) {
                      _newSelectedTags.add(cat.id);
                    } else {
                      _newSelectedTags.removeWhere((id) => id == cat.id);
                    }

                    context.read<MapBloc>().add(SetSelectedCategoriesEvent(
                        selectedCategories: _newSelectedTags));
                  },
                  isSelected: state.selectedCategories.contains(cat.id),
                );
              },
            );
          }

          return SizedBox.shrink();
        },
      ),
    );
  }
}

class MapCategoryChip extends StatelessWidget {
  const MapCategoryChip(
      {Key? key,
      required this.onSelected,
      required this.category,
      this.isSelected = false})
      : super(key: key);

  final Category category;
  final Function(bool) onSelected;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return FilterChip(
      label: Row(crossAxisAlignment: CrossAxisAlignment.center, children: [
        Text(
          category.id,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 12,
            fontWeight: FontWeight.w500,
          ),
        ),
      ]),
      onSelected: onSelected,
      showCheckmark: false,
      backgroundColor: const Color.fromRGBO(44, 83, 218,
          0.8), // for some reason there is still white background underneath my background
      selectedColor: const Color.fromRGBO(27, 50, 132, 1),
      visualDensity: VisualDensity.compact,
      selected: isSelected,
    );
  }
}

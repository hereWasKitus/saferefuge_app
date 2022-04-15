import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:protect_ua_women/constants.dart';
import 'package:protect_ua_women/models/category.model.dart';
import 'package:protect_ua_women/redux/actions.dart';
import 'package:protect_ua_women/redux/app_state.dart';
import 'package:protect_ua_women/redux/store.dart';

class PositionedTagsList extends StatelessWidget {
  const PositionedTagsList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return Positioned(
      top: 85,
      height: 32,
      width: screenWidth,
      child: StoreConnector<AppState, Map<String, List>>(
        converter: (store) => <String, List>{
          'categories': store.state.categories,
          'selectedCategories': store.state.selectedTags
        },
        builder: (BuildContext context, Map<String, List> data) {
          print('Selected tags: ${data['selectedCategories']}');
          return data['categories']!.isNotEmpty
              ? ListView.separated(
                  padding: const EdgeInsets.only(
                    left: defaultPadding,
                    right: defaultPadding,
                    top: 2,
                    bottom: 2,
                  ),
                  separatorBuilder: (ctx, index) => const SizedBox(width: 4),
                  scrollDirection: Axis.horizontal,
                  itemCount: data['categories']!.length,
                  itemBuilder: (BuildContext ctxt, int index) {
                    Category cat = data['categories']![index];
                    return MapCategoryChip(
                      category: cat,
                      onSelected: (bool isSelected) {
                        List<String> _newSelectedTags =
                            List<String>.from(data['selectedCategories'] ?? []);

                        if (isSelected) {
                          _newSelectedTags.add(cat.id);
                        } else {
                          _newSelectedTags.removeWhere((id) => id == cat.id);
                        }

                        appStore
                            .dispatch(SetSelectedTagsAction(_newSelectedTags));
                      },
                      isSelected: data['selectedCategories']!.contains(cat.id),
                    );
                  },
                )
              : const SizedBox.shrink();
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

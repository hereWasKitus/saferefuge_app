import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:protect_ua_women/features/app/app.dart';

class CategoriesList extends StatelessWidget {
  const CategoriesList({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final categories = context.select((AppBloc bloc) => bloc.state.categories);
    final selectedCategoriesIDs =
        context.select((AppBloc bloc) => bloc.state.selectedCategoriesIDs);

    return ListView.separated(
      shrinkWrap: true,
      scrollDirection: Axis.horizontal,
      itemCount: categories.length,
      itemBuilder: (BuildContext context, int index) {
        return CategoryFilterChip(
          selected: selectedCategoriesIDs.contains(categories[index].id),
          onSelected: (bool selected) {},
          category: categories[index],
        );
        // return FilterChip(
        //   selected: selectedCategoriesIDs.contains(categories[index].id),
        //   label: Text(categories[index].name),
        //   showCheckmark: false,
        //   onSelected: (bool selected) {
        //     List<String> _selectedCategoriesIDs =
        //         List<String>.from(selectedCategoriesIDs);

        //     if (selected) {
        //       _selectedCategoriesIDs.add(categories[index].id);
        //     } else {
        //       _selectedCategoriesIDs.remove(categories[index].id);
        //     }

        //     context
        //         .read<AppBloc>()
        //         .add(ChangeSelectedCategoriesIDs(_selectedCategoriesIDs));
        //   },
        // );
      },
      separatorBuilder: (BuildContext context, int index) {
        return const SizedBox(width: 4);
      },
    );
  }
}

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:protect_ua_women/core/theme/app_colors.dart';
import 'package:protect_ua_women/features/app/app.dart';
import 'package:saferefuge_ui/saferefuge_ui.dart';
import 'package:safeway_api/safeway_api.dart';

class FiltersView extends StatefulWidget {
  const FiltersView({Key? key}) : super(key: key);

  @override
  State<FiltersView> createState() => _FiltersViewState();
}

class _FiltersViewState extends State<FiltersView> {
  @override
  void initState() {
    super.initState();
    final countries = context.read<AppBloc>().state.countries;
    if (countries.isEmpty) {
      context.read<AppBloc>().add(const AppLoadCountries());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text('Filters'),
        actions: [
          IconButton(
            onPressed: () {
              context.router.pop();
            },
            icon: const Icon(
              Icons.close,
              color: AppColors.grey,
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomAppBar(
        child: SizedBox(
          height: 50,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              TextButton(
                onPressed: () {
                  context.router.pop();
                },
                child: const Text('Cancel'),
              ),
              TextButton(
                onPressed: () {
                  context.router.pop();
                },
                child: const Text('Apply'),
              ),
            ],
          ),
        ),
      ),
      backgroundColor: Colors.white,
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        color: AppColors.action.withOpacity(0.05),
        child: SingleChildScrollView(
          child: Column(
            children: const [
              _TitleSection(),
              _CategoriesSection(),
              _CountrySelect(),
            ],
          ),
        ),
      ),
    );
  }
}

class _TitleSection extends StatelessWidget {
  const _TitleSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Text(
          'Select the categories',
          style: TextStyle(
            fontWeight: FontWeight.w500,
          ),
        ),
        TextButton(
          onPressed: () {},
          style: ButtonStyle(
            overlayColor: MaterialStateProperty.resolveWith(
              (states) => AppColors.primary.withOpacity(0.05),
            ),
          ),
          child: const Text(
            'Select All',
            style: TextStyle(
              color: AppColors.action,
            ),
          ),
        ),
      ],
    );
  }
}

class _CategoriesSection extends StatelessWidget {
  const _CategoriesSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<POICategory> categories =
        context.select((AppBloc bloc) => bloc.state.categories);

    return Wrap(
      spacing: 4,
      children: categories
          .map(
            (category) => CategoryFilterChip(
              category: category,
              selected: false,
              onSelected: (bool selected) {},
            ),
          )
          .toList(),
    );
  }
}

class _CountrySelect extends StatefulWidget {
  const _CountrySelect({Key? key}) : super(key: key);

  @override
  State<_CountrySelect> createState() => _CountrySelectState();
}

class _CountrySelectState extends State<_CountrySelect> {
  @override
  Widget build(BuildContext context) {
    final countries = context.select((AppBloc bloc) => bloc.state.countries);
    final isLoading = context.select(
      (AppBloc bloc) =>
          bloc.state.countriesFetchingStatus == CountriesFetchingStatus.loading,
    );
    return SRAutocomplete(
      onSelected: (String selected) {
        print('selected $selected');
      },
      onChange: (String value) {
        print('country value: $value');
      },
      fillColor: Colors.white,
      suffixIcon: isLoading
          ? Align(
              alignment: Alignment.centerRight,
              child: Container(
                width: 20,
                height: 20,
                margin: const EdgeInsets.only(right: 10),
                child: const CircularProgressIndicator(color: AppColors.action),
              ),
            )
          : null,
      items: countries.map((country) => country.name).toSet(),
    );
  }
}

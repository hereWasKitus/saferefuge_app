import 'package:flutter/material.dart';
import 'package:protect_ua_women/core/theme/theme.dart';
import 'package:protect_ua_women/features/home/home.dart';
import 'package:protect_ua_women/features/home/widgets/home_categories_grid.widget.dart';
import 'package:saferefuge_ui/saferefuge_ui.dart';

final categories = [
  {
    'name': 'Jobs',
    'color': 0xFF3C5027,
  },
  {
    'name': 'Medical',
    'color': 0xFF277DA1,
  },
  {
    'name': 'Accomodation',
    'color': 0xFF43AA8B,
  },
  {
    'name': 'Children',
    'color': 0xFF5C374C,
  },
  {
    'name': 'Pets',
    'color': 0xFF606C38,
  },
  {
    'name': 'Information',
    'color': 0xFFDCA726,
  },
  {
    'name': 'Clothes',
    'color': 0xFFF94144,
  },
];

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primary,
      body: ListView(
        children: [
          Container(
            padding: const EdgeInsets.only(
              left: 24,
              right: 24,
              top: 24,
              bottom: 38,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                HomeSearchField(
                  onChange: (value) => {},
                ),
                const SizedBox(height: 33),
                const SizedBox(
                  width: 164,
                  child: Text(
                    'This app will contain a map',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      height: 1.16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                const Text(
                  'Our map with with all NGOs across Europe.',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 12,
                  ),
                ),
                const SizedBox(height: 14),
                SRElevetedButton(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Icon(
                        Icons.map,
                        color: AppColors.primary,
                      ),
                      SizedBox(width: 10),
                      Text(
                        'Search in Map',
                        style: TextStyle(
                          color: AppColors.primary,
                        ),
                      ),
                    ],
                  ),
                  primary: Colors.white,
                  onPressed: () => {},
                ),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.all(24),
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(8),
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'What do you need help with?',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(height: 18),
                HomeCategoriesGrid(
                  items: categories,
                  onChange: (values) => {},
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_conditional_rendering/flutter_conditional_rendering.dart';
import 'package:protect_ua_women/core/theme/app_colors.dart';
import 'package:protect_ua_women/features/app/app.dart';
import 'package:protect_ua_women/features/app/widgets/category_filter_chip.widget.dart';
import 'package:safeway_api/safeway_api.dart';

class POICard extends StatelessWidget {
  const POICard({
    Key? key,
    required this.poi,
  }) : super(key: key);

  final POI poi;

  @override
  Widget build(BuildContext context) {
    List<POICategory> _categories =
        context.select((AppBloc bloc) => bloc.state.categories);

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.primary.withOpacity(0.11),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.15),
            offset: const Offset(0, 2),
            spreadRadius: 1,
            blurRadius: 2,
          )
        ],
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        children: [
          Row(
            children: [
              const CircleAvatar(
                backgroundColor: Colors.black,
              ),
              const SizedBox(width: 14),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      poi.name,
                      style: const TextStyle(
                        color: Color(0xFF232824),
                        fontWeight: FontWeight.w500,
                        fontSize: 16,
                      ),
                    ),
                    RichText(
                      text: TextSpan(
                        style: const TextStyle(
                          color: Color(0xFF232824),
                        ),
                        children: [
                          if (poi.country.isNotEmpty)
                            TextSpan(
                              text: '${poi.country}   ',
                              style: const TextStyle(fontSize: 12),
                            ),
                          TextSpan(
                            text: '324 km from you',
                            style: const TextStyle(fontSize: 10),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
              IconButton(
                onPressed: () {},
                icon: const Icon(Icons.arrow_forward_ios),
              ),
            ],
          ),
          const SizedBox(height: 16),
          SizedBox(
            height: 32,
            child: ListView.separated(
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemCount: _categories.length,
              itemBuilder: (BuildContext context, int index) {
                return CategoryFilterChip(
                  selected: false,
                  onSelected: (selected) {},
                  category: _categories[index],
                );
              },
              separatorBuilder: (_, __) => const SizedBox(width: 4),
            ),
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:safeway_api/safeway_api.dart';

class POICategoryStyler {
  POICategoryStyler();

  final _categoryStyles = <String, Map>{
    'border crossing': {
      'color': const Color(0xFF3C5027),
      'icon': const Icon(Icons.abc, color: Color(0xFF3C5027)),
    },
    'medical': {
      'color': const Color(0xFF277DA1),
      'icon': const Icon(Icons.medical_services, color: Color(0xFF277DA1)),
    },
    'accommodation': {
      'color': const Color(0xFF43AA8B),
      'icon': const Icon(Icons.house, color: Color(0xFF43AA8B)),
    },
    'children': {
      'color': const Color(0xFF5C374C),
      'icon': const Icon(Icons.child_care, color: Color(0xFF5C374C)),
    },
    'pets': {
      'color': const Color(0xFF606C38),
      'icon': const Icon(Icons.pets, color: Color(0xFF606C38)),
    },
    'information': {
      'color': const Color(0xFFDCA726),
      'icon': SvgPicture.asset(
        'assets/icons/categories/information.svg',
        color: const Color(0xFFDCA726),
      ),
    },
    'clothes': {
      'color': const Color(0xFFF94144),
      'icon': SvgPicture.asset(
        'assets/icons/categories/clothes.svg',
        color: const Color(0xFFF94144),
      ),
    },
    'water': {
      'color': const Color(0xFF577590),
      'icon': const Icon(Icons.water_drop, color: Color(0xFF577590)),
    },
    'finance': {
      'color': const Color(0xFFF3722C),
      'icon': SvgPicture.asset(
        'assets/icons/categories/finance.svg',
        color: const Color(0xFFF3722C),
      ),
    },
    'pharmacy': {
      'color': const Color(0xFF4D908E),
      'icon': SvgPicture.asset(
        'assets/icons/categories/pharmacy.svg',
        color: const Color(0xFF4D908E),
      ),
    },
    'electronics': {
      'color': const Color(0xFFF8961E),
      'icon': SvgPicture.asset(
        'assets/icons/categories/electronics.svg',
        color: const Color(0xFFF8961E),
      ),
    },
    'food': {
      'color': const Color(0xFF90BE6D),
      'icon': SvgPicture.asset(
        'assets/icons/categories/food.svg',
        color: const Color(0xFF90BE6D),
      ),
    },
    'mental help': {
      'color': const Color(0xFFB9A44C),
      'icon': SvgPicture.asset(
        'assets/icons/categories/mental_help.svg',
        color: const Color(0xFFB9A44C),
      ),
    },
    'social help': {
      'color': const Color(0xFF0C4767),
      'icon': SvgPicture.asset(
        'assets/icons/categories/social_help.svg',
        color: const Color(0xFF0C4767),
      ),
    },
    'education': {
      'color': const Color(0xFFD07646),
      'icon': SvgPicture.asset(
        'assets/icons/categories/education.svg',
        color: const Color(0xFFD07646),
      ),
    },
    'jobs': {
      'color': const Color(0xFF985277),
      'icon': SvgPicture.asset(
        'assets/icons/categories/jobs.svg',
        color: const Color(0xFF985277),
      ),
    },
    'transport': {
      'color': const Color(0xFFE87035),
      'icon': SvgPicture.asset(
        'assets/icons/categories/transport.svg',
        color: const Color(0xFFE87035),
      ),
    },
  };

  Color getColor(POICategory category) {
    return _categoryStyles[category.name.toLowerCase()]!['color'];
  }

  Widget getIcon(POICategory category, Color color) {
    if (_categoryStyles[category.name.toLowerCase()] != null) {
      return _categoryStyles[category.name.toLowerCase()]!['icon'];
    } else {
      return const SizedBox.shrink();
    }
  }
}

class POICategoryStyle {
  const POICategoryStyle({
    required this.color,
    required this.icon,
  });

  final Color color;
  final Widget icon;
}

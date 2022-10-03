import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:protect_ua_women/core/theme/app_colors.dart';
import 'package:protect_ua_women/features/app/app.dart';
import 'package:safeway_api/safeway_api.dart';
import 'package:url_launcher/url_launcher.dart';

class SinglePOIView extends StatefulWidget {
  const SinglePOIView({
    Key? key,
    @PathParam('id') required this.poiID,
  }) : super(key: key);

  final String poiID;

  @override
  State<SinglePOIView> createState() => _SinglePOIViewState();
}

class _SinglePOIViewState extends State<SinglePOIView> {
  @override
  Widget build(BuildContext context) {
    final POI poi = context.select((AppBloc bloc) =>
        bloc.state.pois.firstWhere((element) => element.id == widget.poiID));

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        shadowColor: Colors.transparent,
        iconTheme: const IconThemeData(color: AppColors.grey),
        title: const Text(
          'Point of interest',
          style: TextStyle(
            color: AppColors.grey,
            fontWeight: FontWeight.normal,
          ),
        ),
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Container(
          margin: const EdgeInsets.symmetric(vertical: 14),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.1),
                blurRadius: 8,
                offset: const Offset(0, 4),
              )
            ],
            color: Colors.white,
          ),
          child: Card(
            color: AppColors.primary.withOpacity(0.11),
            shadowColor: Colors.transparent,
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _TitleRow(poi: poi),
                  const SizedBox(height: 16),
                  _CategoriesRow(poi: poi, context: context),
                  const SizedBox(height: 16),
                  _SocialIconsRow(poi: poi),
                  const SizedBox(height: 16),
                  _OrganizationRow(poi: poi),
                  const SizedBox(height: 16),
                  _AddressRow(poi: poi),
                  const SizedBox(height: 16),
                  _LanguagesRow(poi: poi),
                  const SizedBox(height: 16),
                  _ContactPersonRow(poi: poi),
                  const SizedBox(height: 16),
                  _OpenHoursRow(poi: poi),
                  const SizedBox(height: 16),
                  _DescriptionRow(poi: poi),
                  const SizedBox(height: 16),
                  _PhoneRow(poi: poi),
                  const SizedBox(height: 16),
                  _EmailRow(poi: poi),
                  const SizedBox(height: 16),
                  _SocialMediaRow(poi: poi),
                  const SizedBox(height: 16),
                  _WebsiteRow(poi: poi),
                  const SizedBox(height: 16),
                  _TelegramRow(poi: poi),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _TitleRow extends StatelessWidget {
  const _TitleRow({Key? key, required this.poi}) : super(key: key);

  final POI poi;

  @override
  Widget build(BuildContext context) {
    return Row(
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
                      text:
                          '${poi.distanceKm.toStringAsPrecision(2)} km from you',
                      style: const TextStyle(fontSize: 10),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}

class _CategoriesRow extends StatelessWidget {
  const _CategoriesRow({
    Key? key,
    required this.poi,
    required this.context,
  }) : super(key: key);

  final POI poi;
  final BuildContext context;

  @override
  Widget build(BuildContext context) {
    final List<POICategory> _categories =
        context.select((AppBloc bloc) => bloc.state.categories);

    return SizedBox(
      height: 32,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: poi.categories.length,
        itemBuilder: (context, index) {
          return CategoryFilterChip(
            category: _categories
                .firstWhere((element) => element.name == poi.categories[index]),
            onSelected: (bool selected) {},
            selected: true,
          );
        },
      ),
    );
  }
}

class _SocialIconsRow extends StatelessWidget {
  const _SocialIconsRow({Key? key, required this.poi}) : super(key: key);

  final POI poi;

  @override
  Widget build(BuildContext context) {
    final List<Widget> socials = [];

    if (poi.url.isNotEmpty) {
      socials.add(_URLIconButton(iconData: Icons.public, url: poi.url));
    }

    if (poi.phone.isNotEmpty) {
      socials
          .add(_URLIconButton(iconData: Icons.phone, url: 'tel:${poi.phone}'));
    }

    if (poi.whatsapp.isNotEmpty) {
      socials.add(_URLIconButton(
          iconData: Icons.whatsapp, url: 'https://wa.me/${poi.whatsapp}'));
    }

    if (poi.email.isNotEmpty) {
      socials.add(
          _URLIconButton(iconData: Icons.email, url: 'mailto:${poi.email}'));
    }

    if (socials.isEmpty) {
      return const SizedBox.shrink();
    }

    return SizedBox(
      height: 32,
      child: ListView.builder(
        // separatorBuilder: (BuildContext context, int index) =>
        //     const SizedBox(width: 8),
        itemBuilder: (BuildContext context, int index) => socials[index],
        itemCount: socials.length,
        scrollDirection: Axis.horizontal,
      ),
    );
  }
}

class _OrganizationRow extends StatelessWidget {
  const _OrganizationRow({Key? key, required this.poi}) : super(key: key);

  final POI poi;

  @override
  Widget build(BuildContext context) {
    return _Detail(
      title: 'Organization',
      bottom:
          Text(poi.organizations.isNotEmpty ? poi.organizations.first : ' - '),
    );
  }
}

class _LanguagesRow extends StatelessWidget {
  const _LanguagesRow({Key? key, required this.poi}) : super(key: key);

  final POI poi;

  @override
  Widget build(BuildContext context) {
    return _Detail(
      title: 'Languages',
      bottom: Text(poi.languages.isNotEmpty ? poi.languages.join(', ') : ' - '),
    );
  }
}

class _ContactPersonRow extends StatelessWidget {
  const _ContactPersonRow({Key? key, required this.poi}) : super(key: key);

  final POI poi;

  @override
  Widget build(BuildContext context) {
    return _Detail(
      title: 'Contact Person',
      bottom: Text(poi.contactPerson.isNotEmpty ? poi.contactPerson : ' - '),
    );
  }
}

class _OpenHoursRow extends StatelessWidget {
  const _OpenHoursRow({Key? key, required this.poi}) : super(key: key);

  final POI poi;

  @override
  Widget build(BuildContext context) {
    return _Detail(
      title: 'Open Hours',
      bottom: Text(' - '),
    );
  }
}

class _DescriptionRow extends StatelessWidget {
  const _DescriptionRow({Key? key, required this.poi}) : super(key: key);

  final POI poi;

  @override
  Widget build(BuildContext context) {
    return _Detail(
      title: 'Description',
      bottom: Row(
        children: [
          Expanded(
            child: Text(poi.description.isNotEmpty ? poi.description : ' - '),
          ),
        ],
      ),
    );
  }
}

class _PhoneRow extends StatelessWidget {
  const _PhoneRow({Key? key, required this.poi}) : super(key: key);

  final POI poi;

  @override
  Widget build(BuildContext context) {
    return _Detail(
      title: 'Phone',
      bottom: Text(poi.phone.isNotEmpty ? poi.phone : ' - '),
    );
  }
}

class _EmailRow extends StatelessWidget {
  const _EmailRow({Key? key, required this.poi}) : super(key: key);

  final POI poi;

  @override
  Widget build(BuildContext context) {
    return _Detail(
      title: 'Email',
      bottom: Text(poi.email.isNotEmpty ? poi.email : ' - '),
    );
  }
}

class _SocialMediaRow extends StatelessWidget {
  const _SocialMediaRow({Key? key, required this.poi}) : super(key: key);

  final POI poi;

  @override
  Widget build(BuildContext context) {
    return _Detail(title: 'Social Media', bottom: Text(' - '));
  }
}

class _WebsiteRow extends StatelessWidget {
  const _WebsiteRow({Key? key, required this.poi}) : super(key: key);

  final POI poi;

  @override
  Widget build(BuildContext context) {
    return _Detail(
      title: 'Website',
      bottom: Text(poi.url.isNotEmpty ? poi.url : ' - '),
    );
  }
}

class _TelegramRow extends StatelessWidget {
  const _TelegramRow({Key? key, required this.poi}) : super(key: key);

  final POI poi;

  @override
  Widget build(BuildContext context) {
    return _Detail(
      title: 'Telegram',
      bottom: Text(poi.telegram.isNotEmpty ? poi.telegram : ' - '),
    );
  }
}

class _AddressRow extends StatelessWidget {
  const _AddressRow({Key? key, required this.poi}) : super(key: key);

  final POI poi;

  @override
  Widget build(BuildContext context) {
    return _Detail(
      title: 'Address',
      bottom: Row(
        children: [
          Expanded(child: Text(poi.address.isNotEmpty ? poi.address : ' - ')),
        ],
      ),
    );
  }
}

class _Detail extends StatelessWidget {
  const _Detail({Key? key, required this.title, required this.bottom})
      : super(key: key);

  final String title;
  final Widget bottom;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 12,
            height: 1.5,
          ),
        ),
        Material(
          color: Colors.transparent,
          textStyle: const TextStyle(
            color: AppColors.grey,
            fontSize: 12,
            height: 1.5,
          ),
          child: bottom,
        )
      ],
    );
  }
}

class _URLIconButton extends StatelessWidget {
  const _URLIconButton({
    Key? key,
    required this.iconData,
    required this.url,
  }) : super(key: key);

  final IconData iconData;
  final String url;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 40,
      height: 40,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(color: AppColors.action),
      ),
      child: IconButton(
        padding: const EdgeInsets.all(0),
        splashRadius: 19,
        onPressed: () {
          try {
            _launchUrl(url);
          } catch (e) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text('Could not launch $url'),
                behavior: SnackBarBehavior.floating,
                backgroundColor: AppColors.red,
              ),
            );
          }
        },
        icon: Icon(
          iconData,
          color: AppColors.action,
          size: 18,
        ),
      ),
    );
  }

  void _launchUrl(String url) async {
    await launchUrl(Uri.parse(url), mode: LaunchMode.externalApplication);
  }
}

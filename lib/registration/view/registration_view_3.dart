import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:map_repository/map_repository.dart';
import 'package:protect_ua_women/config/constants.dart';
import 'package:protect_ua_women/home/widgets/menu_button.dart';
import 'package:protect_ua_women/routes/router.gr.dart';

import '../registration.dart';

class RegistrationView3 extends StatefulWidget {
  const RegistrationView3({Key? key}) : super(key: key);

  @override
  State<RegistrationView3> createState() => _RegistrationView3State();
}

class _RegistrationView3State extends State<RegistrationView3> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        foregroundColor: Colors.transparent,
        elevation: 0,
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.only(right: 25),
            child: RotatedBox(
              quarterTurns: 1,
              child: MenuButton(
                onPressed: () {
                  context.router.pop();
                },
              ),
            ),
          ),
        ],
      ),
      resizeToAvoidBottomInset: false,
      body: Padding(
        padding: const EdgeInsets.only(
          left: defaultPadding,
          right: defaultPadding,
          bottom: 60,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            BlocBuilder<RegistrationBloc, RegistrationState>(
              builder: (context, state) {
                // final years = context.select((RegistrationBloc bloc) => bloc.state.fullName);
                return Text(
                  '${state.fullName},',
                  style: const TextStyle(
                    color: Color(0xFF1B3284),
                    fontWeight: FontWeight.bold,
                    fontSize: 36,
                  ),
                );
              },
            ),
            const Text(
              'does your NGO \r\nhave branches?',
              style: TextStyle(
                fontSize: 20,
              ),
            ),
            const SizedBox(height: 24),
            const Text(
              'Adding branches to our map will allow people to get more help quickly!',
              style: TextStyle(
                color: Color.fromRGBO(27, 50, 132, 1),
                fontSize: 16,
              ),
            ),
            const Spacer(),
            ElevatedButton(
              onPressed: () {
                context.router.push(
                  MapRoute(onPointSelected: _onPointSelected),
                );
              },
              child: const Text('Yes, add a point on map'),
              style: ElevatedButton.styleFrom(
                minimumSize: const Size(double.infinity, 60),
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(defaultBorderRadius),
                  ),
                ),
                primary: const Color.fromRGBO(27, 50, 132, 1),
              ),
            ),
            const SizedBox(height: 5),
            TextButton(
              onPressed: () {
                context.read<RegistrationBloc>().add(const RegistrationCompleted(true));
              },
              child: const Text('No, we don\'t have branches'),
              style: TextButton.styleFrom(
                minimumSize: const Size(double.infinity, 60),
                primary: const Color.fromRGBO(27, 50, 132, 1),
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(defaultBorderRadius),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _onPointSelected(Map<String, dynamic> data, BuildContext mapctx) {
    Map<String, dynamic> countryComponent =
        data['address_components'].firstWhere((component) => component['types'].contains('country') ? true : false);
    Map<String, dynamic> cityComponent =
        data['address_components'].firstWhere((component) => component['types'].contains('locality') ? true : false);
    Map<String, dynamic> streetNumberComponent = data['address_components']
        .firstWhere((component) => component['types'].contains('street_number') ? true : false);
    Map<String, dynamic> routeComponent =
        data['address_components'].firstWhere((component) => component['types'].contains('route') ? true : false);
    String address = '';

    try {
      address = [
        countryComponent['long_name'],
        cityComponent['long_name'],
        streetNumberComponent['long_name'],
        routeComponent['long_name'],
      ].join(', ');
    } catch (e) {
      address = data['formatted_address'];
    }

    RegistrationState curState = context.read<RegistrationBloc>().state;
    final orgName = context.select((RegistrationState state) => state.organizationName);
    POI newBranch = curState.branch.copyWith(
      name: '$orgName | branch 1',
      address: address,
      latitude: data['geometry']['location']['lat'],
      longitude: data['geometry']['location']['lng'],
      telegram: curState.organizationTelegram,
      whatsapp: curState.organizationWhatsapp,
      country: countryComponent['long_name'] ?? '',
      city: cityComponent['long_name'] ?? '',
    );
    context.read<RegistrationBloc>().add(RegistrationBranchChanged(newBranch));
    mapctx.router.pop();
  }
}

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:map_repository/map_repository.dart';
import 'package:protect_ua_women/config/constants.dart';
import 'package:protect_ua_women/routes/router.gr.dart';

import '../profile.dart';

class BranchesList extends StatefulWidget {
  const BranchesList({Key? key}) : super(key: key);

  @override
  State<BranchesList> createState() => _BranchesListState();
}

class _BranchesListState extends State<BranchesList> {
  @override
  void initState() {
    super.initState();
    context.read<ProfileBloc>().add(const ProfileFetchBranchesRequest());
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProfileBloc, ProfileState>(
      builder: (context, state) {
        return Column(
          children: [
            ElevatedButton(
              onPressed: () {
                if (state.addBranchStatus == AddBranchStatus.loading) {
                  return;
                }

                // context.read<ProfileBloc>().add(const ProfileFetchBranchesRequest());
                context.router.push(MapRoute(onPointSelected: _onPointSelected));
              },
              child: state.addBranchStatus == AddBranchStatus.loading
                  ? const SpinKitCircle(color: Colors.white)
                  : const Text('Add point on map'),
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
            const SizedBox(height: 20),
            for (final POI branch in state.branches)
              Container(
                margin: const EdgeInsets.only(bottom: 20),
                child: BranchCard(
                  branch: branch,
                  onTap: () {
                    context.router.push(AddBranchRoute(
                      initialBranchState: branch,
                    ));
                  },
                ),
              ),
          ],
        );
      },
    );
    // return Text('branches');
  }

  void _onPointSelected(data, BuildContext mapContext) {
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

    ProfileState profileState = context.read<ProfileBloc>().state;

    POI newBranch = POI(
      address: address,
      latitude: data['geometry']['location']['lat'],
      longitude: data['geometry']['location']['lng'],
      country: countryComponent['long_name'] ?? '',
      city: cityComponent['long_name'] ?? '',
      name: '${profileState.organizationName} | branch ${profileState.branches.length + 1}',
    );

    mapContext.router.replace(AddBranchRoute(
      initialBranchState: newBranch,
    ));
  }
}

// class _BranchesList extends StatelessWidget {
//   const _BranchesList({Key? key, this.branches = const []}) : super(key: key);

//   final List<POI> branches;

//   @override
//   Widget build(BuildContext context) {

//   }
// }

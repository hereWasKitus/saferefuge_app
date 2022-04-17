// import 'dart:async';

// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:google_maps_flutter/google_maps_flutter.dart';
// import 'package:protect_ua_women/bloc/map/map_bloc.dart';
// import 'package:protect_ua_women/screens/home/components/map.dart';

// class MapMainContainer extends StatelessWidget {
//   MapMainContainer({Key? key}) : super(key: key);

//   static final Completer<GoogleMapController> _controller = Completer();
//   final CameraPosition _kGooglePlex = const CameraPosition(
//     target: LatLng(37.42796133580664, -122.085749655962),
//     zoom: 14.4746,
//   );

//   @override
//   Widget build(BuildContext context) {
//     return BlocBuilder<MapBloc, MapState>(
//       buildWhen: (previous, current) => previous.pois != current.pois,
//       builder: (context, state) {
//         return MapMain(
//           defaultCameraPosition: _kGooglePlex,
//           controllerCompleter: _controller,
//           pois: state.pois ?? [],
//         );
//       },
//     );
//   }
// }

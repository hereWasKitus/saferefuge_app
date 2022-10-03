import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:protect_ua_women/core/config/constants.dart';

import '../map.dart';

class MapBottom extends StatefulWidget {
  const MapBottom({Key? key, required this.onButtonClicked}) : super(key: key);

  final void Function() onButtonClicked;

  @override
  State<MapBottom> createState() => _MapBottomState();
}

class _MapBottomState extends State<MapBottom> {
  @override
  Widget build(BuildContext context) {
    return Positioned(
      width: MediaQuery.of(context).size.width,
      bottom: 0,
      child: Padding(
        padding: const EdgeInsets.only(
          bottom: 36,
          left: defaultPadding,
          right: defaultPadding,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            BlocBuilder<MapBloc, MapState>(
              buildWhen: (previos, current) =>
                  (previos.status != current.status) ||
                  (previos.markers != current.markers),
              builder: (context, state) {
                return ElevatedButton(
                  onPressed: () {
                    if (state.markers.isNotEmpty) {
                      widget.onButtonClicked();
                    }
                  },
                  child: state.status == MapStatus.loading
                      ? const CircularProgressIndicator()
                      : const Text('Add point on map'),
                  style: ElevatedButton.styleFrom(
                    minimumSize: const Size(double.infinity, 60),
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(defaultBorderRadius),
                      ),
                    ),
                    backgroundColor: Color.fromRGBO(
                        27, 50, 132, state.markers.isEmpty ? 0.7 : 1),
                    splashFactory: (state.status == MapStatus.loading) ||
                            state.markers.isEmpty
                        ? NoSplash.splashFactory
                        : InkRipple.splashFactory,
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

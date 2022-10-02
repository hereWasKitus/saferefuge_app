import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:protect_ua_women/core/config/constants.dart';

import '../map.dart';

class MapSearchBar extends StatefulWidget {
  const MapSearchBar({Key? key}) : super(key: key);

  @override
  State<MapSearchBar> createState() => _MapSearchBarState();
}

class _MapSearchBarState extends State<MapSearchBar> {
  var _timer;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MapBloc, MapState>(
      buildWhen: (previous, current) {
        return previous.status != current.status;
      },
      builder: (context, state) {
        return TextField(
          onChanged: _handleChange,
          onSubmitted: _handleSubmit,
          decoration: InputDecoration(
            border: _borderStyle,
            focusedBorder: _borderStyle,
            enabledBorder: _borderStyle,
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 12,
              vertical: 0,
            ),
            prefixIcon: const Icon(
              Icons.search,
              color: primaryColor,
            ),
            suffixIcon: state.status == MapStatus.loading
                ? SizedBox(
                    width: 20,
                    height: 20,
                    child: LayoutBuilder(builder: (context, constraints) {
                      return CircularProgressIndicator(
                        color: primaryColor,
                      );
                    }),
                  )
                : null,
            hintText: 'Enter address',
            hintStyle: const TextStyle(
              color: Color.fromRGBO(27, 50, 132, 0.2),
            ),
            fillColor: Colors.white,
            filled: true,
            constraints: const BoxConstraints(maxHeight: 44),
          ),
        );
      },
    );
  }

  void _handleChange(value) {
    if (_timer is Timer) {
      _timer.cancel();
    }

    _timer = Timer(const Duration(seconds: 1), () async {
      context.read<MapBloc>().add(MapSearchFieldChanged(value));
    });
  }

  void _handleSubmit(value) {
    context.read<MapBloc>().add(MapSuggestionSelected(value));
  }

  final OutlineInputBorder _borderStyle = OutlineInputBorder(
    borderRadius: BorderRadius.circular(defaultBorderRadius),
    borderSide: const BorderSide(
      width: 0,
      color: Colors.transparent,
    ),
  );
}

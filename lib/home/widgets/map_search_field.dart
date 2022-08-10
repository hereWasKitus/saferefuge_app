import 'dart:async';
import 'dart:convert' as convert;
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:protect_ua_women/config/constants.dart';
import 'package:protect_ua_women/config/secrets.dart';
import 'package:http/http.dart' as http;

import '../home.dart';

typedef SetSearchQueryCallback = void Function(String query);
typedef OnSubmitCallback = void Function(double lat, double lng);

class MapSearchField extends StatelessWidget {
  final _focusNode = FocusNode();
  final OnSubmitCallback onSubmit;
  final TextEditingController? _controller;
  var timer;

  MapSearchField({Key? key, required this.onSubmit})
      : _controller = TextEditingController(),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(
      builder: (context, state) {
        return TextField(
          onChanged: (value) => _searchPlaces(value, context),
          onSubmitted: (value) => _handleSubmit(value, context),
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
            suffixIcon: _buildSuffixIcon(context),
            hintText: 'Enter address',
            hintStyle: const TextStyle(
              color: Color.fromRGBO(27, 50, 132, 0.2),
            ),
            fillColor: Colors.white,
            filled: true,
            constraints: const BoxConstraints(maxHeight: 44),
          ),
          controller: _controller,
          focusNode: _focusNode,
        );
      },
    );
  }

  _searchPlaces(String term, BuildContext context) async {
    context.read<HomeBloc>().add(const HomeSetSearchStatusEvent(status: SearchStatus.loading));

    if (timer is Timer) {
      timer.cancel();
    }

    timer = Timer(const Duration(seconds: 1), () async {
      context.read<HomeBloc>().add(SetSearchResultsByQueryEvent(query: term));
      context.read<HomeBloc>().add(const HomeSetSearchStatusEvent(status: SearchStatus.succeed));
    });
  }

  _handleSubmit(String input, BuildContext context) async {
    if (input.isEmpty) return;

    Uri url = Uri.parse(
        'https://maps.googleapis.com/maps/api/place/findplacefromtext/json?fields=geometry&inputtype=textquery&input=$input&key=$googleMapAPIkey');
    var response = await http.get(url);
    var json = convert.jsonDecode(response.body);
    var res = json['candidates'];
    Map<String, dynamic> location = res[0]['geometry']['location'];
    context.read<HomeBloc>().add(const SetSearchResultsByQueryEvent(query: ''));
    onSubmit(location['lat'], location['lng']);
  }

  final OutlineInputBorder _borderStyle = OutlineInputBorder(
    borderRadius: BorderRadius.circular(defaultBorderRadius),
    borderSide: const BorderSide(
      width: 0,
      color: Colors.transparent,
    ),
  );

  Widget? _buildSuffixIcon(BuildContext context) {
    final isLoading = context.select((HomeBloc element) => element.state.searchStatus == SearchStatus.loading);
    final searchFieldIsEmpty = _controller != null && _controller!.text.isEmpty;

    if (!isLoading && !searchFieldIsEmpty) {
      return IconButton(
        splashRadius: Material.defaultSplashRadius / 2,
        color: primaryColor,
        icon: const Icon(Icons.close),
        onPressed: () {
          _controller!.clear();
        },
      );
    }

    if (isLoading) {
      return SizedBox(
        width: 20,
        height: 20,
        child: LayoutBuilder(builder: (context, constraints) {
          return SpinKitCircle(
            color: primaryColor,
            size: constraints.maxWidth / 2,
          );
        }),
      );
    }

    return null;
  }
}

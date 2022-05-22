import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:protect_ua_women/config/constants.dart';

import '../profile.dart';

class BranchesList extends StatefulWidget {
  const BranchesList({Key? key}) : super(key: key);

  @override
  State<BranchesList> createState() => _BranchesListState();
}

class _BranchesListState extends State<BranchesList> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProfileBloc, ProfileState>(
      builder: (context, state) {
        if (state.branches.isNotEmpty) {
          return Container();
        }

        return ElevatedButton(
          onPressed: () {},
          child: const Text('Add point on map'),
          style: ElevatedButton.styleFrom(
            minimumSize: const Size(double.infinity, 60),
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(defaultBorderRadius),
              ),
            ),
            primary: const Color.fromRGBO(27, 50, 132, 1),
          ),
        );
      },
    );
    // return Text('branches');
  }
}

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:map_repository/map_repository.dart';
import 'package:protect_ua_women/core/config/constants.dart';
import 'package:protect_ua_women/features/profile/profile.dart';

class AddBranchView extends StatefulWidget {
  const AddBranchView({Key? key, this.initialBranchState = const POI()}) : super(key: key);

  final POI initialBranchState;

  @override
  State<AddBranchView> createState() => _AddBranchViewState();
}

class _AddBranchViewState extends State<AddBranchView> {
  @override
  Widget build(BuildContext context) {
    return BlocListener<ProfileBloc, ProfileState>(
      listener: (context, state) {
        if (state.addBranchStatus == AddBranchStatus.fail) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(state.errorMessage),
              behavior: SnackBarBehavior.floating,
              backgroundColor: red,
            ),
          );
        } else if (state.addBranchStatus == AddBranchStatus.success) {
          context.read<ProfileBloc>().add(const ProfileFetchBranchesRequest());
          context.router.pop();
        }
      },
      child: Scaffold(
        appBar: AppBar(
          leadingWidth: 44 + 12,
          leading: Padding(
            padding: const EdgeInsets.only(left: 12),
            child: IconButton(
              splashRadius: 23,
              onPressed: () {
                context.router.pop();
              },
              icon: const Icon(Icons.arrow_back),
              color: primaryColor,
            ),
          ),
          backgroundColor: Colors.transparent,
          foregroundColor: Colors.transparent,
          elevation: 0,
        ),
        body: SingleChildScrollView(
          padding: const EdgeInsets.only(
            left: defaultPadding,
            right: defaultPadding,
            bottom: 60,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                // width: (MediaQuery.of(context).size.width / 100) * 42.6,
                width: 160,
                child: Text(
                  'Please fill your branch details',
                  style: TextStyle(
                    fontSize: 24,
                  ),
                ),
              ),
              const SizedBox(height: 24),
              BlocBuilder<ProfileBloc, ProfileState>(
                buildWhen: (previous, current) => previous.addBranchStatus != current.addBranchStatus,
                builder: (context, state) {
                  return BranchForm(
                    isLoading: state.addBranchStatus == AddBranchStatus.loading,
                    submitButtonText: 'Add branch',
                    branch: widget.initialBranchState,
                    onSubmit: (branch) {
                      if (branch.id.isNotEmpty) {
                        context.read<ProfileBloc>().add(ProfileUpdateBranchRequest(branch));
                      } else {
                        context.read<ProfileBloc>().add(ProfileAddBranchRequest(branch));
                      }
                    },
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

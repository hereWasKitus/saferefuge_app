import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:protect_ua_women/config/constants.dart';
import 'package:protect_ua_women/home/widgets/menu_button.dart';
import 'package:protect_ua_women/profile/profile.dart';
import 'package:protect_ua_women/routes/router.gr.dart';

class ProfileView extends StatefulWidget {
  const ProfileView({Key? key}) : super(key: key);

  @override
  State<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  @override
  Widget build(BuildContext context) {
    return AutoTabsRouter(
      routes: const [
        ProfileFormRoute(),
        ProfileBranchesRoute(),
      ],
      builder: (context, child, animation) {
        final tabsRouter = AutoTabsRouter.of(context);

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
                      AutoRouter.of(context).pop();
                    },
                  ),
                ),
              ),
            ],
          ),
          floatingActionButton: BlocBuilder<ProfileBloc, ProfileState>(
            buildWhen: (previous, current) => (previous.formStatus != current.formStatus),
            builder: (context, state) {
              if (state.formStatus == FormStatus.changed || state.formStatus == FormStatus.loading) {
                return FloatingActionButton(
                  onPressed: () {
                    context.read<ProfileBloc>().add(const ProfileUpdateRequest());
                  },
                  child: state.formStatus == FormStatus.loading
                      ? const SpinKitCircle(
                          color: Colors.white,
                        )
                      : const Text('Save'),
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(defaultBorderRadius),
                    ),
                  ),
                  backgroundColor: primaryColor,
                );
              }

              return const SizedBox.shrink();
            },
          ),
          body: SingleChildScrollView(
            padding: const EdgeInsets.only(
              left: defaultPadding,
              right: defaultPadding,
              // bottom: 60,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                BlocBuilder<ProfileBloc, ProfileState>(
                  buildWhen: (previos, current) => previos.name != current.name,
                  builder: (context, state) {
                    return RichText(
                      text: TextSpan(
                        style: const TextStyle(
                          color: Colors.black,
                          fontSize: 36,
                          fontWeight: FontWeight.w500,
                          fontFamily: 'Rubik',
                        ),
                        children: [
                          TextSpan(
                            text: '${state.name},\r\n',
                            style: const TextStyle(
                              color: Color(0xFF1B3284),
                            ),
                          ),
                          const TextSpan(text: 'here is your'),
                        ],
                      ),
                    );
                  },
                ),
                const SizedBox(height: 24),
                ProfileTabs(
                  onClick: (int index) => tabsRouter.setActiveIndex(index),
                  activeIndex: tabsRouter.activeIndex,
                ),
                const SizedBox(height: 16),
                FadeTransition(
                  opacity: animation,
                  child: child,
                )
              ],
            ),
          ),
        );
      },
    );
  }
}

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:protect_ua_women/config/constants.dart';
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
    return BlocListener<ProfileBloc, ProfileState>(
      listener: (context, state) {
        if (state.authStatus != AuthStatus.authorized) {
          context.tabsRouter.navigate(const HomeRoute());
        }
      },
      listenWhen: (previous, current) => previous.authStatus != current.authStatus,
      child: SafeArea(
        child: AutoTabsRouter(
          routes: const [
            ProfileFormRoute(),
            ProfileBranchesRoute(),
          ],
          builder: (context, child, animation) {
            final tabsRouter = AutoTabsRouter.of(context);

            return Scaffold(
              body: SingleChildScrollView(
                padding: const EdgeInsets.only(
                  left: defaultPadding,
                  right: defaultPadding,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    BlocBuilder<ProfileBloc, ProfileState>(
                      buildWhen: (previos, current) =>
                          previos.formStatus != current.formStatus && current.formStatus == FormStatus.updateSucceed,
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
        ),
      ),
    );
  }
}

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:protect_ua_women/core/config/constants.dart';
import 'package:protect_ua_women/features/profile/profile.dart';
import 'package:protect_ua_women/features/registration/registration.dart';
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
          context.read<RegistrationBloc>().add(const RegistrationEraseProgress());
          context.tabsRouter.navigate(const HomeRoute());
        } else {
          context.read<ProfileBloc>().add(const ProfileFetchBranchesRequest());
        }
      },
      listenWhen: (previous, current) => previous.authStatus != current.authStatus,
      child: SafeArea(
        child: AutoTabsRouter(
          routes: const [
            ProfileMenuRoute(),
            ProfileBranchesRoute(),
          ],
          builder: (context, child, animation) {
            final tabsRouter = AutoTabsRouter.of(context);

            return Scaffold(
              body: SingleChildScrollView(
                padding: const EdgeInsets.only(
                  top: 72,
                  left: defaultPadding,
                  right: defaultPadding,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const CircleAvatar(
                      radius: 42,
                      backgroundColor: Color(0xFFD9D9D9),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      context.select((ProfileBloc bloc) => bloc.state.name),
                      style: const TextStyle(
                        fontSize: 36,
                        fontWeight: FontWeight.w500,
                        color: Color(0xFF1B3284),
                      ),
                    ),
                    const SizedBox(height: 4),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          context.select((ProfileBloc bloc) => bloc.state.email),
                          style: const TextStyle(
                            fontSize: 16,
                          ),
                        ),
                        const SizedBox(width: 5),
                        const Icon(Icons.check_circle, color: green),
                      ],
                    ),
                    const SizedBox(height: 15),
                    const Divider(
                      color: Color.fromRGBO(115, 119, 122, 1),
                      thickness: 1,
                    ),
                    const SizedBox(height: 12),
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

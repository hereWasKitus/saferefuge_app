import 'package:auth_repository/auth_repository.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/password_reset_bloc.dart';

class PasswordResetWrapperView extends StatelessWidget {
  const PasswordResetWrapperView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => PasswordResetBloc(authRepository: context.read<AuthRepository>()),
      child: const AutoRouter(),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nepalibussiness/UI/dashboard.dart';
import 'package:nepalibussiness/UI/registration.dart';
import 'package:nepalibussiness/auth/auth.dart';
import 'package:nepalibussiness/bloc/app/bloc/app_bloc.dart';

class ScreenController extends StatelessWidget {
  const ScreenController({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: Auth().authStateChanges,
      builder: (context, snapshot) {
        return BlocBuilder<AppBloc, AppState>(
          builder: (context, state) {
            if (state is AppStateLoggedIn) {
              return const Dashboard();
            }
            if (state is AppStateLoggedOut) {
              return const Registration();
            } else {
              return Container();
            }
          },
        );
      },
    );
  }
}

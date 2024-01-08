import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:workwaves/features/authentication/presentation/authentication_bloc.dart';
import 'login_page.dart';
import 'home_page.dart';

class AuthenticationPage extends StatelessWidget {
  const AuthenticationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthenticationBloc, AuthenticationState>(
      builder: (context, state) {
        if (state is AuthenticationInitial) {
          BlocProvider.of<AuthenticationBloc>(context).add(AppStarted());
          return const CircularProgressIndicator();
        } else if (state is AuthenticationAuthenticated) {
          return HomePage(user: state.user);
        } else {
          return LoginPage();
        }
      },
    );
  }
}

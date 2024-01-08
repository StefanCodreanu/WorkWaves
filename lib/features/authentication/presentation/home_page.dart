import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:workwaves/core/entities/user.dart';
import 'package:workwaves/features/authentication/presentation/authentication_bloc.dart';

class HomePage extends StatelessWidget {
  final Human user;

  const HomePage({Key? key, required this.user}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Home Page - ${user.email}'),
        ),
        body: Center(
            child: ElevatedButton(
          onPressed: () {
            BlocProvider.of<AuthenticationBloc>(context).add(SignedOut());
          },
          child: null,
        )));
  }
}

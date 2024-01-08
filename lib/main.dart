import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:workwaves/features/authentication/presentation/authentication_bloc.dart';
import 'package:workwaves/features/authentication/presentation/authentication_page.dart';
import 'package:workwaves/injection_container.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  init(); // Initialize dependency injection container
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'WorkWaves',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: BlocProvider(
        create: (context) => sl<AuthenticationBloc>(),
        child: const AuthenticationPage(),
      ),
    );
  }
}

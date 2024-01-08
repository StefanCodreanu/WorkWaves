part of 'authentication_bloc.dart';

abstract class AuthenticationEvent {}

class AppStarted extends AuthenticationEvent {}

class SignedIn extends AuthenticationEvent {
  final String email;
  final String password;

  SignedIn({required this.email, required this.password});
}

class SignedOut extends AuthenticationEvent {}

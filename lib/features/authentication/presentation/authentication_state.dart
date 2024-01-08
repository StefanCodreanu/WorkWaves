part of 'authentication_bloc.dart';

abstract class AuthenticationState {}

class AuthenticationInitial extends AuthenticationState {}

class AuthenticationLoading extends AuthenticationState {}

class AuthenticationAuthenticated extends AuthenticationState {
  final Human user;

  AuthenticationAuthenticated({required this.user});
}

class AuthenticationUnauthenticated extends AuthenticationState {}

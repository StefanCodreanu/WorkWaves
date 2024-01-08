import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:workwaves/features/authentication/domain/authentication_repository.dart';
import 'package:workwaves/core/entities/user.dart';

part 'authentication_event.dart';
part 'authentication_state.dart';

class AuthenticationBloc
    extends Bloc<AuthenticationEvent, AuthenticationState> {
  final AuthenticationRepository _authenticationRepository;

  AuthenticationBloc(this._authenticationRepository)
      : super(AuthenticationInitial());

  Stream<AuthenticationState> mapEventToState(
    AuthenticationEvent event,
  ) async* {
    if (event is AppStarted) {
      final currentUser = await _authenticationRepository.getCurrentUser();
      if (currentUser != null) {
        yield AuthenticationAuthenticated(user: currentUser);
      } else {
        yield AuthenticationUnauthenticated();
      }
    } else if (event is SignedIn) {
      yield AuthenticationLoading();
      await _authenticationRepository.signInWithEmailAndPassword(
        event.email,
        event.password,
      );
    } else if (event is SignedOut) {
      yield AuthenticationLoading();
      await _authenticationRepository.signOut();
      yield AuthenticationUnauthenticated();
    }
  }
}

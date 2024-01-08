import 'package:get_it/get_it.dart';
import 'package:workwaves/features/authentication/data/authentication_repository_impl.dart';
import 'package:workwaves/features/authentication/domain/authentication_repository.dart';

final sl = GetIt.instance;

void init() {
  // Bloc
  // Register your other BLoCs here

  // Repository
  sl.registerLazySingleton<AuthenticationRepository>(
    () => AuthenticationRepositoryImpl(),
  );
}

import 'package:appwrite_bloc_todo/data/provider/appwrite_prodiver.dart';
import 'package:appwrite_bloc_todo/data/repository/auth_repository.dart';
import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

final locator = GetIt.I;

void setupLocator() {
  locator.registerLazySingleton<InternetConnectionChecker>(() => InternetConnectionChecker());
  locator.registerLazySingleton<AppwriteProdiver>(() => AppwriteProdiver());
  locator.registerLazySingleton<AuthRepository>(() => AuthRepository());
}

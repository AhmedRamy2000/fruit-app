import 'package:fruitapp/Features/auth/data/repos/auth_repo_impl.dart';
import 'package:fruitapp/Features/auth/domain/repos/auth_repo.dart';
import 'package:fruitapp/core/services/date_base_service.dart';
import 'package:fruitapp/core/services/fire_store_service.dart';
import 'package:fruitapp/core/services/firebase_auth_service.dart';
import 'package:get_it/get_it.dart';

// GetIt instance for dependency injection
final getIt = GetIt.instance;

// Function to set up dependencies with GetIt
void setupGetIt() {
  // Registering FirebaseAuthService as a singleton, ensuring only one instance exists
  getIt.registerSingleton<FirebaseAuthService>(FirebaseAuthService());

  // Registering FireStoreService as a singleton, which implements the DatabaseService
  getIt.registerSingleton<DatabaseService>(FireStoreService());

  // Registering AuthRepo as a singleton, injecting the previously registered FirebaseAuthService and DatabaseService
  getIt.registerSingleton<AuthRepo>(AuthRepoImpl(
      firebaseAuthService: getIt<FirebaseAuthService>(),
      databaseService: getIt<DatabaseService>()));
}

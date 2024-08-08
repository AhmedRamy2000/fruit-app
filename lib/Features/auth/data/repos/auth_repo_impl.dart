import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:fruitapp/Features/auth/data/models/user_model.dart';
import 'package:fruitapp/Features/auth/domain/repos/auth_repo.dart';
import 'package:fruitapp/Features/auth/domain/repos/entites/user_entity.dart';
import 'package:fruitapp/core/errors/exceptions.dart';
import 'package:fruitapp/core/errors/failures.dart';
import 'package:fruitapp/core/services/firebase_auth_service.dart';

class AuthRepoImpl extends AuthRepo {
  final FirebaseAuthService firebaseAuthService;
  AuthRepoImpl({required this.firebaseAuthService});
  @override
  Future<Either<Failure, UserEntity>> createUserWithEmailAndPassword(
      String email, String password, String uId) async {
    try {
      var user = await firebaseAuthService.createUserWithEmailAndPassword(
          email: email, password: password);
      return right(UserModel.fromFirebaseUser(user));
    } on CustomException catch (e) {
      return left(ServerFailure(e.message));
    } catch (e) {
      log('Exception in createUserWithEmailAndPassword: $e');
      return left(ServerFailure('لقد قمت بالتسجيل مسبقا'));
    }
  }
}

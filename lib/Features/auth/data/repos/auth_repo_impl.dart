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
      return left(ServerFailure("لقد حدث خطأ ما الرجاء المحاوله مرة اخري"));
    }
  }

  @override
  Future<Either<Failure, UserEntity>> signInWithEmailAndPassword(
      String email, String password) async {
    try {
      var user = await firebaseAuthService.signInWithEmailAndPassword(
          email: email, password: password);
      return right(UserModel.fromFirebaseUser(user));
    } on CustomException catch (e) {
      return left(ServerFailure(e.message));
    } catch (e) {
      log('Exception in createUserWithEmailAndPassword: $e');
      return left(ServerFailure("لقد حدث خطأ ما الرجاء المحاوله مرة اخري"));
    }
  }

  @override
  Future<Either<Failure, UserEntity>> signInWithGoogle() async {
    try {
      var user = await firebaseAuthService.signInWithGoogle();
      return right(UserModel.fromFirebaseUser(user));
    } on CustomException catch (e) {
      return left(ServerFailure(e.message));
    } catch (e) {
      log('Exception in signInWithGoogle: $e');
      return left(ServerFailure("لقد حدث خطأ ما الرجاء المحاوله مرة اخري"));
    }
  }

  @override
  Future<Either<Failure, UserEntity>> signInWithFacebook() async {
    try {
      var user = await firebaseAuthService.signInWithFacebook();
      return right(UserModel.fromFirebaseUser(user));
    } on CustomException catch (e) {
      return left(ServerFailure(e.message));
    } catch (e) {
      log('Exception in signInWithFacebook: $e');
      return left(ServerFailure("لقد حدث خطأ ما الرجاء المحاوله مرة اخري"));
    }
  }
  // @override
  // Future<Either<Failure, UserEntity>> signInWithApple() async {
  //   try{
  //     var user = await firebaseAuthService.signInWithApple();
  //     return right(UserModel.fromFirebaseUser(user));
  //   }on CustomException catch (e) {
  //     return left(ServerFailure(e.message));
  //   } catch (e) {
  //     log('Exception in signInWithFacebook: $e');
  //     return left(ServerFailure("لقد حدث خطأ ما الرجاء المحاوله مرة اخري"));
  //   }
  // }
}

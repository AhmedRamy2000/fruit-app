import 'package:dartz/dartz.dart';
import 'package:fruitapp/Features/auth/domain/repos/entites/user_entity.dart';
import 'package:fruitapp/core/errors/failures.dart';

abstract class AuthRepo {
  Future<Either<Failure, UserEntity>> createUserWithEmailAndPassword(
      String email, String password,String uId);
}

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import 'package:fruitapp/Features/auth/domain/repos/auth_repo.dart';
import 'package:fruitapp/Features/auth/domain/repos/entites/user_entity.dart';

part 'signin_state.dart';

class SignInCubit extends Cubit<SignInState> {
  SignInCubit(this.authRepo) : super(SignInInitial());

  final AuthRepo authRepo;
  //login using email and password
  Future<void> logInUser(String email, String password) async {
    emit(SignInLoading());
    final result = await authRepo.signInWithEmailAndPassword(email, password);
    result.fold(
        (failure) => emit(SignInFailure(message: failure.message)),
        (userEntity) => emit(SignInSuccess(
              userEntity: userEntity,
            )));
  }

  //login using your gmail
  Future<void> logInWithGoogle() async {
    emit(SignInLoading());
    final result = await authRepo.signInWithGoogle();
    result.fold(
        (failure) => emit(SignInFailure(message: failure.message)),
        (userEntity) => emit(SignInSuccess(
              userEntity: userEntity,
            )));
  }

  //login using your facebook
  Future<void> logInWithFacebook() async {
    emit(SignInLoading());
    final result = await authRepo.signInWithFacebook();
    result.fold(
        (failure) => emit(SignInFailure(message: failure.message)),
        (userEntity) => emit(SignInSuccess(
              userEntity: userEntity,
            )));
  }
  // //login using Apple
  // Future<void> logInWithApple() async {
  //   emit(SignInLoading());
  //   final result = await authRepo.signInWithApple();
  //   result.fold(
  //       (failure) => emit(SignInFailure(message: failure.message)),
  //       (userEntity) => emit(SignInSuccess(
  //             userEntity: userEntity,
  //           )));
  // }
}

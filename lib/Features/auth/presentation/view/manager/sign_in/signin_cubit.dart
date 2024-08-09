
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import 'package:fruitapp/Features/auth/domain/repos/auth_repo.dart';
import 'package:fruitapp/Features/auth/domain/repos/entites/user_entity.dart';

part 'signin_state.dart';

class SignInCubit extends Cubit<SignInState> {
  SignInCubit(this.authRepo) : super(SignInInitial());

  final AuthRepo authRepo;
  Future<void> logInUser(String email, String password) async {
    emit(SignInLoading());
    final result = await authRepo.signInWithEmailAndPassword(email, password);
    result.fold(
        (failure) => emit(SignInFailure(message: failure.message)),
        (userEntity) => emit(SignInSuccess(
              userEntity: userEntity,
            )));
  }
}

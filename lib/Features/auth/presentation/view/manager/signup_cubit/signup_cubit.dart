
import 'package:bloc/bloc.dart';
import 'package:fruitapp/Features/auth/domain/repos/auth_repo.dart';
import 'package:fruitapp/Features/auth/domain/repos/entites/user_entity.dart';
part 'signup_state.dart';

class SignUpCubit extends Cubit<SignUpState> {
  SignUpCubit(
    this.authRepo,
  ) : super(SignUpInitial());
  final AuthRepo authRepo;
  Future<void> createUserWithEmailAndPassword(
      String email, String password, String name) async {
    emit(SignUpLoading());
    final result =
        await authRepo.createUserWithEmailAndPassword(email, password, name);
    result.fold((failure) => emit(SignUpFailure(failure: failure.message)),
        (userEntity) => emit(SignUpSuccess(userEntity: userEntity)));
  }
}

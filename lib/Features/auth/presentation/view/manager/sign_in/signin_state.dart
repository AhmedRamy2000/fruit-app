part of 'signin_cubit.dart';

@immutable
abstract class SignInState {}

class SignInInitial extends SignInState {}

class SignInLoading extends SignInState {}

class SignInSuccess extends SignInState {
  final UserEntity userEntity;

  SignInSuccess({required this.userEntity});
}

class SignInFailure extends SignInState {
  final String message;

  SignInFailure({required this.message});
}

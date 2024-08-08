part of 'signup_cubit.dart';

abstract class SignUpState {}

class SignUpInitial extends SignUpState {}

class SignUpLoading extends SignUpState {}

class SignUpSuccess extends SignUpState {
  final UserEntity userEntity;

  SignUpSuccess({required this.userEntity});
}

class SignUpFailure extends SignUpState {
  final String failure;

  SignUpFailure({required this.failure});
}

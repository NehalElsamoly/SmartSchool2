// ignore_for_file: must_be_immutable



 class AuthState {}

final class AuthInitial extends AuthState {}

final class AuthLoading extends AuthState {}

final class AuthSuccess extends AuthState {

}

final class AuthFailure extends AuthState {
String errMessage;

AuthFailure({required this.errMessage});
}
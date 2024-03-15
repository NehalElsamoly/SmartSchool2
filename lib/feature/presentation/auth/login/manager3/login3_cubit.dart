import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../data/repo/authrepo.dart';
import 'login3_state.dart';


class AuthCubit extends Cubit<AuthState> {
  AuthCubit(this.authRepo) : super(AuthInitial());
  final AuthRepo authRepo;

  //login
  Future<void> loginUser({required email, required password,required status}) async {
    emit(AuthLoading());
    SharedPreferences prefs = await SharedPreferences.getInstance();

    var result = await authRepo.loginUser(email: email, password: password,status:status);
    result.fold((failure) {
      emit(
        AuthFailure(errMessage: failure.errMessage),
      );
    },(token) {
      prefs.setString('auth-token', token)??"";
      emit(AuthSuccess());
    });
  }
  Future<void> signupUser(
      {required name, required email, required password}) async {
    emit(AuthLoading());
    SharedPreferences prefs = await SharedPreferences.getInstance();

    var result =
    await authRepo.signupUser(name: name, email: email, password: password);
    result.fold((failure) {
      emit(
        AuthFailure(errMessage: failure.errMessage),
      );
    }, (token) {
      prefs.setString('auth-token', token)??"";
      emit(AuthSuccess());
    });
  }
}
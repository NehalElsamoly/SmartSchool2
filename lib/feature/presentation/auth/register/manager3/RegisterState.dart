// ignore_for_file: must_be_immutable



 import '../data/model/getlevels.dart';

class AuthStateregister {}

final class AuthInitial extends AuthStateregister {}

final class AuthLoading extends AuthStateregister {}

final class AuthSuccess extends AuthStateregister {

}
class LevelSuess extends AuthStateregister {
final GetLevelsResponse ?levelmodel;

LevelSuess({required this.levelmodel});
}
final class AuthFailure extends AuthStateregister {
String errMessage;

AuthFailure({required this.errMessage});
}
import 'package:dartz/dartz.dart';
import 'package:mind_pro/domain/failures/login_failures.dart';

abstract class LoginRepository {

  /// try to login
  /// returns an error or the JWT token
  Future<Either<LoginFailure,String>> login(String username, String password);

}
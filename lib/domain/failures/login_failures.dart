import 'package:mind_pro/domain/failures/failures.dart';

abstract class LoginFailure extends Failure {}

class UnknownUsernameFailure extends LoginFailure {}
import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginUseCases {

  final SharedPreferences sharedPreferences;

  static const jwtTokenPrefsName = 'JWT_TOKEN';

  LoginUseCases({required this.sharedPreferences});

  Future<bool> login(String mail, String password) async {
    /// TODO: replace this code with HTTP API Calls and JWT token check
    return true;
  }

  /// checks, if the user is currently logged in
  Future<bool> isLoggedIn() async {
    /// check, if the JWT token exists
    if (sharedPreferences.containsKey(jwtTokenPrefsName)) {
      String token = sharedPreferences.getString(jwtTokenPrefsName)!;

      /// see also: https://pub.dev/packages/jwt_decoder/example

      /* decode() method will decode your token's payload */
      Map<String, dynamic> decodedToken = JwtDecoder.decode(token);

      /// check, if the JWT token is still valid
      bool isTokenExpired = JwtDecoder.isExpired(token);

      if (!isTokenExpired) {
        // The user should authenticate
        return false;
      }

      return true;
    }

    return false;
  }

}
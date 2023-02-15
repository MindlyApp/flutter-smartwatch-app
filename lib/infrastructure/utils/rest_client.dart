import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';

part 'rest_client.g.dart';

@RestApi()
abstract class RestClient {

  /// see also: https://medium.com/@ayalon.idan/retrofit-and-flutter-like-a-pro-e80b654545c1

  /// see also: https://gist.github.com/kwaiks/850161faf557ee4d7ed9a2b6fe972ea5
  /// https://github.com/OpenSphereSoftware/FlutterLeichtGemacht_ZeroToMasery/tree/main/todo_redesign/lib/infrastructure
  /// https://github.com/OpenSphereSoftware/FlutterLeichtGemacht_ZeroToMasery/tree/main/advicer/lib/infrastructure

  factory RestClient(Dio dio, {String baseUrl}) = _RestClient;

  /// TODO: add code here

}
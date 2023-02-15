import 'package:get_it/get_it.dart';
import 'package:mind_pro/config/remote_config.dart';
import 'package:mind_pro/domain/usecases/login_usecases.dart';
import 'package:mind_pro/infrastructure/utils/dio_client.dart';
import 'package:mind_pro/infrastructure/utils/rest_client.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

final sl = GetIt.I; // sl = service locator

Future<void> init() async {
  // Register our database first.

  // load shared preferences
  await _initSharedPref();

  /// Rest
  final dio = buildDioClient(RemoteConfig.serverApiUrl);
  sl.registerLazySingleton<RestClient>(() => RestClient(dio));

  /// BLOCS

  // factory means, that every call sl creates a new instance of the dependency
  //sl.registerFactory(() => null)

  /// Usecases
  // sl.registerLazySingleton(() => null);
  sl.registerLazySingleton<LoginUseCases>(
      () => LoginUseCases(sharedPreferences: sl()));

  /// repos

  /// datasources
  /// see also: https://github.com/fluttercommunity/get_it/issues/99
  /*sl.registerLazySingletonAsync<AppDatabase>(() async =>
      $FloorAppDatabase.databaseBuilder('ideamanagement.db').build());*/
  /*sl.registerLazySingleton(() => database.ideaDao);
  sl.registerLazySingleton(() => database.areaDao);*/

  /// Register all DAOs.

  /// extern
  sl.registerLazySingleton(() => http.Client());
}

Future<void> _initSharedPref() async {
  SharedPreferences sharedPref = await SharedPreferences.getInstance();
  sl.registerSingleton<SharedPreferences>(sharedPref);
}

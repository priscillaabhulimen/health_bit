import 'package:get_it/get_it.dart';
import 'package:health_bit/core/services/auth_service/auth_service.dart';
import 'package:health_bit/core/services/auth_service/auth_service_impl.dart';
import 'package:health_bit/core/services/navigator_service.dart';

GetIt locator = GetIt.instance;

Future<void> setUpLocator() async {
  /////////////////////////////////////////
  ///Network Services
  ////////////////////////////////////////
  // locator.registerFactory(() => HttpHelper());
  // // locator.registerLazySingleton<ApiService>(() => ApiServiceImpl());
  // locator.registerLazySingleton<AuthService>(
  //         () => AuthServiceImpl(httpHelper: locator.get()));

  /////////////////////////////////////////
  ///Third Party Services
  ////////////////////////////////////////
  locator.registerLazySingleton<NavigationService>(() => NavigationService());

}
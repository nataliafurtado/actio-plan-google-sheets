import 'package:get_it/get_it.dart';
import 'package:google_action_plan/config/di.dart';
import 'package:google_action_plan/id_sheet_singleton.dart';
import 'package:google_action_plan/modules/landing_page/landing_page_controller.dart';
import 'package:google_action_plan/modules/list/infrastructure/repositories_impl/list_repository.dart';
import 'package:google_action_plan/modules/login/login_controller.dart';
import 'package:dio/dio.dart';

Future<void> setupDependencies() async {
  _setupInterceptor();
  _setupInitialConfig();
  _setupControllers();
  _setupRepositories();
  _setupDio();
}

void _setupInterceptor() {
  GetIt.I.registerLazySingleton<DioInterceptor>(
    () => DioInterceptor(),
  );
}

Future<void> _setupInitialConfig() async {
  GetIt.I.registerLazySingleton<DI>(
    () => DI(),
  );

  GetIt.I.registerLazySingleton<IdSheetSingleton>(
    () => IdSheetSingleton(),
  );
}

Future<void> _setupControllers() async {
  DI.registerLazySingleton<LandingPageController>(
    () => LandingPageController(),
  );

  DI.registerLazySingleton<LoginController>(
    () => LoginController(),
  );
}

void _setupRepositories() {
  DI.registerLazySingleton<ListRepository>(
    () => ListRepository(
      loginController: GetIt.I.get<LoginController>(),
      dio: DioInstances.dioClient()!,
    ),
  );
}

void _setupDio() async {
  DioInstances.dioClient()!.interceptors.add(
        GetIt.I.get<DioInterceptor>(),
      );
}

class DioInstances {
  static Dio? _dio;

  static Dio? dioClient() {
    _dio ??= Dio();
    return _dio;
  }
}

class DioInterceptor extends Interceptor {
  @override
  Future onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    final token = GetIt.I.get<LoginController>().token;
    options.headers['authorization'] = 'Bearer ${token ?? ''}';
    options.headers['Accept'] = 'application/json';
    options.headers['Content-Type'] = 'application/json';
    return handler.next(options);
  }
}

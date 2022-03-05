import 'package:get_it/get_it.dart';
import 'package:google_action_plan/config/di.dart';
import 'package:google_action_plan/id_sheet_singleton.dart';
import 'package:google_action_plan/modules/landing_page/landing_page_controller.dart';
import 'package:google_action_plan/modules/list/infrastructure/repositories_impl/list_repository.dart';
import 'package:google_action_plan/modules/login/login_controller.dart';
import 'package:dio/dio.dart';
import 'package:google_action_plan/modules/login/teddy/teddy_controller.dart';
import 'package:google_action_plan/services/cache/cache.dart';
import 'package:google_action_plan/services/cache/project_cache.dart';

Future<void> setupDependencies() async {
  _setupInitialConfig();
  _setupInterceptor();
  _setupRepositories();
  _setupControllers();
  _setupDio();
}

Future<void> _setupInitialConfig() async {
  GetIt.I.registerLazySingleton<DI>(
    () => DI(),
  );

  DI.registerLazySingleton<IdSheetSingleton>(
    () => IdSheetSingleton(),
  );

  DI.registerLazySingleton<Cache>(
    () => Cache(),
  );

  DI.registerLazySingleton<ProjectCache>(
    () => ProjectCache(
      GetIt.I.get<Cache>(),
    ),
  );
}

void _setupInterceptor() {
  DI.registerLazySingleton<DioInterceptor>(
    () => DioInterceptor(),
  );
}

void _setupRepositories() {
  DI.registerLazySingleton<ListRepository>(
    () => ListRepository(
      loginController: GetIt.I.get<LoginController>(),
      dio: DioInstances.dioClient()!,
      projectCache: 
    ),
  );
}

Future<void> _setupControllers() async {
  DI.registerLazySingleton<LandingPageController>(
    () => LandingPageController(),
  );

  DI.registerLazySingleton<LoginController>(
    () => LoginController(
      listRepository: GetIt.I.get<ListRepository>(),
    ),
  );

  DI.registerLazySingleton<TeddyController>(
    () => TeddyController(),
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

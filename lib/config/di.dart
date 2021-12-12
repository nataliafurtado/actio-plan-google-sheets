import 'package:get_it/get_it.dart';

class DI {
  static List<PathSingletons> pathsSingletons = [];
  List<String> stackOfPages = [];

  static void registerLazySingleton<T extends Object>(
    T Function() register, {
    Function? disposingFunction,
    String? pathToKeepAlive,
  }) {
    if (pathToKeepAlive != null) {
      pathsSingletons.add(
        PathSingletons<T>(
          path: pathToKeepAlive,
          disposingFunction: disposingFunction,
        ),
      );
    }
    GetIt.I.registerLazySingleton<T>(register);
  }

  void loadPagePath(String pagePath) {
    stackOfPages.add(pagePath);
  }

  void resetInstances(String currentPath) {
    stackOfPages.remove(currentPath);
    if (!hasOtherPagesWithCurrentPath(currentPath)) {
      resetPathSingletons(currentPath);
    }
  }

  void resetPathSingletons(currentPath) {
    final allSingletonsWityCurrentPath =
        getAllPathSingletonsWithCurrentPath(currentPath);
    for (var pathSingleton in allSingletonsWityCurrentPath) {
      pathSingleton.resetSingleton(
        pathSingleton.getInstance(),
        disposingFunction: pathSingleton.disposingFunction,
      );
    }
  }

  List<PathSingletons<dynamic>> getAllPathSingletonsWithCurrentPath(
          currentPath) =>
      pathsSingletons
          .where(
            (pathSIngleton) => pathSIngleton.path == currentPath,
          )
          .toList();

  bool hasOtherPagesWithCurrentPath(currentPath) {
    final pagePathWithCurretnPath = stackOfPages.firstWhere(
      (pagePath) => pagePath.contains(currentPath),
      orElse: () => '',
    );
    if (pagePathWithCurretnPath == '') {
      return false;
    }
    return true;
  }
}

class PathSingletons<T extends Object> {
  final String? path;
  final Function? disposingFunction;
  PathSingletons({
    this.disposingFunction,
    this.path,
  });
  T getInstance() {
    return GetIt.I.get<T>();
  }

  void resetSingleton(Object instance, {Function? disposingFunction}) {
    GetIt.I.resetLazySingleton<T>(
      instance: instance,
      disposingFunction: (controller) {
        disposingFunction?.call(controller);
      },
    );
  }
}

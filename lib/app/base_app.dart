import 'package:flutter/material.dart';
import 'package:micro_core/injection/injector.dart';
import 'package:micro_core/injection/repository_injector.dart';
import 'package:micro_core/module/module.dart';
import 'package:micro_core/module/traits/binded_module.dart';
import 'package:micro_core/module/traits/routable_module.dart';
import 'package:micro_core/utils/base_app_util.dart';

/// An abstract class to be extended by the main widget
/// on the [runApp] method. You need to call [registerRouters] and
/// [registerDependencies] on the [build] method to register all [modules], [routes]
/// and [dependencies] of your project.
abstract class BaseApp {
  List<Module> get modules;

  String get initialRoute;

  final Map<String, WidgetBuilderArgs> routes = {};

  /// Mount all routes of the app and
  /// add then to [routes] to be used on [generateRoute].
  void registerRouters() {
    if (modules.isNotEmpty) {
      for (Module module in modules) {
        if (module is RoutableModule) {
          routes.addAll(
            module.routes.map(
              (key, value) => MapEntry('/${module.moduleName}$key', value),
            ),
          );
        }
      }
    }
  }

  /// Inject all [Dependency] on the [RepositoryInjector] from
  /// the [Module] that implements the trait [BindedModule].
  void registerDependencies() {
    if (modules.isNotEmpty) {
      for (Module module in modules) {
        if (module is BindedModule) {
          for (Dependency dependency in module.moduleBinds) {
            RepositoryInjector.instance.inject(dependency);
          }
        }
      }
    }
  }

  /// Method to be used on the [MaterialApp] class property
  /// [onGenerateRoutes].
  Route<dynamic>? generateRoute(RouteSettings settings) {
    var routerName = settings.name;
    var routerArgs = settings.arguments;

    var navigateTo = routes[routerName];
    if (navigateTo == null) return null;

    return MaterialPageRoute(
      builder: (context) => navigateTo.call(context, routerArgs),
    );
  }
}

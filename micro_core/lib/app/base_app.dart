import 'package:flutter/material.dart';
import 'package:micro_core/module/module.dart';
import 'package:micro_core/module/traits/routable_module.dart';
import 'package:micro_core/utils/base_app_util.dart';

///
abstract class BaseApp {
  List<Module> get modules;

  String get initialRoute => modules.first.moduleName;

  final Map<String, WidgetBuilderArgs> routes = {};

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

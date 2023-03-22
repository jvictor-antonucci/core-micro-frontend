import 'package:flutter/material.dart';

class ModuleRoute<T> {
  Uri routeUri;

  T? arguments;

  String moduleName;

  ModuleRoute({required this.moduleName, String route = "", this.arguments})
      : routeUri = Uri(path: route.isNotEmpty ? '$moduleName/$route' : moduleName);

  factory ModuleRoute.fromRouteSettings(RouteSettings route) {
    if (route.name == null || route.name == "") {
      throw ArgumentError('Cannot create a ModuleRoute for an empty route', 'route');
    }

    var uri = Uri(path: route.name);
    var routeModuleName = uri.pathSegments.isNotEmpty ? uri.pathSegments.first : "";

    return ModuleRoute(
      moduleName: "/$routeModuleName",
      route: uri.pathSegments.isNotEmpty ? uri.pathSegments.skip(1).join('/') : "",
      arguments: route.arguments as T?,
    );
  }

  String get path => routeUri.path;

  @override
  bool operator ==(Object other) {
    return other is ModuleRoute && other.routeUri == routeUri && other.moduleName == moduleName;
  }

  @override
  int get hashCode => Object.hash(routeUri, moduleName);
}

extension ModuleRouteExtension on RouteSettings {
  ModuleRoute get toModuleRoute => ModuleRoute.fromRouteSettings(this);
}

import 'package:flutter/material.dart';
import 'package:micro_core/module/module.dart';
import 'package:micro_core/module/route/module_route.dart';

mixin RoutableModule on Module {
  Route<T>? onGenerateRoute<T>(ModuleRoute route);
}

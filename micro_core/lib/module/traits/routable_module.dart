import 'package:flutter/material.dart';
import 'package:micro_core/module/module.dart';
import 'package:micro_core/utils/base_app_util.dart';

/// Trait that implements [routes] for [Module].
mixin RoutableModule on Module {
  Map<String, WidgetBuilderArgs> get routes;
}

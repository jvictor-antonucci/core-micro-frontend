import 'package:flutter/widgets.dart';
import 'package:micro_core/app/base_app.dart';
import 'package:micro_core/module/module.dart';
import 'package:micro_core/module/traits/routable_module.dart';
import 'package:micro_core/utils/base_app_util.dart';

class TestModuleSuccess extends Module {
  @override
  String get moduleName => 'test-module';
}

class TestModuleFailure extends Module {}

class BaseModule extends Module with RoutableModule {
  @override
  String get moduleName => 'test';

  @override
  Map<String, WidgetBuilderArgs> get routes => {
        'route': (context, args) => Container(),
      };
}

class TestBaseApp extends BaseApp {
  @override
  List<Module> get modules => [
        BaseModule(),
      ];
}

import 'package:flutter/widgets.dart';
import 'package:micro_core/app/base_app.dart';
import 'package:micro_core/injection/injector.dart';
import 'package:micro_core/module/module.dart';
import 'package:micro_core/module/traits/binded_module.dart';
import 'package:micro_core/module/traits/routable_module.dart';
import 'package:micro_core/utils/base_app_util.dart';

abstract class ClassToBeInjected {
  double get getDependency;
}

class ImplClassToBeInjected implements ClassToBeInjected {
  final double dependency;

  ImplClassToBeInjected(this.dependency);

  @override
  double get getDependency => dependency;
}

class TestModuleSuccess extends Module {
  @override
  String get moduleName => 'test-module';
}

class BaseModule extends Module with RoutableModule, BindedModule {
  @override
  String get moduleName => 'test';

  @override
  Map<String, WidgetBuilderArgs> get routes => {
        '/route': (context, args) => Container(),
      };

  @override
  List<Dependency> get moduleBinds => [
        Dependency<String>.value('teste'),
        Dependency<double>.value(12.3),
      ];
}

class SecondBaseModule extends Module with BindedModule {
  @override
  String get moduleName => 'secondTest';

  @override
  List<Dependency> get moduleBinds => [
        Dependency<ClassToBeInjected>(
          builder: (i) => ImplClassToBeInjected(i.resolve()),
        ),
      ];
}

class TestBaseApp extends BaseApp {
  @override
  String get initialRoute => '/';

  @override
  List<Module> get modules => [
        SecondBaseModule(),
        BaseModule(),
      ];
}

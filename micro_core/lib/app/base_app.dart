import 'package:micro_core/module/module.dart';
import 'package:micro_core/module/traits/routable_module.dart';

abstract class BaseApp extends Module with RoutableModule {
  List<Module> get modules;

  String get initialRoute => modules.first.moduleName;
}

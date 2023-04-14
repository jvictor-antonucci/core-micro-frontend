import 'package:micro_core/module/module.dart';

abstract class BaseApp {
  List<Module> get modules;

  String get initialRoute => modules.first.moduleName;
}

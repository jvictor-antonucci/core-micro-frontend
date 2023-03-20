import 'package:micro_core/injection/injector.dart';
import 'package:micro_core/module/module.dart';

class ModuleInjector extends Injector<Module> {
  final List<Module> modules;

  ModuleInjector(this.modules);
}

import 'package:micro_core/injection/injector.dart';
import 'package:micro_core/module/module.dart';

/// trait that implements [moduleBinds] for the [Module].
mixin BindedModule on Module {
  /// binds to be injected by the [Injector].
  List<Dependency>? moduleBinds;
}

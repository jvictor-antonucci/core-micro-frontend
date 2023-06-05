import 'package:micro_core/injection/injector.dart';

/// Singleton class that store all dependencies of the app.
class RepositoryInjector extends Injector {
  RepositoryInjector._();

  static final RepositoryInjector _instance = RepositoryInjector._();
  static RepositoryInjector get instance => _instance;
}

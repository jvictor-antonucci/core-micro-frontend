import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:micro_core/injection/repository_injector.dart';

import '../../helpers/test_helpers.dart';

void main() {
  final TestBaseApp testBaseApp = TestBaseApp();
  final RepositoryInjector repositoryInjectorInstance = RepositoryInjector.instance;

  setUpAll(() {
    testBaseApp.registerRouters();
    testBaseApp.registerDependencies();
  });

  group('BaseApp', () {
    test('should present correct list of modules when requested', () {
      expect(testBaseApp.modules.length, 2);
      expect(testBaseApp.modules, [isA<SecondBaseModule>(), isA<BaseModule>()]);
    });

    test('should register correct routes from [registerRouters]', () {
      expect(testBaseApp.routes.length, 1);
      expect(testBaseApp.routes.entries.first.key, '/test/route');
    });

    test('should register correct dependencies from [registerDependencies]', () {
      expect(repositoryInjectorInstance.items.length, 3);
      expect(repositoryInjectorInstance.resolve<String>(), 'teste');
      expect(repositoryInjectorInstance.resolve<double>(), 12.3);
      expect(
        repositoryInjectorInstance.resolve<ClassToBeInjected>(),
        isA<ImplClassToBeInjected>(),
      );
      expect(
        repositoryInjectorInstance.resolve<ClassToBeInjected>().getDependency,
        12.3,
      );
    });

    test('should answer with correct [MaterialPageRoute] when called [generateRoute]', () {
      expect(testBaseApp.generateRoute(const RouteSettings(name: '/test/route')), isA<MaterialPageRoute>());
    });
  });
}

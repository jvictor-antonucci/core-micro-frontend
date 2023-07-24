import 'package:flutter_test/flutter_test.dart';
import 'package:micro_core/injection/injector.dart';
import 'package:micro_core/injection/repository_injector.dart';

import '../../helpers/test_helpers.dart';

void main() {
  final Injector injector = Injector();
  final RepositoryInjector repositoryInjector = RepositoryInjector.instance;

  tearDown(() {
    injector.clear();
  });

  group('Injector', () {
    test('should inject correct object to injector', () {
      String itemToInject = 'injected object';

      injector.inject(Dependency<String>(builder: (i) => itemToInject));

      expect(injector.items.length, 1);
      expect(injector.items.first, 'injected object');
    });
    test('should retrieve correct object from injector', () {
      String itemToInject = 'injected object';
      injector.inject(Dependency<String>(builder: (i) => itemToInject));

      expect(injector.resolve<String>(), 'injected object');
    });

    test('should retrieve correct nested object from injector', () {
      String nestedItemToInject(double number) => 'nested number is $number';

      RepositoryInjector.instance.inject<double>(Dependency.value(12.3));

      injector.inject(Dependency<String>(builder: (i) => nestedItemToInject(i.resolve<double>())));

      expect(injector.resolve<String>(), 'nested number is 12.3');
    });
  });
}

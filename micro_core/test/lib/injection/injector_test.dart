import 'package:flutter_test/flutter_test.dart';
import 'package:micro_core/injection/injector.dart';

void main() {
  final Injector injector = Injector();

  tearDown(() {
    injector.clear();
  });

  group('Injector', () {
    test('should inject correct object to injector', () {
      String itemToInject = 'injected object';

      injector.inject(Dependency<String>(builder: () => itemToInject));

      expect(injector.items.length, 1);
      expect(injector.items.first, 'injected object');
    });
    test('should retrieve correct object from injector', () {
      String itemToInject = 'injected object';
      injector.inject(Dependency<String>(builder: () => itemToInject));

      expect(injector.resolve<String>(), 'injected object');
    });
  });
}

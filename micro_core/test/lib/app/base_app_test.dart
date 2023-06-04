import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../helpers/test_helpers.dart';

void main() {
  late TestBaseApp testBaseApp;

  setUp(() {
    testBaseApp = TestBaseApp();
    testBaseApp.registerRouters();
  });

  group('BaseApp', () {
    test('should present correct list of modules when requested', () {
      expect(testBaseApp.modules.length, 1);
      expect(testBaseApp.modules, [isA<BaseModule>()]);
    });

    test('should register correct routes from [registerRouters]', () {
      expect(testBaseApp.routes.length, 1);
      expect(testBaseApp.routes.entries.first.key, '/test/route');
    });

    test('should answer with correct [MaterialPageRoute] when called [generateRoute]', () {
      expect(testBaseApp.generateRoute(const RouteSettings(name: '/test/route')), isA<MaterialPageRoute>());
    });
  });
}

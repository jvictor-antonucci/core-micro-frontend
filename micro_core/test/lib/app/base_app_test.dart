import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../helpers/test_helpers.dart';

void main() {
  final TestBaseApp testBaseApp = TestBaseApp();

  group('BaseApp', () {
    test('should present correct list of modules when requested', () {
      expect(testBaseApp.modules.length, 1);
      expect(testBaseApp.modules, [isA<BaseModule>()]);
    });

    test(
        'should answer with correct [MaterialPageRoute] when called [generateRoute]',
        () {
      testBaseApp.registerRouters();
      expect(testBaseApp.generateRoute(const RouteSettings(name: 'route')),
          isA<MaterialPageRoute>());
    });
  });
}

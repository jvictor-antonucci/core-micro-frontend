import 'package:flutter_test/flutter_test.dart';

import '../../helpers/test_helpers.dart';

void main() {
  final TestModuleSuccess testModuleSuccess = TestModuleSuccess();

  group('Module', () {
    test(
        'should answer with correct [moduleName] when requested from a well implemented module',
        () {
      expect(testModuleSuccess.moduleName, 'test-module');
    });
  });
}

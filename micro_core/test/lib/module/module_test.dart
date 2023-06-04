import 'package:flutter_test/flutter_test.dart';

import '../../helpers/test_helpers.dart';

void main() {
  final TestModuleSuccess testModuleSuccess = TestModuleSuccess();
  final TestModuleFailure testModuleFailure = TestModuleFailure();

  group('Module', () {
    test('should answer with correct [moduleName] when requested from a well implemented module', () {
      expect(testModuleSuccess.moduleName, 'test-module');
    });
    test('should answer with UnimplementedError when requested [moduleName] to a bad implemented module', () {
      expect(() => testModuleFailure.moduleName, throwsUnimplementedError);
    });
  });
}

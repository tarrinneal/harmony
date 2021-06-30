import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:platform_type/platform_type.dart';

// TODO(GikuyuNderitu): Define a CI/CD task that runs this test on web platforms
void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  testWidgets("failing test example", (WidgetTester tester) async {
    expect(ClientType.platform, PlatformType.web);
  });
}

import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:beardcare/main.dart';

void main() {
  group('Testing App Performance Tests', () {
    final binding = IntegrationTestWidgetsFlutterBinding.ensureInitialized();
    binding.framePolicy = LiveTestWidgetsFlutterBindingFramePolicy.fullyLive;

    testWidgets('Click on Barber', (tester) async {
      await tester.pumpWidget(const MyApp());
      await tester.pump(const Duration(milliseconds: 2000));
      await tester.tap(find.text('Barberia/Tatuador'));
      await tester.pump(const Duration(milliseconds: 2000));
      expect(find.text('Registrarse'), findsOneWidget);
      await tester.pump(const Duration(milliseconds: 2000));
    });
  });
}

import 'package:flutter_test/flutter_test.dart';
import 'package:provider/provider.dart';

import 'package:oaxaca_turismo/main.dart';
import 'package:oaxaca_turismo/providers/catalog_provider.dart';

void main() {
  testWidgets('renders the Oaxaca tourism welcome screen',
      (WidgetTester tester) async {
    await tester.pumpWidget(
      ChangeNotifierProvider(
        create: (_) => CatalogProvider()..load(),
        child: const OaxacaTurismoApp(),
      ),
    );

    expect(find.text('Descubre Oaxaca'), findsOneWidget);
  });
}

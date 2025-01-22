import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shopping_app/screens/home_page.dart';

void main() {
  testWidgets('Test 1: AppBar title is displayed', (WidgetTester tester) async {
    await tester.pumpWidget(const MaterialApp(home: HomePage()));
    expect(find.text('Ergown Fashion'), findsOneWidget);
  });

  testWidgets('Test 2: Shopping cart icon is present',
      (WidgetTester tester) async {
    await tester.pumpWidget(const MaterialApp(home: HomePage()));
    expect(find.byIcon(Icons.shopping_cart), findsOneWidget);
  });

  testWidgets('Test 3: Home button is present in bottom navigation',
      (WidgetTester tester) async {
    await tester.pumpWidget(const MaterialApp(home: HomePage()));
    expect(find.byIcon(Icons.home), findsOneWidget);
  });

  testWidgets('Test 4: Account button is present in bottom navigation',
      (WidgetTester tester) async {
    await tester.pumpWidget(const MaterialApp(home: HomePage()));
    expect(find.byIcon(Icons.person), findsOneWidget);
  });

  testWidgets('Test 5: Product name "Gaun Nikah 1" is present',
      (WidgetTester tester) async {
    await tester.pumpWidget(const MaterialApp(home: HomePage()));
    expect(find.text('Gaun Nikah 1'), findsOneWidget);
  });

  testWidgets('Test 6: Product price "Rp350.000" is present',
      (WidgetTester tester) async {
    await tester.pumpWidget(const MaterialApp(home: HomePage()));
    expect(find.text('Rp350.000'), findsOneWidget);
  });

  testWidgets('Test 7: Product name and price are displayed correctly',
      (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(home: HomePage()));

    expect(find.text('Gaun Nikah 1'), findsOneWidget);

    expect(find.text('Rp350.000'), findsOneWidget);
  });

  testWidgets('Test 8: Scaffold background color is correct',
      (WidgetTester tester) async {
    await tester.pumpWidget(const MaterialApp(home: HomePage()));
    final scaffold = tester.widget<Scaffold>(find.byType(Scaffold));
    expect(scaffold.backgroundColor, equals(const Color(0xFFD9F2F9)));
  });

  testWidgets('Test 9: First product image is displayed',
      (WidgetTester tester) async {
    await tester.pumpWidget(const MaterialApp(home: HomePage()));
    expect(find.image(const AssetImage('assets/gaun1.jpg')), findsOneWidget);
  });

  testWidgets('Test 10: Tapping on a product navigates to detail page',
      (WidgetTester tester) async {
    await tester.pumpWidget(const MaterialApp(home: HomePage()));

    await tester.tap(find.text('Gaun Nikah 1'));
    await tester.pumpAndSettle();

    expect(find.text('Gaun Nikah 1'), findsOneWidget);
  });
}

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:practice_loading_images/main.dart';

void main() {

  testWidgets('Home Page has a title and a TextButton', (tester) async {
    await tester.pumpWidget(const MyApp());

    final titleFinder = find.text('Image Gallery Home');
    final buttonFinder = find.byType(TextButton);

    expect(titleFinder, findsOneWidget);
    expect(buttonFinder, findsOneWidget);
  });
}

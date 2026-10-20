import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:ma_garderie/screens/home_page.dart';

void main() {
  testWidgets('displays the static daycare activity list', (tester) async {
    await tester.pumpWidget(
      const MaterialApp(home: HomePage()),
    );

    expect(find.text('Dessin et coloriage'), findsOneWidget);
    expect(find.text('Développement de la créativité'), findsOneWidget);
    expect(find.text('Jeux éducatifs'), findsOneWidget);
    expect(find.text('Apprentissage par le jeu'), findsOneWidget);
    expect(find.text('Musique et chansons'), findsOneWidget);
    expect(find.text('Éveil musical des enfants'), findsOneWidget);
    expect(find.text('Lecture de contes'), findsOneWidget);
    expect(find.text('Découverte des histoires'), findsOneWidget);
    expect(find.text('Activités sportives'), findsOneWidget);
    expect(find.text('Développement de la motricité'), findsOneWidget);
  });

  testWidgets('shows feedback when the add button and an activity are tapped',
      (tester) async {
    await tester.pumpWidget(
      const MaterialApp(home: HomePage()),
    );

    await tester.tap(find.byTooltip('Nouvelle activité'));
    await tester.pump();
    expect(find.text('Nouvelle activité'), findsOneWidget);

    await tester.tap(find.text('Dessin et coloriage'));
    await tester.pump();
    expect(
      find.descendant(
        of: find.byType(SnackBar),
        matching: find.text('Dessin et coloriage'),
      ),
      findsOneWidget,
    );
  });

  testWidgets('drawer destinations navigate to their selected sections',
      (tester) async {
    await tester.pumpWidget(
      const MaterialApp(home: HomePage()),
    );

    await tester.tap(find.byIcon(Icons.menu));
    await tester.pumpAndSettle();
    expect(find.text('Accueil'), findsOneWidget);
    expect(find.text('Activités'), findsOneWidget);
    expect(find.text('À propos'), findsOneWidget);

    await tester.tap(find.text('À propos'));
    await tester.pumpAndSettle();
    expect(find.text('À propos de Ma Garderie'), findsOneWidget);

    await tester.tap(find.byIcon(Icons.menu));
    await tester.pumpAndSettle();
    await tester.tap(find.text('Activités'));
    await tester.pumpAndSettle();
    expect(find.text('Toutes les activités'), findsOneWidget);
    expect(find.text('Jeux éducatifs'), findsOneWidget);
  });
}

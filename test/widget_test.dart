import 'package:flutter_test/flutter_test.dart';

import 'package:mahjong_website/main.dart';

void main() {
  testWidgets('support page shows main content', (tester) async {
    await tester.pumpWidget(const MahjongSupportApp());

    expect(find.text('Поддержка игры'), findsOneWidget);
    expect(find.text('Скачать в RuStore'), findsOneWidget);
    expect(find.text('matu1@mail.ru'), findsOneWidget);
  });

  testWidgets('language switch changes content to English', (tester) async {
    await tester.pumpWidget(const MahjongSupportApp());

    await tester.tap(find.text('EN'));
    await tester.pumpAndSettle();

    expect(find.text('Game support'), findsOneWidget);
    expect(find.text('Download on RuStore'), findsOneWidget);
  });
}

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:wollk_movie_pedia/features/trending/domain/entities/trending.dart';
import 'package:wollk_movie_pedia/features/trending/presentation/widgets/trending_item_widget.dart';

void main() {
  Widget makeTestableWidget(Widget body) {
    return MaterialApp(
      home: Scaffold(body: body),
    );
  }

  Trending trending = const Trending(
    id: 123,
    posterImage: 'poster.jpg',
    title: 'Spederman',
  );
  testWidgets('trending item widget ...', (tester) async {
    await tester
        .pumpWidget(makeTestableWidget(TrendingItemWidget(item: trending)));
    var widgetInkwell = find.byType(InkWell);
    expect(widgetInkwell, findsOneWidget);
    expect(find.text('Spederman'), findsOneWidget);
  });
}

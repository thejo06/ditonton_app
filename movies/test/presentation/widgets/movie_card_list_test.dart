import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:movies/domain/entities/movie.dart';
import 'package:movies/presentation/widgets/movie_card_list.dart';

void main() {
  late Movie movie;

  setUp(() {
    movie = Movie(
      adult: false,
      backdropPath: '/muth4OYamXf41G2evdrLEg8d3om.jpg',
      genreIds: [14, 28],
      id: 557,
      originalTitle: 'Spider-Man',
      overview:
          'After being bitten by a genetically altered spider, nerdy high school student Peter Parker is endowed with amazing powers to become the Amazing superhero known as Spider-Man.',
      popularity: 60.441,
      posterPath: '/rweIrveL43TaxUN0akQEaAXL6x0.jpg',
      releaseDate: '2002-05-01',
      title: 'Spider-Man',
      video: false,
      voteAverage: 7.2,
      voteCount: 13507,
    );
  });

  Widget _makeTestableWidget(Widget body) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
        colorScheme: kColorScheme,
        primaryColor: kRichBlack,
        scaffoldBackgroundColor: kRichBlack,
        textTheme: kTextTheme,
      ),
      home: Scaffold(body: body),
    );
  }

  testWidgets('Check if tv card should show properly',
      (WidgetTester tester) async {
    final cardFinder = find.byType(Card);
    await tester.pumpWidget(_makeTestableWidget(MovieCard(
      movie,
    )));
    final textFinder = find.text('Spider-Man');
    expect(textFinder, findsOneWidget);
    expect(cardFinder, findsOneWidget);
  });
}

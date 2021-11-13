import 'package:core/core.dart';
import 'package:core/tv_series/domain/usecase/get_watchlist_tv.dart';
import 'package:core/tv_series/presentation/provider/watchlist_tv_notifier.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import '../../../dummy_data/dummy_objects.dart';
import 'watchlist_tv_notifier_test.mocks.dart';

@GenerateMocks([GetWatchListTVs])
void main() {
  late WatchlistTvNotifier provider;
  late MockGetWatchListTVs mockGetWatchListTVs;
  late int listenerCallCount;

  setUp(() {
    listenerCallCount = 0;
    mockGetWatchListTVs = MockGetWatchListTVs();
    provider = WatchlistTvNotifier(getWatchListTVs: mockGetWatchListTVs)
      ..addListener(() {
        listenerCallCount += 1;
      });
  });

  test('should change tv series data when data is gotten successfully',
      () async {
    // arrange
    when(mockGetWatchListTVs.execute())
        .thenAnswer((_) async => Right([testWatchlistTvSeries]));
    // act
    await provider.fetchWatchlistTv();
    // assert
    expect(provider.watchlistState, RequestState.Loaded);
    expect(provider.watchlistTv, [testWatchlistTvSeries]);
    expect(listenerCallCount, 2);
  });

  test('should return error when data is unsuccessful', () async {
    // arrange
    when(mockGetWatchListTVs.execute())
        .thenAnswer((_) async => Left(DatabaseFailure("Can't get data")));
    // act
    await provider.fetchWatchlistTv();
    // assert
    expect(provider.watchlistState, RequestState.Error);
    expect(provider.message, "Can't get data");
    expect(listenerCallCount, 2);
  });
}
import 'package:core/utils/exception.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:movies/data/datasource/movie_local_data_source.dart';

import '../../dummy_data/dummy_objects.dart';
import '../../helpers/test_helper.mocks.dart';

void main() {
  late MovieLocalDataSourceImpl dataSource;
  late MockDatabaseHelper mockDatabaseHelper;

  setUp(() {
    mockDatabaseHelper = MockDatabaseHelper();
    dataSource = MovieLocalDataSourceImpl(databaseHelper: mockDatabaseHelper);
  });

  group('save watchlist', () {
    test('should return success message when insert to database is success',
        () async {
      // arrange
      when(mockDatabaseHelper.insertWatchlistMovie(testMovieTable))
          .thenAnswer((_) async => 1);
      // act
      final result = await dataSource.insertWatchlist(testMovieTable);
      // assert
      expect(result, 'Added to Watchlist');
    });

    test('should throw DatabaseException when insert to database is failed',
        () async {
      // arrange
      when(mockDatabaseHelper.insertWatchlistMovie(testMovieTable))
          .thenThrow(Exception());
      // act
      final call = dataSource.insertWatchlist(testMovieTable);
      // assert
      expect(() => call, throwsA(isA<DatabaseException>()));
    });
  });

  group('remove watchlist', () {
    test('should return success message when remove from database is success',
        () async {
      // arrange
      when(mockDatabaseHelper.removeWatchlistMovie(testMovieTable))
          .thenAnswer((_) async => 1);
      // act
      final result = await dataSource.removeWatchlist(testMovieTable);
      // assert
      expect(result, 'Removed from Watchlist');
    });

    test('should throw DatabaseException when remove from database is failed',
        () async {
      // arrange
      when(mockDatabaseHelper.removeWatchlistMovie(testMovieTable))
          .thenThrow(Exception());
      // act
      final call = dataSource.removeWatchlist(testMovieTable);
      // assert
      expect(() => call, throwsA(isA<DatabaseException>()));
    });
  });

  group('Get Movie Detail By Id', () {
    final tId = 1;

    test('should return Movie Detail Table when data is found', () async {
      // arrange
      when(mockDatabaseHelper.getMovieById(tId))
          .thenAnswer((_) async => testMovieMap);
      // act
      final result = await dataSource.getMovieById(tId);
      // assert
      expect(result, testMovieTable);
    });

    test('should return null when data is not found', () async {
      // arrange
      when(mockDatabaseHelper.getMovieById(tId)).thenAnswer((_) async => null);
      // act
      final result = await dataSource.getMovieById(tId);
      // assert
      expect(result, null);
    });
  });

  group('get watchlist movies', () {
    test('should return list of MovieTable from database', () async {
      // arrange
      when(mockDatabaseHelper.getWatchlistMovies())
          .thenAnswer((_) async => [testMovieMap]);
      // act
      final result = await dataSource.getWatchlistMovies();
      // assert
      expect(result, [testMovieTable]);
    });
  });

  group('cache now playing movies', () {
    test('should call database helper to save data', () async {
      // arrange
      when(mockDatabaseHelper.clearCacheMovie('now playing'))
          .thenAnswer((_) async => 1);
      // act
      await dataSource.cacheNowPlayingMovies([testMovieCache]);
      // assert
      verify(mockDatabaseHelper.clearCacheMovie('now playing'));
      verify(mockDatabaseHelper
          .insertCacheTransactionMovie([testMovieCache], 'now playing'));
    });

    test('should return list of movies from db when data exist', () async {
      // arrange
      when(mockDatabaseHelper.getCacheMovies('now playing'))
          .thenAnswer((_) async => [testMovieCacheMap].toList());
      // act
      final result = await dataSource.getCachedNowPlayingMovies();
      // assert
      expect(result, [testMovieCache]);
    });

    test('should throw CacheException when cache data is not exist', () async {
      // arrange
      when(mockDatabaseHelper.getCacheMovies('now playing'))
          .thenAnswer((_) async => []);
      // act
      final call = dataSource.getCachedNowPlayingMovies();
      // assert
      expect(() => call, throwsA(isA<CacheException>()));
    });
  });

  group('cache popular movies', () {
    test('should call database helper to save data', () async {
      // arrange
      when(mockDatabaseHelper.clearCacheMovie('popular movies'))
          .thenAnswer((_) async => 1);
      // act
      await dataSource.cachePopularMovies([testMovieCache]);
      // assert
      verify(mockDatabaseHelper.clearCacheMovie('popular movies'));
      verify(mockDatabaseHelper
          .insertCacheTransactionMovie([testMovieCache], 'popular movies'));
    });

    test('should return list of movies from db when data exist', () async {
      // arrange
      when(mockDatabaseHelper.getCacheMovies('popular movies'))
          .thenAnswer((_) async => [testMovieCacheMap].toList());
      final result = await dataSource.getCachedPopularMovies();
      // assert
      expect(result, [testMovieCache]);
    });

    test('should throw CacheException when cache data is not exist', () async {
      // arrange
      when(mockDatabaseHelper.getCacheMovies('popular movies'))
          .thenAnswer((_) async => []);
      // act
      final call = dataSource.getCachedPopularMovies();
      // assert
      expect(() => call, throwsA(isA<CacheException>()));
    });
  });

  group('cache top rated movies', () {
    test('should call database helper to save data', () async {
      // arrange
      when(mockDatabaseHelper.clearCacheMovie('top rated movies'))
          .thenAnswer((_) async => 1);
      // act
      await dataSource.cacheTopRatedMovies([testMovieCache]);
      // assert
      verify(mockDatabaseHelper.clearCacheMovie('top rated movies'));
      verify(mockDatabaseHelper
          .insertCacheTransactionMovie([testMovieCache], 'top rated movies'));
    });

    test('should return list of movies from db when data exist', () async {
      // arrange
      when(mockDatabaseHelper.getCacheMovies('top rated movies'))
          .thenAnswer((_) async => [testMovieCacheMap].toList());
      final result = await dataSource.getCachedTopRatedMovies();
      // assert
      expect(result, [testMovieCache]);
    });

    test('should throw CacheException when cache data is not exist', () async {
      // arrange
      when(mockDatabaseHelper.getCacheMovies('top rated movies'))
          .thenAnswer((_) async => []);
      // act
      final call = dataSource.getCachedTopRatedMovies();
      // assert
      expect(() => call, throwsA(isA<CacheException>()));
    });
  });
}

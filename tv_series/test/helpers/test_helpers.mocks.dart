// Mocks generated by Mockito 5.0.16 from annotations
// in tv_series/test/helpers/test_helpers.dart.
// Do not manually edit this file.

import 'dart:async' as _i6;
import 'dart:convert' as _i10;
import 'dart:typed_data' as _i11;

import 'package:core/data/datasources/db/database_helper.dart' as _i5;
import 'package:core/utils/failure.dart' as _i9;
import 'package:dartz/dartz.dart' as _i2;
import 'package:http/http.dart' as _i4;
import 'package:mockito/mockito.dart' as _i1;
import 'package:movies/data/models/movie_table.dart' as _i8;
import 'package:sqflite/sqflite.dart' as _i7;
import 'package:tv_series/tv_series.dart' as _i3;

// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis
// ignore_for_file: camel_case_types

class _FakeEither_0<L, R> extends _i1.Fake implements _i2.Either<L, R> {}

class _FakeTvDetailModel_1 extends _i1.Fake implements _i3.TvDetailModel {}

class _FakeResponse_2 extends _i1.Fake implements _i4.Response {}

class _FakeStreamedResponse_3 extends _i1.Fake implements _i4.StreamedResponse {
}

/// A class which mocks [DatabaseHelper].
///
/// See the documentation for Mockito's code generation for more information.
class MockDatabaseHelper extends _i1.Mock implements _i5.DatabaseHelper {
  MockDatabaseHelper() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i6.Future<_i7.Database?> get database => (super.noSuchMethod(
      Invocation.getter(#database),
      returnValue: Future<_i7.Database?>.value()) as _i6.Future<_i7.Database?>);
  @override
  _i6.Future<void> insertCacheTransaction(
          List<_i8.MovieTable>? movies, String? category) =>
      (super.noSuchMethod(
          Invocation.method(#insertCacheTransaction, [movies, category]),
          returnValue: Future<void>.value(),
          returnValueForMissingStub: Future<void>.value()) as _i6.Future<void>);
  @override
  _i6.Future<List<Map<String, dynamic>>> getCacheMovies(String? category) =>
      (super.noSuchMethod(Invocation.method(#getCacheMovies, [category]),
              returnValue: Future<List<Map<String, dynamic>>>.value(
                  <Map<String, dynamic>>[]))
          as _i6.Future<List<Map<String, dynamic>>>);
  @override
  _i6.Future<int> clearCache(String? category) =>
      (super.noSuchMethod(Invocation.method(#clearCache, [category]),
          returnValue: Future<int>.value(0)) as _i6.Future<int>);
  @override
  _i6.Future<int> insertWatchlist(_i8.MovieTable? movie) =>
      (super.noSuchMethod(Invocation.method(#insertWatchlist, [movie]),
          returnValue: Future<int>.value(0)) as _i6.Future<int>);
  @override
  _i6.Future<int> removeWatchlist(_i8.MovieTable? movie) =>
      (super.noSuchMethod(Invocation.method(#removeWatchlist, [movie]),
          returnValue: Future<int>.value(0)) as _i6.Future<int>);
  @override
  _i6.Future<Map<String, dynamic>?> getMovieById(int? id) =>
      (super.noSuchMethod(Invocation.method(#getMovieById, [id]),
              returnValue: Future<Map<String, dynamic>?>.value())
          as _i6.Future<Map<String, dynamic>?>);
  @override
  _i6.Future<List<Map<String, dynamic>>> getWatchlistMovies() =>
      (super.noSuchMethod(Invocation.method(#getWatchlistMovies, []),
              returnValue: Future<List<Map<String, dynamic>>>.value(
                  <Map<String, dynamic>>[]))
          as _i6.Future<List<Map<String, dynamic>>>);
  @override
  _i6.Future<int> insertWatchlistTv(_i3.TvTable? tv) =>
      (super.noSuchMethod(Invocation.method(#insertWatchlistTv, [tv]),
          returnValue: Future<int>.value(0)) as _i6.Future<int>);
  @override
  _i6.Future<int> removeWatchlistTv(_i3.TvTable? tv) =>
      (super.noSuchMethod(Invocation.method(#removeWatchlistTv, [tv]),
          returnValue: Future<int>.value(0)) as _i6.Future<int>);
  @override
  _i6.Future<Map<String, dynamic>?> getTvSeriesById(int? id) =>
      (super.noSuchMethod(Invocation.method(#getTvSeriesById, [id]),
              returnValue: Future<Map<String, dynamic>?>.value())
          as _i6.Future<Map<String, dynamic>?>);
  @override
  _i6.Future<List<Map<String, dynamic>>> getWatchlistTVs() =>
      (super.noSuchMethod(Invocation.method(#getWatchlistTVs, []),
              returnValue: Future<List<Map<String, dynamic>>>.value(
                  <Map<String, dynamic>>[]))
          as _i6.Future<List<Map<String, dynamic>>>);
  @override
  String toString() => super.toString();
}

/// A class which mocks [TvRepository].
///
/// See the documentation for Mockito's code generation for more information.
class MockTvRepository extends _i1.Mock implements _i3.TvRepository {
  MockTvRepository() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i6.Future<_i2.Either<_i9.Failure, List<_i3.Tv>>> getTvAiringToday() =>
      (super.noSuchMethod(Invocation.method(#getTvAiringToday, []),
              returnValue: Future<_i2.Either<_i9.Failure, List<_i3.Tv>>>.value(
                  _FakeEither_0<_i9.Failure, List<_i3.Tv>>()))
          as _i6.Future<_i2.Either<_i9.Failure, List<_i3.Tv>>>);
  @override
  _i6.Future<_i2.Either<_i9.Failure, List<_i3.Tv>>> getPopularTVs() =>
      (super.noSuchMethod(Invocation.method(#getPopularTVs, []),
              returnValue: Future<_i2.Either<_i9.Failure, List<_i3.Tv>>>.value(
                  _FakeEither_0<_i9.Failure, List<_i3.Tv>>()))
          as _i6.Future<_i2.Either<_i9.Failure, List<_i3.Tv>>>);
  @override
  _i6.Future<_i2.Either<_i9.Failure, List<_i3.Tv>>> getTopRatedTVs() =>
      (super.noSuchMethod(Invocation.method(#getTopRatedTVs, []),
              returnValue: Future<_i2.Either<_i9.Failure, List<_i3.Tv>>>.value(
                  _FakeEither_0<_i9.Failure, List<_i3.Tv>>()))
          as _i6.Future<_i2.Either<_i9.Failure, List<_i3.Tv>>>);
  @override
  _i6.Future<_i2.Either<_i9.Failure, _i3.TvDetail>> getDetailTVs(int? id) =>
      (super.noSuchMethod(Invocation.method(#getDetailTVs, [id]),
              returnValue: Future<_i2.Either<_i9.Failure, _i3.TvDetail>>.value(
                  _FakeEither_0<_i9.Failure, _i3.TvDetail>()))
          as _i6.Future<_i2.Either<_i9.Failure, _i3.TvDetail>>);
  @override
  _i6.Future<_i2.Either<_i9.Failure, List<_i3.Tv>>> getTvRecommendations(
          int? id) =>
      (super.noSuchMethod(Invocation.method(#getTvRecommendations, [id]),
              returnValue: Future<_i2.Either<_i9.Failure, List<_i3.Tv>>>.value(
                  _FakeEither_0<_i9.Failure, List<_i3.Tv>>()))
          as _i6.Future<_i2.Either<_i9.Failure, List<_i3.Tv>>>);
  @override
  _i6.Future<_i2.Either<_i9.Failure, List<_i3.TvEpisode>>> getTvSeasonEpisodes(
          int? id, int? seasonNumber) =>
      (super.noSuchMethod(
              Invocation.method(#getTvSeasonEpisodes, [id, seasonNumber]),
              returnValue:
                  Future<_i2.Either<_i9.Failure, List<_i3.TvEpisode>>>.value(
                      _FakeEither_0<_i9.Failure, List<_i3.TvEpisode>>()))
          as _i6.Future<_i2.Either<_i9.Failure, List<_i3.TvEpisode>>>);
  @override
  _i6.Future<_i2.Either<_i9.Failure, List<_i3.Tv>>> searchTVs(String? query) =>
      (super.noSuchMethod(Invocation.method(#searchTVs, [query]),
              returnValue: Future<_i2.Either<_i9.Failure, List<_i3.Tv>>>.value(
                  _FakeEither_0<_i9.Failure, List<_i3.Tv>>()))
          as _i6.Future<_i2.Either<_i9.Failure, List<_i3.Tv>>>);
  @override
  _i6.Future<_i2.Either<_i9.Failure, String>> saveWatchlistTv(
          _i3.TvDetail? tv) =>
      (super.noSuchMethod(Invocation.method(#saveWatchlistTv, [tv]),
              returnValue: Future<_i2.Either<_i9.Failure, String>>.value(
                  _FakeEither_0<_i9.Failure, String>()))
          as _i6.Future<_i2.Either<_i9.Failure, String>>);
  @override
  _i6.Future<_i2.Either<_i9.Failure, String>> removeWatchlistTv(
          _i3.TvDetail? tv) =>
      (super.noSuchMethod(Invocation.method(#removeWatchlistTv, [tv]),
              returnValue: Future<_i2.Either<_i9.Failure, String>>.value(
                  _FakeEither_0<_i9.Failure, String>()))
          as _i6.Future<_i2.Either<_i9.Failure, String>>);
  @override
  _i6.Future<bool> isTvAddedToWatchlist(int? id) =>
      (super.noSuchMethod(Invocation.method(#isTvAddedToWatchlist, [id]),
          returnValue: Future<bool>.value(false)) as _i6.Future<bool>);
  @override
  _i6.Future<_i2.Either<_i9.Failure, List<_i3.Tv>>> getWatchlistTVs() =>
      (super.noSuchMethod(Invocation.method(#getWatchlistTVs, []),
              returnValue: Future<_i2.Either<_i9.Failure, List<_i3.Tv>>>.value(
                  _FakeEither_0<_i9.Failure, List<_i3.Tv>>()))
          as _i6.Future<_i2.Either<_i9.Failure, List<_i3.Tv>>>);
  @override
  String toString() => super.toString();
}

/// A class which mocks [TvRemoteDataSource].
///
/// See the documentation for Mockito's code generation for more information.
class MockTvRemoteDataSource extends _i1.Mock
    implements _i3.TvRemoteDataSource {
  MockTvRemoteDataSource() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i6.Future<List<_i3.TvModel>> getTvAiringToday() =>
      (super.noSuchMethod(Invocation.method(#getTvAiringToday, []),
              returnValue: Future<List<_i3.TvModel>>.value(<_i3.TvModel>[]))
          as _i6.Future<List<_i3.TvModel>>);
  @override
  _i6.Future<List<_i3.TvModel>> getPopularTVs() =>
      (super.noSuchMethod(Invocation.method(#getPopularTVs, []),
              returnValue: Future<List<_i3.TvModel>>.value(<_i3.TvModel>[]))
          as _i6.Future<List<_i3.TvModel>>);
  @override
  _i6.Future<List<_i3.TvModel>> getTopRatedTVs() =>
      (super.noSuchMethod(Invocation.method(#getTopRatedTVs, []),
              returnValue: Future<List<_i3.TvModel>>.value(<_i3.TvModel>[]))
          as _i6.Future<List<_i3.TvModel>>);
  @override
  _i6.Future<_i3.TvDetailModel> getDetailTVs(int? id) => (super.noSuchMethod(
          Invocation.method(#getDetailTVs, [id]),
          returnValue: Future<_i3.TvDetailModel>.value(_FakeTvDetailModel_1()))
      as _i6.Future<_i3.TvDetailModel>);
  @override
  _i6.Future<List<_i3.TvModel>> getTvRecommendations(int? id) =>
      (super.noSuchMethod(Invocation.method(#getTvRecommendations, [id]),
              returnValue: Future<List<_i3.TvModel>>.value(<_i3.TvModel>[]))
          as _i6.Future<List<_i3.TvModel>>);
  @override
  _i6.Future<List<_i3.TvEpisodeModel>> getTvSeasonEpisodes(
          int? id, int? seasonNumber) =>
      (super.noSuchMethod(
          Invocation.method(#getTvSeasonEpisodes, [id, seasonNumber]),
          returnValue: Future<List<_i3.TvEpisodeModel>>.value(
              <_i3.TvEpisodeModel>[])) as _i6.Future<List<_i3.TvEpisodeModel>>);
  @override
  _i6.Future<List<_i3.TvModel>> searchTVs(String? query) =>
      (super.noSuchMethod(Invocation.method(#searchTVs, [query]),
              returnValue: Future<List<_i3.TvModel>>.value(<_i3.TvModel>[]))
          as _i6.Future<List<_i3.TvModel>>);
  @override
  String toString() => super.toString();
}

/// A class which mocks [TvLocalDataSource].
///
/// See the documentation for Mockito's code generation for more information.
class MockTvLocalDataSource extends _i1.Mock implements _i3.TvLocalDataSource {
  MockTvLocalDataSource() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i6.Future<String> insertWatchlistTv(_i3.TvTable? tv) =>
      (super.noSuchMethod(Invocation.method(#insertWatchlistTv, [tv]),
          returnValue: Future<String>.value('')) as _i6.Future<String>);
  @override
  _i6.Future<String> removeWatchlistTv(_i3.TvTable? tv) =>
      (super.noSuchMethod(Invocation.method(#removeWatchlistTv, [tv]),
          returnValue: Future<String>.value('')) as _i6.Future<String>);
  @override
  _i6.Future<_i3.TvTable?> getTvSeriesById(int? id) => (super.noSuchMethod(
      Invocation.method(#getTvSeriesById, [id]),
      returnValue: Future<_i3.TvTable?>.value()) as _i6.Future<_i3.TvTable?>);
  @override
  _i6.Future<List<_i3.TvTable>> getWatchlistTVs() =>
      (super.noSuchMethod(Invocation.method(#getWatchlistTVs, []),
              returnValue: Future<List<_i3.TvTable>>.value(<_i3.TvTable>[]))
          as _i6.Future<List<_i3.TvTable>>);
  @override
  String toString() => super.toString();
}

/// A class which mocks [Client].
///
/// See the documentation for Mockito's code generation for more information.
class MockHttpClient extends _i1.Mock implements _i4.Client {
  MockHttpClient() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i6.Future<_i4.Response> head(Uri? url, {Map<String, String>? headers}) =>
      (super.noSuchMethod(Invocation.method(#head, [url], {#headers: headers}),
              returnValue: Future<_i4.Response>.value(_FakeResponse_2()))
          as _i6.Future<_i4.Response>);
  @override
  _i6.Future<_i4.Response> get(Uri? url, {Map<String, String>? headers}) =>
      (super.noSuchMethod(Invocation.method(#get, [url], {#headers: headers}),
              returnValue: Future<_i4.Response>.value(_FakeResponse_2()))
          as _i6.Future<_i4.Response>);
  @override
  _i6.Future<_i4.Response> post(Uri? url,
          {Map<String, String>? headers,
          Object? body,
          _i10.Encoding? encoding}) =>
      (super.noSuchMethod(
              Invocation.method(#post, [url],
                  {#headers: headers, #body: body, #encoding: encoding}),
              returnValue: Future<_i4.Response>.value(_FakeResponse_2()))
          as _i6.Future<_i4.Response>);
  @override
  _i6.Future<_i4.Response> put(Uri? url,
          {Map<String, String>? headers,
          Object? body,
          _i10.Encoding? encoding}) =>
      (super.noSuchMethod(
              Invocation.method(#put, [url],
                  {#headers: headers, #body: body, #encoding: encoding}),
              returnValue: Future<_i4.Response>.value(_FakeResponse_2()))
          as _i6.Future<_i4.Response>);
  @override
  _i6.Future<_i4.Response> patch(Uri? url,
          {Map<String, String>? headers,
          Object? body,
          _i10.Encoding? encoding}) =>
      (super.noSuchMethod(
              Invocation.method(#patch, [url],
                  {#headers: headers, #body: body, #encoding: encoding}),
              returnValue: Future<_i4.Response>.value(_FakeResponse_2()))
          as _i6.Future<_i4.Response>);
  @override
  _i6.Future<_i4.Response> delete(Uri? url,
          {Map<String, String>? headers,
          Object? body,
          _i10.Encoding? encoding}) =>
      (super.noSuchMethod(
              Invocation.method(#delete, [url],
                  {#headers: headers, #body: body, #encoding: encoding}),
              returnValue: Future<_i4.Response>.value(_FakeResponse_2()))
          as _i6.Future<_i4.Response>);
  @override
  _i6.Future<String> read(Uri? url, {Map<String, String>? headers}) =>
      (super.noSuchMethod(Invocation.method(#read, [url], {#headers: headers}),
          returnValue: Future<String>.value('')) as _i6.Future<String>);
  @override
  _i6.Future<_i11.Uint8List> readBytes(Uri? url,
          {Map<String, String>? headers}) =>
      (super.noSuchMethod(
              Invocation.method(#readBytes, [url], {#headers: headers}),
              returnValue: Future<_i11.Uint8List>.value(_i11.Uint8List(0)))
          as _i6.Future<_i11.Uint8List>);
  @override
  _i6.Future<_i4.StreamedResponse> send(_i4.BaseRequest? request) =>
      (super.noSuchMethod(Invocation.method(#send, [request]),
              returnValue:
                  Future<_i4.StreamedResponse>.value(_FakeStreamedResponse_3()))
          as _i6.Future<_i4.StreamedResponse>);
  @override
  void close() => super.noSuchMethod(Invocation.method(#close, []),
      returnValueForMissingStub: null);
  @override
  String toString() => super.toString();
}

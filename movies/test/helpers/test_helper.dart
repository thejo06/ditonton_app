import 'package:core/core.dart';
import 'package:mockito/annotations.dart';
import 'package:movies/data/datasource/movie_local_data_source.dart';
import 'package:movies/data/datasource/movie_remote_data_source.dart';
import 'package:movies/domain/repositories/movie_repository.dart';
import 'package:http/http.dart' as http;

@GenerateMocks([
  DatabaseHelper,
  MovieRepository,
  MovieRemoteDataSource,
  MovieLocalDataSource,
  NetworkInfo,
], customMocks: [
  MockSpec<http.Client>(as: #MockHttpClient),
])
void main() {}

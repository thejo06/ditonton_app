import 'package:dartz/dartz.dart';
import 'package:ditonton/common/failure.dart';
import '../entities/tv.dart';
import '../repositories/tv_repository.dart';

class GetTvRecommendations {
  final TvRepository repository;
  GetTvRecommendations({required this.repository});

  Future<Either<Failure, List<Tv>>> execute(id) {
    return repository.getTvRecommendations(id);
  }
}

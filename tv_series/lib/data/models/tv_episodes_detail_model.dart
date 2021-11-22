import 'package:equatable/equatable.dart';
import 'package:tv_series/domain/entities/tv_episodes_detail.dart';

class TvEpisodesDetailModel extends Equatable {
  TvEpisodesDetailModel({
    required this.airDate,
    required this.episodeNumber,
    required this.id,
    required this.name,
    required this.overview,
    required this.stillPath,
  });

  final String? airDate;
  final int episodeNumber;
  final int id;
  final String name;
  final String overview;
  final String? stillPath;

  factory TvEpisodesDetailModel.fromJson(Map<String, dynamic> json) =>
      TvEpisodesDetailModel(
        airDate: json["air_date"],
        episodeNumber: json["episode_number"],
        id: json["id"],
        name: json["name"],
        overview: json["overview"],
        stillPath: json["still_path"],
      );

  Map<String, dynamic> toJson() => {
        "air_date": airDate,
        "episode_number": episodeNumber,
        "id": id,
        "name": name,
        "overview": overview,
        "still_path": stillPath,
      };

  TvEpisodeDetail toEntity() {
    return TvEpisodeDetail(
      airDate: this.airDate,
      episodeNumber: this.episodeNumber,
      id: this.id,
      name: this.name,
      overview: this.overview,
      stillPath: this.stillPath,
    );
  }

  @override
  List<Object?> get props => [
        airDate,
        episodeNumber,
        id,
        name,
        overview,
        stillPath,
      ];
}

import 'package:cached_network_image/cached_network_image.dart';
import 'package:core/core.dart';
import 'package:core/utils/routes.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tv_series/presentation/bloc/tv_detail_bloc/tv_detail_bloc.dart';
import 'package:tv_series/presentation/bloc/tv_detail_bloc/tv_recommendations_bloc.dart';
import 'package:tv_series/presentation/bloc/tv_detail_bloc/tv_watchlist_bloc.dart';
import 'package:tv_series/presentation/widgets/genre_and_duration.dart';
import 'package:tv_series/tv_series.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:provider/provider.dart';
import 'package:flutter/painting.dart';

class DetailTvPage extends StatefulWidget {
  static const ROUTE_NAME = '/detail-tv';

  final int id;
  DetailTvPage({required this.id});

  @override
  _DetailTvPageState createState() => _DetailTvPageState();
}

class _DetailTvPageState extends State<DetailTvPage> {
  @override
  void initState() {
    super.initState();
    Future.microtask(() {
      context.read<TvDetailBloc>().add(
            FetchTvDetail(widget.id),
          );
      context.read<TvRecommendationsBloc>().add(
            FetchTvRecommendations(widget.id),
          );
      context.read<TvDetailWatchlistBloc>().add(
            LoadTvWatchlistStatus(widget.id),
          );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<TvDetailBloc, TvDetailState>(
        builder: (context, state) {
          if (state is TvDetailLoading) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is TvDetailHasData) {
            final tvDetail = state.detail;
            return SafeArea(
              child: DetailContent(
                tvDetail,
              ),
            );
          } else if (state is TvDetailError) {
            return Text(
              state.message,
              key: Key('error_message'),
            );
          } else {
            return Text('Empty');
          }
        },
      ),
    );
  }
}

class DetailContent extends StatelessWidget {
  final TvDetail tvDetail;
  DetailContent(
    this.tvDetail,
  );

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return Stack(
      children: [
        CachedNetworkImage(
          imageUrl: 'https://image.tmdb.org/t/p/w500${tvDetail.posterPath}',
          width: screenWidth,
          placeholder: (context, url) => Center(
            child: CircularProgressIndicator(),
          ),
          errorWidget: (context, url, error) => Icon(Icons.error),
        ),
        BlocListener<TvDetailWatchlistBloc, TvWatchlistState>(
          listener: (context, state) {
            if (state is ReceivedStatus &&
                state.message ==
                    TvDetailWatchlistBloc.watchlistAddSuccessMessage) {
              ScaffoldMessenger.of(context).hideCurrentSnackBar();
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                content: Text(state.message),
              ));
            } else if (state is ReceivedStatus &&
                state.message ==
                    TvDetailWatchlistBloc.watchlistRemoveSuccessMessage) {
              ScaffoldMessenger.of(context).hideCurrentSnackBar();
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text(state.message)),
              );
            } else if (state is ErrorStatus) {
              showDialog(
                context: context,
                builder: (context) => AlertDialog(
                  content: Text(state.message),
                ),
              );
            }
          },
          child: Container(
            margin: const EdgeInsets.only(top: 48 + 8),
            child: DraggableScrollableSheet(
              builder: (context, scrollController) {
                return Container(
                  padding: const EdgeInsets.only(
                    left: 16,
                    top: 16,
                    right: 16,
                  ),
                  decoration: BoxDecoration(
                    color: kRichBlack,
                    borderRadius: BorderRadius.vertical(
                      top: Radius.circular(16.0),
                    ),
                  ),
                  child: Stack(
                    children: [
                      Container(
                        margin: const EdgeInsets.only(top: 16),
                        child: SingleChildScrollView(
                          controller: scrollController,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                tvDetail.name,
                                style: kHeading5,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  BlocBuilder<TvDetailWatchlistBloc,
                                      TvWatchlistState>(
                                    buildWhen: (prev, cur) {
                                      if (cur is ErrorStatus) {
                                        return false;
                                      }
                                      return true;
                                    },
                                    builder: (context, state) {
                                      if (state is ReceivedStatus) {
                                        return ElevatedButton(
                                          key: Key('btn_watchlist'),
                                          onPressed: () async {
                                            if (!state.status) {
                                              context
                                                  .read<TvDetailWatchlistBloc>()
                                                  .add(AddWatchlist(tvDetail));
                                            } else {
                                              context
                                                  .read<TvDetailWatchlistBloc>()
                                                  .add(RemoveFromWatchlist(
                                                      tvDetail));
                                            }
                                          },
                                          child: Row(
                                            mainAxisSize: MainAxisSize.min,
                                            children: [
                                              (state.status)
                                                  ? Icon(Icons.check)
                                                  : Icon(Icons.add),
                                              Text('Watchlist'),
                                            ],
                                          ),
                                        );
                                      } else {
                                        return CircularProgressIndicator();
                                      }
                                    },
                                  ),
                                  Row(
                                    children: [
                                      RatingBarIndicator(
                                        rating: tvDetail.voteAverage / 2,
                                        itemCount: 5,
                                        itemBuilder: (context, index) => Icon(
                                          Icons.star,
                                          color: kMikadoYellow,
                                        ),
                                        itemSize: 24,
                                      ),
                                      Text('${tvDetail.voteAverage}')
                                    ],
                                  ),
                                ],
                              ),
                              Text(
                                showGenres(tvDetail.genres),
                                style: kBodyText,
                              ),
                              SizedBox(height: 10),
                              Container(
                                width: MediaQuery.of(context).size.width,
                                padding: EdgeInsets.all(8),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(8),
                                  ),
                                  border: Border.all(
                                    color: kDavysGrey,
                                  ),
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      padding: EdgeInsets.all(4),
                                      decoration: BoxDecoration(
                                          color: kDavysGrey,
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(8))),
                                      child: Text(
                                        tvDetail.episodeRunTime.isEmpty
                                            ? ''
                                            : '${showDuration(tvDetail.episodeRunTime.first)}/episode',
                                      ),
                                    ),
                                    SizedBox(height: 10),
                                    Text(
                                      'Overview',
                                      style: kHeading6,
                                    ),
                                    Text(
                                      tvDetail.overview.length < 1
                                          ? '-'
                                          : tvDetail.overview,
                                      style: kBodyText,
                                    ),
                                    SizedBox(height: 16),
                                    Text(
                                      'Last Episodes${tvDetail.lastEpisodeToAir != null ? ' (Episode ${tvDetail.lastEpisodeToAir!.episodeNumber})' : ''}',
                                      style: kSubtitle,
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(height: 16),
                              Text(
                                'Seasons',
                                style: kHeading6,
                              ),
                              SizedBox(height: 5),
                              Container(
                                height: 150,
                                child: ListView.builder(
                                  scrollDirection: Axis.horizontal,
                                  itemBuilder: (context, index) {
                                    final item = tvDetail.seasons[index];
                                    return _tvSeason(
                                        context, index, tvDetail.id, item);
                                  },
                                  itemCount: tvDetail.seasons.length,
                                ),
                              ),
                              SizedBox(height: 16),
                              Text(
                                'Recommendations',
                                style: kHeading6,
                              ),
                              SizedBox(height: 5),
                              BlocBuilder<TvRecommendationsBloc,
                                  TvRecommendationsState>(
                                builder: (context, state) {
                                  if (state is TvRecommendationLoading) {
                                    return Center(
                                      key: Key('recommendation_center'),
                                      child: CircularProgressIndicator(
                                        key: Key('recommendation_loading'),
                                      ),
                                    );
                                  } else if (state is TvRecommendationError) {
                                    return Text(
                                      state.message,
                                      key: Key('recom_error_message'),
                                    );
                                  } else if (state is TvRecommendationHasData) {
                                    return Container(
                                      height: 150,
                                      child: state.recommendation.length > 0
                                          ? ListView.builder(
                                              scrollDirection: Axis.horizontal,
                                              itemBuilder: (context, index) {
                                                final tv =
                                                    state.recommendation[index];
                                                return Padding(
                                                  padding:
                                                      const EdgeInsets.all(4.0),
                                                  child: InkWell(
                                                    onTap: () {
                                                      Navigator
                                                          .pushReplacementNamed(
                                                        context,
                                                        TV_DETAIL_ROUTE,
                                                        arguments: tv.id,
                                                      );
                                                    },
                                                    child: ClipRRect(
                                                      borderRadius:
                                                          BorderRadius.all(
                                                        Radius.circular(8),
                                                      ),
                                                      child: CachedNetworkImage(
                                                        imageUrl:
                                                            'https://image.tmdb.org/t/p/w500${tv.posterPath}',
                                                        placeholder:
                                                            (context, url) =>
                                                                Center(
                                                          child:
                                                              CircularProgressIndicator(),
                                                        ),
                                                        errorWidget: (context,
                                                                url, error) =>
                                                            Icon(Icons.error),
                                                      ),
                                                    ),
                                                  ),
                                                );
                                              },
                                              itemCount:
                                                  state.recommendation.length,
                                            )
                                          : Text('No Recommendation'),
                                    );
                                  } else {
                                    return Container();
                                  }
                                },
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: CircleAvatar(
            backgroundColor: kRichBlack,
            foregroundColor: Colors.white,
            child: IconButton(
              key: Key('button_back'),
              icon: Icon(Icons.arrow_back),
              onPressed: () {
                Navigator.pop(context, true);
              },
            ),
          ),
        ),
      ],
    );
  }

  Widget _tvSeason(BuildContext ctx, int index, int id, TvSeasonDetail season) {
    return Padding(
      padding: const EdgeInsets.only(right: 10),
      child: InkWell(
        onTap: season.episodeCount < 1
            ? null
            : () {
                Navigator.pushNamed(
                  ctx,
                  TV_SEASONS_ROUTE,
                  arguments: {
                    'id': id,
                    'seasonNumber': season.seasonNumber,
                  },
                );
              },
        child: Stack(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.all(
                Radius.circular(8),
              ),
              child: CachedNetworkImage(
                imageUrl: season.posterPath != null
                    ? '$BASE_IMAGE_URL${season.posterPath}'
                    : '$NO_IMAGE_URL',
                width: 100,
                placeholder: (context, url) => Center(
                  child: CircularProgressIndicator(),
                ),
                errorWidget: (context, url, error) => Icon(Icons.error),
              ),
            ),
            Column(
              children: [
                Expanded(
                  child: Container(
                    width: 100,
                    decoration: BoxDecoration(
                        gradient: LinearGradient(
                            begin: Alignment.bottomCenter,
                            end: Alignment.topCenter,
                            colors: [Colors.black, Colors.transparent])),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.play_circle,
                          size: 40,
                          color: Colors.grey,
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          season.name ?? "Seasons $index",
                          style: kBodyText,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

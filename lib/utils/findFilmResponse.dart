library findFilmResponse;

import 'package:json_annotation/json_annotation.dart';

part 'findFilmResponse.g.dart';


@JsonSerializable()
class Response extends Object with _$ResponseSerializerMixin {
  final int page;
  final int totalResults;
  final int totalPages;
  final List<FindFilmResponse> results;

  Response({this.page, this.totalResults, this.totalPages, this.results});

  factory Response.fromJson(Map<String, dynamic> json) =>
      _$ResponseFromJson(json);
}

@JsonSerializable()
class FindFilmResponse extends Object with _$FindFilmResponseSerializerMixin {

  FindFilmResponse({
    this.posterPath,
    this.adult,
    this.overview,
    this.releaseDate,
    this.genres,
    this.id,
    this.originalLanguage,
    this.originalTitle,
    this.title,
    this.backdropPath,
    this.popularity,
    this.video,
    this.voteAverage,
    this.voteCount
    });

  final bool adult;
  @JsonKey(name: 'backdrop_path')
  final String backdropPath;
  final List <Genre> genres;
  final int id;
  @JsonKey(name: 'original_language')
  final String originalLanguage;
  @JsonKey(name: 'original_title')
  final String originalTitle;
  final String overview;
  final double popularity;
  @JsonKey(name: 'poster_path')
  final String posterPath;
  @JsonKey(name: 'release_date')
  final String releaseDate;
  final String title;
  final bool video;
  @JsonKey(name: 'vote_average')
  final double voteAverage;
  @JsonKey(name: 'vote_count')
  final double voteCount;


  factory FindFilmResponse.fromJson(Map<String, dynamic> json) =>
      _$FindFilmResponseFromJson(json);
}

@JsonSerializable()
class Genre extends Object with _$GenreSerializerMixin{
  final int id;
  final String name;

  Genre({this.id, this.name});

  factory Genre.fromJson(Map<String, dynamic> json) =>
      _$GenreFromJson(json);
}
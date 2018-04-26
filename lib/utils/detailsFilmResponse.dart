library detailFilmResponse;

import 'package:json_annotation/json_annotation.dart';

part 'detailsFilmResponse.g.dart';


@JsonSerializable()
class DetailResponse extends Object with _$DetailResponseSerializerMixin {
  final int page;
  final int totalResults;
  final int totalPages;
  final List<DetailFilmResponse> results;

  DetailResponse({this.page, this.totalResults, this.totalPages, this.results});

  factory DetailResponse.fromJson(Map<String, dynamic> json) =>
      _$DetailResponseFromJson(json);
}

@JsonSerializable()
class DetailFilmResponse extends Object with _$DetailFilmResponseSerializerMixin {

  DetailFilmResponse({
    this.adult,
    this.backdropPath,
    this.belongsToCollection,
    this.budget,
    this.genres,
    this.homepage,
    this.id,
    this.imdbId,
    this.originalLanguage,
    this.originalTitle,
    this.overview,
    this.popularity,
    this.posterPath,
    this.productionCompanies,
    this.productionCountries,
    this.releaseDate, this.revenue,
    this.runtime,
    this.spokenLanguages,
    this.status,
    this.tagline,
    this.title,
    this.video,
    this.voteAverage,
    this.voteCount});

  final bool adult;
  @JsonKey(name: 'backdrop_path')
  final String backdropPath;
  @JsonKey(name: 'belongs_to_collection')
  final BelongsToCollection belongsToCollection;
  final double budget;
  final List <Genre> genres;
  final String homepage;
  final int id;
  @JsonKey(name: 'imdb_id')
  final String imdbId;
  @JsonKey(name: 'original_language')
  final String originalLanguage;
  @JsonKey(name: 'original_title')
  final String originalTitle;
  final String overview;
  final double popularity;
  @JsonKey(name: 'poster_path')
  final String posterPath;
  @JsonKey(name: 'production_companies')
  final List <ProductionCompany> productionCompanies;
  @JsonKey(name: 'production_countries')
  final List <ProductionCountry> productionCountries;
  @JsonKey(name: 'release_date')
  final String releaseDate;
  final double revenue;
  final double runtime;
  @JsonKey(name: 'spoken_languages')
  final List <SpokenLanguage> spokenLanguages;
  final String status;
  final String tagline;
  final String title;
  final bool video;
  @JsonKey(name: 'vote_average')
  final double voteAverage;
  @JsonKey(name: 'vote_count')
  final double voteCount;


  factory DetailFilmResponse.fromJson(Map<String, dynamic> json) =>
      _$DetailFilmResponseFromJson(json);
}


@JsonSerializable()
class BelongsToCollection extends Object with _$BelongsToCollectionSerializerMixin {
  final int id;
  final String name;
  @JsonKey(name: 'poster_path')
  final String posterPath;
  @JsonKey(name: 'backdrop_path')
  final String backdropPath;

  BelongsToCollection({this.id, this.name, this.posterPath, this.backdropPath});

  factory BelongsToCollection.fromJson(Map<String, dynamic> json) =>
      _$BelongsToCollectionFromJson(json);
}

@JsonSerializable()
class Genre extends Object with _$GenreSerializerMixin{
  final int id;
  final String name;

  Genre({this.id, this.name});

  factory Genre.fromJson(Map<String, dynamic> json) =>
      _$GenreFromJson(json);
}

@JsonSerializable()
class ProductionCompany extends Object with _$ProductionCompanySerializerMixin{
  final String name;
  final int id;

  ProductionCompany({this.name, this.id});

  factory ProductionCompany.fromJson(Map<String, dynamic> json) =>
      _$ProductionCompanyFromJson(json);
}


@JsonSerializable()
class ProductionCountry extends Object with _$ProductionCountrySerializerMixin{
  final String iso_3166_1;
  final String name;

  ProductionCountry({this.iso_3166_1, this.name});

  factory ProductionCountry.fromJson(Map<String, dynamic> json) =>
      _$ProductionCountryFromJson(json);
}

@JsonSerializable()
class SpokenLanguage extends Object with _$SpokenLanguageSerializerMixin{

  SpokenLanguage({this.iso_639_1, this.name});

  final String iso_639_1;
  final String name;


  factory SpokenLanguage.fromJson(Map<String, dynamic> json) =>
      _$SpokenLanguageFromJson(json);
}
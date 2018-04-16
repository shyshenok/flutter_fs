

class FindFilmResponse {

  final bool adult;
  final String backdropPath;
  final BelongsToCollection belongsToCollection;
  final double budget;
  final List <Genre> genres;
  final String homepage;
  final double id;
  final String imdbId;
  final String originalLanguage;
  final String originalTitle;
  final String overview;
  final double popularity;
  final String posterPath;
  final List <ProductionCompany> productionCompanies;
  final List <ProductionCountry> productionCountries;
  final String releaseDate;
  final double revenue;
  final double runtime;
  final List <SpokenLanguage> spokenLanguages;
  final String status;
  final String tagline;
  final String title;
  final bool video;
  final double voteAverage;
  final double voteCount;

  FindFilmResponse (
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
      this.voteCount
);

}

class BelongsToCollection {
final int id;
final String name;
final String posterPath;
final String backdropPath;

  BelongsToCollection(this.id, this.name, this.posterPath, this.backdropPath);
}

class Genre {
final int id;
final String name;

  Genre(this.id, this.name);
}

class ProductionCompany {
final String name;
final int id;

  ProductionCompany(this.name, this.id);
}

class ProductionCountry {
final String  iso_3166_1;
final String name;

  ProductionCountry(this.iso_3166_1, this.name);
}

class SpokenLanguage {
 final String iso_639_1;
 final String name;

  SpokenLanguage(this.iso_639_1, this.name);
}
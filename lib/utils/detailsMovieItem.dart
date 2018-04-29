import 'package:firebase_database/firebase_database.dart';
import 'package:flutter_fs/utils/detailsFilmResponse.dart';


class DetailsMovieItem {

  String key;
  final String title;
  final String posterPath;
  final List <Genre> genres;
  final double runtime;
  final String overview;
  final double voteAverage;
  final double voteCount;
  final String releaseDate;


  DetailsMovieItem(this.title, this.posterPath, this.genres, this.runtime, this.overview, this.voteAverage, this.voteCount, this.releaseDate);


  DetailsMovieItem.fromSnapshot(DataSnapshot snapshot)
      : key = snapshot.key,
        title = snapshot.value["title"],
        posterPath = snapshot.value["posterPath"],
        genres = snapshot.value["genres"],
        runtime = snapshot.value["runtime"],
        overview = snapshot.value["overview"],
        voteAverage = snapshot.value["voteAverage"],
        voteCount = snapshot.value["voteCount"],
        releaseDate = snapshot.value["releaseDate"],
  {}

  toJson() {
    return {
      "title": title,
      "posterPath": posterPath,
      "genres": genres,
      "runtime": runtime,
      "overview": overview,
      "voteAverage": voteAverage,
      "voteCount": voteCount,
      "releaseDate": releaseDate,
    };
  }

}
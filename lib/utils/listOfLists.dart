import 'package:firebase_database/firebase_database.dart';
import 'package:flutter_fs/utils/detailsMovieItem.dart';


class ListOfLists {
  String key;
  String listName;
  String owner;
  List <DetailsMovieItem> movies = new List();
  ListOfLists(this.listName, this.owner, this.movies);


  ListOfLists.fromSnapshot(DataSnapshot snapshot)
      : key = snapshot.key,
        listName = snapshot.value["listName"],
        owner = snapshot.value["owner"],
        movies = snapshot.value["movies"]
  ;

  toJson() {
    return {
      "listName": listName,
      "owner": owner,
      "movies": movies
    };
  }

}
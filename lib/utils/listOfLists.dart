import 'package:firebase_database/firebase_database.dart';


class ListOfLists {
  String key;
  String listName;
  String owner;

  ListOfLists(this.listName, this.owner);


  ListOfLists.fromSnapshot(DataSnapshot snapshot)
      : key = snapshot.key,
        listName = snapshot.value["listName"],
        owner = snapshot.value["owner"]
  {}

  toJson() {
    return {
      "listName": listName,
      "owner": owner
    };
  }

}
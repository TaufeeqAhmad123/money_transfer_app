import 'package:flutter/widgets.dart';

class SearchProvider with ChangeNotifier {
  List<String> userList = [
    "John Doe",
    "Jane Smith",
    "Alice Johnson",
    "Bob Brown",
    "Emily Davis",
    "Michael Wilson",
    "Emma Martinez",
  ];
  List<String> filteredList = [];
  late Map<String, String> userimg;

  SearchProvider() {
    filteredList = List.from(userList);

    userimg = _generateUserImages();
  }

  void filterUsers(String query) {
    if (query.isEmpty) {
      filteredList = List.from(userList);
    } else {
      filteredList = userList
          .where((user) => user.toLowerCase().contains(query.toLowerCase()))
          .toList();
    }
    notifyListeners();
  }

  void defaultUsers() {
    filteredList = userList;
    notifyListeners();
  }

  Map<String, String> _generateUserImages() {
    return {
      "John Doe":
          "https://i.pinimg.com/564x/51/a0/e6/51a0e6fd63938cea4eb84333c5f32327.jpg",
      "Jane Smith":
          "https://i.pinimg.com/564x/e8/32/a2/e832a27d3a4cad7697dc5a4d32274d22.jpg",
      "Alice Johnson":
          "https://i.pinimg.com/564x/51/15/85/51158507adcec6e97657846871e0140d.jpg",
      "Bob Brown":
          "https://i.pinimg.com/564x/1a/97/28/1a97284242061fdbc782878904ebd6c1.jpg",
      "Emily Davis":
          "https://i.pinimg.com/564x/79/e6/2d/79e62d8da16ba5997568c9e5c872bd1c.jpg",
      "Michael Wilson":
          "https://i.pinimg.com/564x/e6/3a/12/e63a1274d16ece550d0886e481cad659.jpg",
      "Emma Martinez":
          "https://i.pinimg.com/564x/2c/dd/1b/2cdd1b72e1334717eed7374a42b39889.jpg",
    };
  }
}

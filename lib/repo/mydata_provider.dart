import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:image_panning/model/user_card.dart';

class MyDataProvider extends ChangeNotifier {
  UserCard? _myData;

  UserCard? get myData => _myData;

  Future<void> fetchMyData() async {
    // Fetch data from the REST API using the http package.
    // Parse the response and update _myData.
    // Notify listeners after updating the state.
    // Example implementation:
    // final response = await http.get('https://api.example.com/mydata');
    // final data = json.decode(response.body);
    // _myData = MyData.fromJson(data);
    // notifyListeners();
    final dio = Dio();
    final response =
        await dio.post('https://dev.elred.io/selectedCardDesignDetails',
            data: {"cardImageId": "6300ba8b5c4ce60057ef9b0c"},
            options: Options(headers: {
              "Content-Type": "application/json",
              "Authorization":
                  "Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyIjoiclhnY1Y2YXh3eVRobTNQdE04aGtSaXJTQ2ZsMiIsImlhdCI6MTY5NTIzMTc5MSwiZXhwIjoxNjk2NTI3NzkxfQ.9W-QURjNQWAtZIqzYB3-yvJWeCayXvojHcIRmjpVD4A"
            }));
    // response.data['result'];
    for (var profImage in response.data['result']) {
      _myData = UserCard.fromJson(profImage['customImageCardDesignInfo']);
      notifyListeners();
    }
    // notifyListeners();
  }
}

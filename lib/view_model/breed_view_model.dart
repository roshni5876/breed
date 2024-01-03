import 'package:flutter/cupertino.dart';
import 'package:the_dogapi/model/apis/api_response.dart';
import 'package:the_dogapi/model/models/breed.dart';
import 'package:the_dogapi/model/repositories/breed_repository.dart';

class BreedViewModel with ChangeNotifier {
  ApiResponse _apiResponse = ApiResponse.initial('Empty data');

  Breed? _media;

  ApiResponse get response {
    return _apiResponse;
  }

  Breed? get breed {
    return _media;
  }

  Future<void> fetchMediaData() async {
    _apiResponse = ApiResponse.loading('Fetching data');
    notifyListeners();

    try {
     
      List<Breed> mediaList = await BreedRepository().fetchMediaList();
      _apiResponse = ApiResponse.completed(mediaList);
    } catch (e) {
      _apiResponse = ApiResponse.error("$e");
    }
    notifyListeners();
  }
}

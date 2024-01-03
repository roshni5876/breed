import 'package:the_dogapi/model/models/breed.dart';
import 'package:the_dogapi/model/services/base_service.dart';
import 'package:the_dogapi/model/services/breed_service.dart';

class BreedRepository {
  BaseService breedService = BreedService();

  Future<List<Breed>> fetchMediaList() async {
    dynamic response = await breedService.getResponse("/breeds");
    final jsonData = response as List;
    List<Breed> mediaList =
        jsonData.map((tagJson) => Breed.fromJson(tagJson)).toList();
    return mediaList;
  }
}

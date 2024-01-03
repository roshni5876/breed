class Breed {
  Weight? weight;
  Weight? height;
  int? id;
  String? name;
  String? bredFor;
  String? breedGroup;
  String? lifeSpan;
  String? temperament;
  String? origin;
  String? referenceImageId;

  Breed(
      {this.weight,
      this.height,
      this.id,
      this.name,
      this.bredFor,
      this.breedGroup,
      this.lifeSpan,
      this.temperament,
      this.origin,
      this.referenceImageId});

  Breed.fromJson(Map<String, dynamic> json) {
    weight =
        json['weight'] != null ?  Weight.fromJson(json['weight']) : null;
    height =
        json['height'] != null ?  Weight.fromJson(json['height']) : null;
    id = json['id'];
    name = json['name'];
    bredFor = json['bred_for'];
    breedGroup = json['breed_group'];
    lifeSpan = json['life_span'];
    temperament = json['temperament'];
    origin = json['origin'];
    referenceImageId = json['reference_image_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  <String, dynamic>{};
    if (weight != null) {
      data['weight'] = weight!.toJson();
    }
    if (height != null) {
      data['height'] = height!.toJson();
    }
    data['id'] = id;
    data['name'] = name;
    data['bred_for'] = bredFor;
    data['breed_group'] = breedGroup;
    data['life_span'] = lifeSpan;
    data['temperament'] = temperament;
    data['origin'] = origin;
    data['reference_image_id'] = referenceImageId;
    return data;
  }
}

class Weight {
  String? imperial;
  String? metric;

  Weight({this.imperial, this.metric});

  Weight.fromJson(Map<String, dynamic> json) {
    imperial = json['imperial'];
    metric = json['metric'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['imperial'] = imperial;
    data['metric'] = metric;
    return data;
  }}
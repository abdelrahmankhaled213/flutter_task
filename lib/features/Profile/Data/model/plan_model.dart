import 'dart:convert';

class PlanModel {
  final int id;
  final String name;
  final int price;
  final int durationDays;
  final String tag;
  final List<FeatureModel> features;
  final int requests;
  final bool isSelected;

  PlanModel({
    required this.id,
    required this.name,
    required this.price,
    required this.durationDays,
    required this.tag,
    required this.features,
    required this.requests,
    required this.isSelected,
  });

  factory PlanModel.fromJson(Map<String, dynamic> json) {
    return PlanModel(
      id: json['id'],
      name: json['name'],
      price: json['price'],
      durationDays: json['duration_days'],
      tag: json['tag'] ?? '',
      features: (json['features'] as List)
          .map((e) => FeatureModel.fromJson(e))
          .toList(),
      requests: json['requests'],
      isSelected: json['is_selected'] == 1,
    );
  }

  Map<String, dynamic> toJson() => {
    'id': id,
    'name': name,
    'price': price,
    'duration_days': durationDays,
    'tag': tag,
    'features': features.map((e) => e.toJson()).toList(),
    'requests': requests,
    'is_selected': isSelected ? 1 : 0,
  };

  Map<String, dynamic> toMap() => {
    'id': id,
    'name': name,
    'price': price,
    'duration_days': durationDays,
    'tag': tag,
    'features': jsonEncode(features.map((e) => e.toJson()).toList()),
    'requests': requests,
    'is_selected': isSelected ? 1 : 0,
  };

  factory PlanModel.fromMap(Map<String, dynamic> map) {

    dynamic rawFeatures = map['features'];

    List<dynamic> featuresList;

    if (rawFeatures is String) {
      featuresList = jsonDecode(rawFeatures);
    } else if (rawFeatures is List) {
      featuresList = rawFeatures;
    } else {
      featuresList = [];
    }
    return PlanModel(
      id: map['id'],
      name: map['name'],
      price: map['price'],
      durationDays: map['duration_days'],
      tag: map['tag'],
      features: featuresList.map((e) => FeatureModel.fromJson(e)).toList(),
      requests: map['requests'],
      isSelected: map['is_selected'] == 1,
    );
  }
}

class FeatureModel {
  final String message;
  final String icon;

  FeatureModel({required this.message, required this.icon});

  factory FeatureModel.fromJson(Map<String, dynamic> json) {
    return FeatureModel(
      message: json['feature'] ?? '',
      icon: json['icon'] ?? '',
    );
  }

  Map<String, dynamic> toJson() => {
    'feature': message,
    'icon': icon,
  };
}

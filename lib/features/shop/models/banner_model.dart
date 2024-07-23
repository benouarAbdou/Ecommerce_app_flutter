import 'package:cloud_firestore/cloud_firestore.dart';

class BannerModel {
  String imageUrl;
  final String targetScreen;

  final bool active;

  BannerModel({
    required this.targetScreen,
    required this.active,
    required this.imageUrl,
  });

  static BannerModel empty() =>
      BannerModel(imageUrl: '', targetScreen: '', active: false);

  //model to json
  Map<String, dynamic> toJson() {
    return {
      'imageUrl': imageUrl,
      'targetScreen': targetScreen,
      'active': active,
    };
  }

  /// Map JSON oriented document snapshot from Firebase to UserModel
  factory BannerModel.fromSnapshot(DocumentSnapshot document) {
    final data = document.data() as Map<String, dynamic>;
    return BannerModel(
        targetScreen: data['targetScreen'] ?? '',
        active: data['active'] ?? false,
        imageUrl: data['imageUrl'] ?? '');
  }
}

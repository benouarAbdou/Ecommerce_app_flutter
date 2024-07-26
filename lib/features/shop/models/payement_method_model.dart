class PayementMethodModel {
  String name;
  String image;

  PayementMethodModel({required this.image, required this.name});

  static PayementMethodModel empty() =>
      PayementMethodModel(image: '', name: '');
}

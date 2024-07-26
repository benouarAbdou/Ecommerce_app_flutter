import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce/features/shop/models/brand_model.dart';

class ProductModel {
  String id;
  int stock;
  String? sku;
  double price;
  String title;
  DateTime? date;
  double salePrice;
  String thumbnail;
  bool? isFeatured;
  BrandModel? brand;
  String? description;
  String? categoryId;

  ProductModel({
    required this.id,
    required this.title,
    required this.stock,
    required this.price,
    required this.thumbnail,
    this.sku,
    this.brand,
    this.date,
    this.salePrice = 0.0,
    this.isFeatured,
    this.categoryId,
    this.description,
  });

  /// Create Empty func for clean code
  static ProductModel empty() => ProductModel(
        id: '',
        title: '',
        stock: 0,
        price: 0,
        thumbnail: '',
      );

  /// Json Format
  Map<String, dynamic> toJson() {
    return {
      'SKU': sku,
      'Title': title,
      'Stock': stock,
      'Price': price,
      'Thumbnail': thumbnail,
      'SalePrice': salePrice,
      'IsFeatured': isFeatured,
      'CategoryId': categoryId,
      'Brand': brand?.toJson(),
      'Description': description,
    };
  }

  /// Map Json oriented document snapshot from Firebase to Model
  factory ProductModel.fromSnapshot(
      DocumentSnapshot<Map<String, dynamic>> document) {
    if (document.data() == null) return ProductModel.empty();
    final data = document.data()!;
    return ProductModel(
      id: document.id,
      sku: data['SKU'] ?? '',
      title: data['Title'] ?? '',
      stock: data['Stock'] ?? 0,
      isFeatured: data['IsFeatured'] ?? false,
      price: double.parse((data['Price'] ?? 0).toString()),
      salePrice: double.parse((data['SalePrice'] ?? 0).toString()),
      thumbnail: data['Thumbnail'] ?? '',
      categoryId: data['CategoryId'] ?? '',
      description: data['Description'] ?? '',
      brand: data['Brand'] != null ? BrandModel.fromJson(data['Brand']) : null,
    );
  }

  // New function to upload dummy data
  static Future<void> uploadDummyData() async {
    final firestore = FirebaseFirestore.instance;

    final dummyProduct = ProductModel(
      id: '04',
      title: 'Beasball bat',
      stock: 11,
      price: 39.99,
      thumbnail:
          'https://firebasestorage.googleapis.com/v0/b/ecommerce-b06c5.appspot.com/o/Products%2Fbaseball_bat.png?alt=media&token=f35c3447-2f4b-4a7f-984f-05bea814f81d',
      sku: 'SKU123458',
      salePrice: 0,
      isFeatured: true,
      categoryId: '1',
      description: 'This is a dummy product for testing purposes.',
      brand: BrandModel(
        id: '2',
        name: 'Adidas',
        image: 'assets/icons/brands/adidas-logo.png',
        isFeatured: true,
        productsCount: 199,
      ),
      date: DateTime.now(),
    );

    try {
      await firestore
          .collection('Products')
          .doc('04')
          .set(dummyProduct.toJson());
      print('Dummy product uploaded successfully!');
    } catch (e) {
      print('Error uploading dummy product: $e');
    }
  }

  factory ProductModel.fromQuerySnapshot(
      QueryDocumentSnapshot<Object?> document) {
    final data = document.data() as Map<String, dynamic>;

    return ProductModel(
      id: document.id,
      sku: data['SKU'] ?? "",
      title: data['Title'] ?? "",
      stock: data['Stock'] ?? 0,
      isFeatured: data['IsFeatured'] ?? false,
      price: double.parse((data['Price'] ?? 0.0).toString()),
      salePrice: double.parse((data['SalePrice'] ?? 0.0).toString()),
      thumbnail: data['Thumbnail'] ?? "",
      categoryId: data['CategoryId'] ?? "",
      description: data['Description'] ?? "",
      brand: BrandModel.fromJson(data['Brand']),
    );
  }
}

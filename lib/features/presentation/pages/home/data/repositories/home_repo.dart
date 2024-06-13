import 'dart:convert';
import 'package:firebase_performance/firebase_performance.dart';
import 'package:flutter_poc/features/domain/entities/models/product.dart';
import 'package:http/http.dart' as http;

class HomeRepo {
  Future<List<Product>> getHomeProducts(String category) async {
    FirebasePerformance performance = FirebasePerformance.instance;
    String url = 'https://dummyjson.com/products/category/$category';
    HttpMetric metric = performance.newHttpMetric(url, HttpMethod.Get);
    await metric.start();
    final response = await http.get(Uri.parse(url));
    metric.httpResponseCode = response.statusCode;
    if (response.statusCode == 200) {
      await metric.stop();
      Map<String, dynamic> body = jsonDecode(response.body);
      List<dynamic> products = body['products'];
      List<Product> productList = products
          .map(
            (dynamic item) => Product.fromJson(item),
          )
          .toList();
      return productList;
    } else {
      await metric.stop();
      throw Exception('Failed to load products');
    }
  }
}

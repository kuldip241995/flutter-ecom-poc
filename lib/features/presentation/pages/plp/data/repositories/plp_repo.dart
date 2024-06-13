import 'dart:convert';
import 'package:flutter_poc/features/domain/entities/models/product.dart';
import 'package:http/http.dart' as http;
import 'package:firebase_performance/firebase_performance.dart';

class PLPRepo {
  static const FETCH_LIMIT = 20;
  final baseURL = 'https://dummyjson.com/products/search?q=';
  Future<List<Product>> getPLPProducts(
      int pageNumber, String searchKeyword) async {
    FirebasePerformance performance = FirebasePerformance.instance;
    var url =
        '$baseURL$searchKeyword&limit=$FETCH_LIMIT&skip=${pageNumber * 20 - 20}';
    print('url ${url}');
    HttpMetric metric = performance.newHttpMetric(baseURL, HttpMethod.Get);
    await metric.start();
    final response = await http.get(Uri.parse(url));
    metric.httpResponseCode = response.statusCode;
    if (response.statusCode == 200) {
      await metric.stop();
      Map<String, dynamic> body = jsonDecode(response.body);
      List<dynamic> products = body['products'];
      List<Product> productList =
          products.map((dynamic item) => Product.fromJson(item)).toList();
      return productList;
    } else {
      await metric.stop();
      throw Exception('Failed to load products');
    }
  }
}

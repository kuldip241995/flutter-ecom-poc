// import 'dart:convert';
// import 'package:flutter_poc/features/domain/entities/models/product.dart';
// import 'package:flutter_poc/features/presentation/pages/plp/data/repositories/plp_repo.dart';
// import 'package:http/http.dart' as http;
// import 'package:firebase_performance/firebase_performance.dart';
// import 'package:flutter_test/flutter_test.dart';
// import 'package:mockito/mockito.dart';

// class MockHttpMetric extends Mock implements HttpMetric {}

// class MockPerformance extends Mock implements FirebasePerformance {}

// void main() {
//   group('PLPRepo Tests', () {
//     late PLPRepo plpRepo;
//     late MockPerformance mockPerformance;
//     setUp(() {
//       plpRepo = PLPRepo();
//       mockPerformance = MockPerformance();
//     });
//     test('getPLPProducts returns a list of products on success', () async {
//       final mockHttpMetric = MockHttpMetric();
//       when(mockPerformance.newHttpMetric(any, any)).thenReturn(mockHttpMetric);
//       when(mockHttpMetric.start()).thenAnswer((_) async {});
//       when(mockHttpMetric.stop()).thenAnswer((_) async {});
//       final mockResponse = http.Response(
//         '{"products": [{"id": 1, "title": "Product 1"}, {"id": 2, "title": "Product 2"}]}',
//         200,
//       );
//     });
//   });
// }

// class MockClient extends Mock implements http.Client {}

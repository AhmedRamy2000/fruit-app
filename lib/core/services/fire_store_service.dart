import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fruitapp/core/services/date_base_service.dart';

class FireStoreService implements DatabaseService {
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  @override
  Future<void> addData(
          {required String path, required Map<String, dynamic> data}) async =>
      await firestore.collection(path).add(data);
}

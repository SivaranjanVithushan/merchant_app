import 'package:cloud_firestore/cloud_firestore.dart';

class OrderService {
  final CollectionReference ordersRef =
      FirebaseFirestore.instance.collection('orders');

  Stream<QuerySnapshot> getOrdersByStatus(String status) {
    return ordersRef.where('status', isEqualTo: status).snapshots();
  }
}

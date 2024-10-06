import 'dart:typed_data';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:excel/excel.dart';
import 'package:firebase_storage/firebase_storage.dart';

Future<void> downloadOrdersAsExcel() async {
  var excel = Excel.createExcel();
  Sheet sheetObject = excel['Orders'];

  // Add headers as CellValue types
  sheetObject.appendRow([
    TextCellValue("Order ID"),
    TextCellValue("Status"),
    TextCellValue("Delivery Charge"),
  ]);

  // Fetch orders data
  QuerySnapshot querySnapshot =
      await FirebaseFirestore.instance.collection('orders').get();
  for (var doc in querySnapshot.docs) {
    var order = doc.data() as Map<String, dynamic>;
    sheetObject.appendRow([
      TextCellValue(doc.id),
      TextCellValue(order['status']),
      TextCellValue(order['deliveryCharge']?.toDouble() ?? 0)
    ]);
  }

  // Encode Excel file
  var excelBytes = excel.encode();
  if (excelBytes != null) {
    Uint8List data = Uint8List.fromList(excelBytes);
    String filePath =
        '/orders/orders_${DateTime.now().millisecondsSinceEpoch}.xlsx';

    // Upload to Firebase Storage
    await FirebaseStorage.instance.ref(filePath).putData(data);
    print('Excel file saved to Firebase Storage at $filePath');
  } else {
    print('Failed to encode Excel data.');
  }
}

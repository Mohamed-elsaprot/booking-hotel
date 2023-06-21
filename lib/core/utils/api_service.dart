import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dio/dio.dart';

class ApiService {
  final Dio _dio;
  ApiService(this._dio);
  final String url='https://pickytour-de19a-default-rtdb.firebaseio.com/';


   Future get({String endPointUrl=''}) async {
    var res = await _dio.get('$url$endPointUrl');
    return res.data;
  }

  Future postBookingData(Map bookingData)async{
       //_dio.post('https://pickytour-de19a-default-rtdb.firebaseio.com/orders.json', data: bookingData);
    CollectionReference orders = FirebaseFirestore.instance.collection('mo');
    await orders.add(bookingData);
  }

  Future getOrders() async {
    var res = await _dio.get('https://pickytour-de19a-default-rtdb.firebaseio.com/orders.json');
    return res.data;
   }
}

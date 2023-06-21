import 'package:dio/dio.dart';

class Paymob{

  static const String baseUrl='https://accept.paymob.com/api';
  static const String authTokenUrl ='/auth/tokens';
  static const String orderIdUrl ='/ecommerce/orders';
  static const String paymentKeyReqUrl ='/acceptance/payment_keys';
  static const String refCodeUrl ='/acceptance/payments/pay';
  static const String apiKey ="ZXlKaGJHY2lPaUpJVXpVeE1pSXNJblI1Y0NJNklrcFhWQ0o5LmV5SmpiR0Z6Y3lJNklrMWxjbU5vWVc1MElpd2ljSEp2Wm1sc1pWOXdheUk2Tnpnek16UXdMQ0p1WVcxbElqb2lhVzVwZEdsaGJDSjkuWXdVMEhEbW9FMEo5MlB6WGNQRVJxdk5RTFJqakpyb1BsS0dqR1V1UGFZQW5BR2JORVBocUZPR3hHV0txNEU2V3RkV0RWdjdvaWFnbGgzOG14eUFZOEE=";
  static String authToken ='';
  static String orderIdToken ='';
  static String finalToken ='';
  static String refCode ='';
  static String visaUrl= '$baseUrl/acceptance/iframes/758988?payment_token=';


  static String integrationIdCard='3798791';

  static final Dio _dio= Dio(
    BaseOptions(
      baseUrl: baseUrl,
      headers: {'Content-Type':'application/json'},
      receiveDataWhenStatusError: true
    )
  );

  static Future<Response> PaymobPostDataDio({required String endPoint, required Map<String,dynamic> data})async{
    return await _dio.post(endPoint,data: data);
  }

}



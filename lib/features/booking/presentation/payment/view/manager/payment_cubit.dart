import 'package:bloc/bloc.dart';
import 'package:pickytour/core/utils/paymob_getway.dart';
import 'package:pickytour/features/booking/presentation/payment/view/manager/payment_states.dart';
import 'package:url_launcher/url_launcher.dart';


class PaymentCubit extends Cubit<PaymentStates>{
  PaymentCubit():super(PaymentAuthTokenInitial());

  String firstName='',lastName='',phone='',nationalId='', detailedAddress='',country='Egypt',city='';

  Future getAuthToken()async{
    emit(PaymentAuthTokenLoading());
      await Paymob.PaymobPostDataDio(endPoint: Paymob.authTokenUrl,
          data: {
            "api_key": Paymob.apiKey
          }).then((value) {
        Paymob.authToken=value.data['token'];
        print('Auth token: ${Paymob.authToken}');
        emit(PaymentAuthTokenSuccess());
      }).catchError((e){
        print('autttth token fail');
        print(e.toString());
        emit(PaymentAuthTokenFailure(e.toString()));
      });

  }

  Future getOrderId({
    required String firstName,
    required String lastName,
    required String phone,
    required String price,
    required String email,
    required String country,
    required String city,
    required String detailedAddress,
    required Map<String,dynamic> order
  })async{
    emit(PaymentOrderIdLoading());
    await Paymob.PaymobPostDataDio(endPoint: Paymob.orderIdUrl,
        data:{
          "auth_token": Paymob.authToken,
          "delivery_needed": "false",
          "amount_cents": price,
          "currency": "EGP",
          "items": [
            //order
            {
              "name": "Hotel Booking",
              "amount_cents": "2222222",
              "description": order.toString(),
              "quantity": "1"
            }
          ],
          "shipping_data": {
            "building": "000",
            "postal_code": "000",
            "floor": "000",
            "apartment": "000",
            "extra_description": "NationalId: $nationalId",
            "street": detailedAddress,
            "email": email,
            "first_name": firstName,
            "last_name": lastName,
            "phone_number": phone,
             "city": city,
             "country": country
          },
          // "shipping_details": {
          //   "notes" : " test",
          //   "number_of_packages": 1,
          //   "weight" : 1,
          //   "weight_unit" : "Kilogram",
          //   "length" : 1,
          //   "width" :1,
          //   "height" :1,
          //   "contents" : "product of some sorts"
          // }
        }
        ).then((value) {
      Paymob.orderIdToken=value.data['id'].toString();
      print('order id: ${Paymob.orderIdToken}');
      getPaymentRequest(firstName: firstName, lastName: lastName, phone: phone, price: price, email: email, detailedAddress: detailedAddress, country: country, city: detailedAddress);
      emit(PaymentOrderIdSuccess());
    }).catchError((e){
      print('orderrrrr id fail');
      print(e.toString());
      emit(PaymentOrderIdFailure(e.toString()));
    });

  }

  Future getPaymentRequest({
        required String firstName,
        required String lastName,
        required String phone,
        required String price,
        required String email,
        required String country,
        required String city,
        required String detailedAddress,

  })async{
    emit(PaymentRequestLoading());
    await Paymob.PaymobPostDataDio(endPoint: Paymob.paymentKeyReqUrl,
        data: {
          "auth_token": Paymob.authToken,
          "amount_cents": price,
          "expiration": 3600,
          "order_id": Paymob.orderIdToken,
          "billing_data": {
            "apartment": "000",
            "floor": "000",
            "building": "000",
            "postal_code": "000",
            "state": "null",
            "shipping_method": "null",

            "email": email,
            "first_name": firstName,
            "last_name": lastName,
            "street": detailedAddress,
            "phone_number": phone,
            "city": city,
            "country": country,
          },
          "currency": "EGP",
          "integration_id": Paymob.integrationIdCard,
          "lock_order_when_paid": "false"
        }).then((value) async{
          Paymob.finalToken= value.data["token"];
          print('final Token: ${Paymob.finalToken.length}');
          print('${Paymob.visaUrl.length}');
          Paymob.visaUrl='${Paymob.baseUrl}/acceptance/iframes/758988?payment_token=';
          Paymob.visaUrl+=Paymob.finalToken;
          // print('visa: ${Paymob.visaUrl.length}');
          // print('${Paymob.visaUrl[1151]} : ${Paymob.finalToken[1081]}');
          launchUrl((Uri.parse(Paymob.visaUrl)));

          emit(PaymentRequestSuccess());
    }).catchError((e){
      print('final tokennn fail');
      print(e.toString());
      emit(PaymentRequestFailure(e.toString()));
    });
  }
  // Future getRefCode()async{
  //   emit(PaymentRequestLoading());
  //   await Paymob.postDataDio(endPoint: Paymob.refCodeUrl,
  //       data: {
  //         "source": {
  //           "identifier": "AGGREGATOR",
  //           "subtype": "AGGREGATOR"
  //         },
  //         "payment_token": Paymob.finalToken
  //       }
  //   ).then((value) {
  //     Paymob.refCode=value.data['id'].toString();
  //     emit(PaymentRefCodeSuccess());
  //   }).catchError((e){
  //     print('red codeee fail');
  //     emit(PaymentRefCodeFailure(e.toString()));
  //   });
  // }
}











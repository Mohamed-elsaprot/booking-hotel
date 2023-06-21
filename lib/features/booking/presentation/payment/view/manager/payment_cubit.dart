import 'package:bloc/bloc.dart';
import 'package:pickytour/core/utils/paymob_getway.dart';
import 'package:pickytour/features/booking/presentation/payment/view/manager/payment_states.dart';
import 'package:url_launcher/url_launcher.dart';


class PaymentCubit extends Cubit<PaymentStates>{
  PaymentCubit():super(PaymentAuthTokenInitial());

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
  })async{
    emit(PaymentOrderIdLoading());
    await Paymob.PaymobPostDataDio(endPoint: Paymob.orderIdUrl,
        data:{
          "auth_token": Paymob.authToken,
          "delivery_needed": "false",
          "amount_cents": price,
          "currency": "EGP",
          "items": [
            {
              "name": "iphone14",
              "amount_cents": "50000",
              "description": "mobile",
              "quantity": "1"
            },
            {
              "name": "ERT6565",
              "amount_cents": "200000",
              "description": "Power Bank",
              "quantity": "1"
            }
          ],
          "shipping_data": {
            "apartment": "803",
            "email": email,
            "floor": "11",
            "first_name": firstName,
            "last_name": lastName,
            "street": "عزبة جاد",
            "building": "10",
            "phone_number": phone,
            "postal_code": "01898",
            "extra_description": "لندن الدور التاني",
            "city": "bilqas",
            "country": 'ام الدنيا'
          },
          "shipping_details": {
            "notes" : " test",
            "number_of_packages": 1,
            "weight" : 1,
            "weight_unit" : "Kilogram",
            "length" : 1,
            "width" :1,
            "height" :1,
            "contents" : "product of some sorts"
          }
        }
        ).then((value) {
      Paymob.orderIdToken=value.data['id'].toString();
      print('order id: ${Paymob.orderIdToken}');
      getPaymentRequest(firstName: firstName, lastName: lastName, phone: phone, price: price);
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
      })async{
    emit(PaymentRequestLoading());
    await Paymob.PaymobPostDataDio(endPoint: Paymob.paymentKeyReqUrl,
        data: {
          "auth_token": Paymob.authToken,
          "amount_cents": "1000",
          "expiration": 3600,
          "order_id": Paymob.orderIdToken,
          "billing_data": {
            "apartment": "803",
            "email": "claudette09@exa.com",
            "floor": "42",
            "first_name": "Clifford",
            "street": "Ethan Land",
            "building": "8028",
            "phone_number": "+86(8)9135210487",
            "shipping_method": "PKG",
            "postal_code": "01898",
            "city": "Jaskolskiburgh",
            "country": "CR",
            "last_name": "Nicolas",
            "state": "Utah",
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











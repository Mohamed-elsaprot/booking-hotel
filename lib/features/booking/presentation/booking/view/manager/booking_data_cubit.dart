import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:pickytour/core/errors/failure.dart';
import 'package:pickytour/core/utils/api_service.dart';
import '../../../../../../core/city_model/Hotels.dart';
import 'booking_data_states.dart';


class BookingDataCubit extends Cubit<BookingDataStates>{
  BookingDataCubit(this.apiService): super(BookingDataChange());
  final ApiService apiService;

  double regularRome=0, suiteRome=0, days=0;
  bool allServices= false;
  double coast = 0;
  bool firstTime= true;
  DateTime dateTime=DateTime.now();

  double calcCoast(Hotel hotel){
    if(regularRome !=0 && suiteRome!=0){
      coast= (regularRome*.7+ suiteRome)*days*hotel.price!;
    }
    else if(regularRome !=0 && suiteRome==0){
      coast= regularRome*.7*days*hotel.price!;
    }else{
      coast= suiteRome*days*hotel.price!;
    }

    if(allServices && !(regularRome ==0 && suiteRome==0)){
      coast+=500*days*(regularRome+suiteRome);
    }else{
      if(firstTime){}else{
        coast-=500*days*(regularRome+suiteRome);
        firstTime=false;
      }
    }
    return coast;
  }
  setBookingDate(DateTime dTime){
     dateTime = dTime;
  }
  void changeServices(bool x){
    allServices=x;
    emit(BookingDataChange());
  }
  void changeSuite(String op){
    if(op=='+') {
      suiteRome++;
    } else {
      if(suiteRome>0)suiteRome--;
    }
    emit(BookingDataChange());

  }
  void changeRegularRome(String op){
    if(op=='+') {
      regularRome++;
    } else {
      if(regularRome>0)regularRome--;
    }
    emit(BookingDataChange());
  }
  void changeBookingDays(String op){
    if(op=='+') {
      days++;
    } else {
      if(days>0)days--;
    }
    emit(BookingDataChange());

  }
  //------------------------------------
  //submit

  Future postBookingData(Map bookingDataMap)async{
    try{
      emit(SubmitLoading());
      await apiService.postBookingData(bookingDataMap);
      emit(SubmitSuccess());
    }catch(e){
      if(e is DioError){
        ServerFailure eM = ServerFailure.fromDioError(e);
        emit(SubmitFailed(errorMessage: eM.errorMessage));
      }else {
        emit(SubmitFailed(errorMessage: e.toString()));
      }
    }
  }
}
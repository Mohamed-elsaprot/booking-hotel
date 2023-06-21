abstract class BookingDataStates{
  const BookingDataStates();
}

class BookingDataChange extends BookingDataStates{}

class SubmitLoading extends BookingDataStates{}
class SubmitSuccess extends BookingDataStates{}
class SubmitFailed extends BookingDataStates{
   const SubmitFailed({required this.errorMessage});
   final String errorMessage;
}
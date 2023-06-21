abstract class PaymentStates{
  const  PaymentStates();
}
class PaymentAuthTokenInitial extends PaymentStates{}
class PaymentAuthTokenSuccess extends PaymentStates{}
class PaymentAuthTokenLoading extends PaymentStates{}
class PaymentAuthTokenFailure extends PaymentStates{
  const PaymentAuthTokenFailure(this.errorMessage);
  final String errorMessage;
}


class PaymentOrderIdSuccess extends PaymentStates{}
class PaymentOrderIdLoading extends PaymentStates{}
class PaymentOrderIdFailure extends PaymentStates{
  const PaymentOrderIdFailure(this.errorMessage);
  final String errorMessage;
}

class PaymentRequestSuccess extends PaymentStates{}
class PaymentRequestLoading extends PaymentStates{}
class PaymentRequestFailure extends PaymentStates{
  const PaymentRequestFailure(this.errorMessage);
  final String errorMessage;
}

class PaymentRefCodeSuccess extends PaymentStates{}
class PaymentRefCodeLoading extends PaymentStates{}
class PaymentRefCodeFailure extends PaymentStates{
  const PaymentRefCodeFailure(this.errorMessage);
  final String errorMessage;
}
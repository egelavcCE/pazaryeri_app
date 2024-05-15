class CreditCardModel {
  final String logoUrl;
  final String cardName;
  final String cardOwnerName;
  final String cardOwnerLastName;
  final String cardNumber;

  CreditCardModel(
      {required this.cardName,
      required this.logoUrl,
      required this.cardOwnerName,
      required this.cardOwnerLastName,
      required this.cardNumber});
}

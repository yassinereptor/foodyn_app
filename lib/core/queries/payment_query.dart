class PaymentQuery {
  static const String getPaymentsQuery = r"""
    query getPayments{
      payments {
        id,
        type,
        title,
        description,
        asset,
        primaryColor,
        accentColor,
        textColor,
        soon,
        active,
      }
    }
    """;

}
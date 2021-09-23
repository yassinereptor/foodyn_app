class CouponQuery {
  static const String checkCouponStatusMutation = r"""
    mutation checkCouponStatus ($code: String!) {
      checkCouponStatus(code: $code) {
        id,
        code,
        quantity,
        used,
        reduction,
        endAt,
        active
      }
    }
    """;

}
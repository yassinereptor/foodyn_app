class CouponQuery {
  static const String checkCouponStatusMutation = r"""
    mutation checkCouponStatus ($code: String!) {
      checkCouponStatus(code: $code) {
        id,
        memberships,
        code,
        quantity,
        used,
        reduction,
        endAt
      }
    }
    """;

}
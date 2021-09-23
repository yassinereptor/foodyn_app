class PlanQuery {
  static const String getPlansQuery = r"""
    query getPlans{
      plans {
        id,
        title,
        description,
        monthPrice,
        yearPrice,
        primaryColor,
        accentColor,
        textColor,
        recommended,
        special,
        endAt
      }
    }
    """;

}
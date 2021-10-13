class ConfigQuery {
  static const String getLastRemoteConfig = r"""
    query getLastRemoteConfig($type : Int!) {
      lastRemoteConfig(type: $type) {
        createdAt
      }
    }
    """;

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
        soon
      }
    }
    """;

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

    static const String getEateryTypesQuery = r"""
    query getEateryTypes{
      eateryTypes {
        id,
        title,
      }
    }
    """;


}
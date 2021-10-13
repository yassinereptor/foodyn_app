class ManagementQuery {
    static const String saveEateryMutation = r"""
      mutation saveEateryMutation($eatery : InsertOrUpdateEateryInput!){
        insertOrUpdateEatery(eatery: $eatery) {
          id,
        }
      }
    """;

    static const String getCurrentEateriesQuery = r"""
      query getCurrentEateries {
        currentEateries {
          id,
          sections {
            id,
            tables {
              id,
              number,
              row,
              column
            },
            title,
            rows,
            columns
          },
          images {
            id,
            type,
            filename,
            filepath,
            hash
          },
          eateryTypes {
            id,
            title
          },
          title,
          description,
          adresse,
          dialCode,
          phoneNumber,
          phoneNumberVerified,
          country,
          city,
          posLat,
          posLng
        }
      }
    """;

    static const String getEateryQuery = r"""
      query getEatery($id : Int!) {
        eatery(id: $id) {
          id,
          sections {
            id,
            tables {
              id,
              number,
              row,
              column
            },
            title,
            rows,
            columns
          },
          images {
            id,
            type,
            filename,
            filepath,
            hash
          },
          eateryTypes {
            id,
            title
          },
          title,
          description,
          adresse,
          dialCode,
          phoneNumber,
          phoneNumberVerified,
          country,
          city,
          posLat,
          posLng
        }
      }
    """;

}
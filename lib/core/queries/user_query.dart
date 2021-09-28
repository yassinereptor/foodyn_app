class UserQuery {
  static const String getUserQuery = r"""
    query getUser($id : Int!){
      user(id: $id) {
        id,
        profile {
          id,
          image {
            id,
            type,
            filename,
            filepath
          },
          fullname,
          adresse,
          dialCode,
          phoneNumber,
          phoneNumberVerified,
          country,
          city,
          zipCode,
          gender,
          posLat,
          posLng
        },
        memberships {
          id,
          plan {
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
          },
          startAt,
          endAt
        },
        type,
        email,
        verified
      }
    }
    """;
  static const String getCurrentUserQuery = r"""
    query getCurrentUser{
      currentUser {
        id,
        profile {
          id,
          image {
            id,
            type,
            filename,
            filepath
          },
          fullname,
          adresse,
          dialCode,
          phoneNumber,
          phoneNumberVerified,
          country,
          city,
          zipCode,
          gender,
          posLat,
          posLng
        },
        memberships {
          id,
          plan {
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
          },
          startAt,
          endAt
        },
        type,
        email,
        verified
      }
    }
    """;
  static const String getUsersQuery = r"""
    query getUsers($id : [Int!]!){
      users(id: $id) {
        id,
        profile {
          id,
          image {
            id,
            type,
            filename,
            filepath
          },
          fullname,
          adresse,
          dialCode,
          phoneNumber,
          phoneNumberVerified,
          country,
          city,
          zipCode,
          gender,
          posLat,
          posLng
        },
        memberships {
          id,
          plan {
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
          },
          startAt,
          endAt
        },
        type,
        email,
        verified
      }
    }
    """;
  static const String resendConfirmationEmailMutation = r"""
    mutation resendConfirmationEmailMutation($email : String!){
      resendConfirmationEmail(email: $email)
    }
    """;
}

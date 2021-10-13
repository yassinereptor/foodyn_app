class UserQuery {
  static const String getUserQuery = r"""
    query getUser($id : Int!){
      user(id: $id) {
        id,
        image {
          id,
          type,
          filename,
          filepath,
          hash
        },
        fullname,
        username,
        adresse,
        dialCode,
        phoneNumber,
        phoneNumberVerified,
        country,
        city,
        gender,
        posLat,
        posLng
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
        image {
          id,
          type,
          filename,
          filepath,
          hash
        },
        fullname,
        username,
        adresse,
        dialCode,
        phoneNumber,
        phoneNumberVerified,
        country,
        city,
        gender,
        posLat,
        posLng
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
        image {
          id,
          type,
          filename,
          filepath,
          hash
        },
        fullname,
        username,
        adresse,
        dialCode,
        phoneNumber,
        phoneNumberVerified,
        country,
        city,
        gender,
        posLat,
        posLng
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

    static const String updateUserMutation = r"""
      mutation updateUserMutation($user : UpdateUserInput!){
        updateUser(user: $user) {
          id,
          image {
            id,
            type,
            filename,
            filepath,
            hash
          },
          fullname,
          username,
          adresse,
          dialCode,
          phoneNumber,
          phoneNumberVerified,
          country,
          city,
          gender,
          posLat,
          posLng
        }
      }
    """;

    static const String saveMembershipMutation = r"""
      mutation saveMembershipMutation($membership : InsertOrUpdateMembershipInput!){
        insertOrUpdateMembership(membership: $membership) {
          id,
          startAt,
          endAt
        }
      }
    """;
}

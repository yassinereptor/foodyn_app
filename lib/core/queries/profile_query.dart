class ProfileQuery {
  static const String getProfileQuery = r"""
    query getProfile($id : Int!){
      profile(id: $id) {
        id,
        image {
          id,
          type,
          filename,
          filepath,
          hash
        },
        fullname,
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
  static const String getCurrentProfileQuery = r"""
    query getCurrentProfile{
      currentProfile {
        id,
        image {
          id,
          type,
          filename,
          filepath,
hash
        },
        fullname,
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
  static const String getProfilesQuery = r"""
    query getProfiles($id : [Int!]!){
      profiles(id: $id) {
        id,
        image {
          id,
          type,
          filename,
          filepath,
hash
        },
        fullname,
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

    static const String updateUserMutation = r"""
      mutation updateUserMutation($profile : UpdateUserInput!){
        insertOrUpdateProfile(profile: $profile) {
          id,
          image {
            id,
            type,
            filename,
            filepath,
hash
          },
          fullname,
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
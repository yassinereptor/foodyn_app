class ImageQuery {
  static const String getImageQuery = r"""
    query getImage($id : Int!){
      user(id: $id) {
        id,
        type,
        filename,
        filepath,
        createdAt,
        updatedAt,
        deletedAt
      }
    }
    """;
  static const String getCurrentImageQuery = r"""
    query getCurrentImage{
      currentImage {
        id,
        type,
        filename,
        filepath,
        createdAt,
        updatedAt,
        deletedAt
      }
    }
    """;

}
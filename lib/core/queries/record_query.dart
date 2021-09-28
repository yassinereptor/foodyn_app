class RecordQuery {
  static const String getRecordQuery = r"""
    query getRecord($id : Int!){
      record(id: $id) {
        id,
        status,
        country,
        countryCode,
        region,
        regionName,
        city,
        zip,
        lat,
        lon,
        timezone,
        isp,
        org,
        operator,
        query
      }
    }
    """;
  static const String getCurrentRecordQuery = r"""
    query getCurrentRecord{
      currentRecord {
        id,
        status,
        country,
        countryCode,
        region,
        regionName,
        city,
        zip,
        lat,
        lon,
        timezone,
        isp,
        org,
        operator,
        query
      }
    }
    """;
  static const String getRecordsQuery = r"""
    query getRecords($id : [Int!]!){
      records(id: $id) {
        id,
        status,
        country,
        countryCode,
        region,
        regionName,
        city,
        zip,
        lat,
        lon,
        timezone,
        isp,
        org,
        operator,
        query
      }
    }
    """;

    static const String saveRecordMutation = r"""
    mutation saveRecordMutation($record : InsertOrUpdateRecordInput!){
      insertOrUpdateRecord(record: $record) {
        id,
        status,
        country,
        countryCode,
        region,
        regionName,
        city,
        zip,
        lat,
        lon,
        timezone,
        isp,
        org,
        operator,
        query
      }
    }
    """;
}
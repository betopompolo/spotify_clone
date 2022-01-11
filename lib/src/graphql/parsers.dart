DateTime fromGraphQLDateToDartDateTime(String date) => DateTime.parse(date);
String fromDartDateTimeToGraphQLDate(DateTime date) =>
    '${date.year}-${date.month}-${date.day}';

String fromGraphQLUrlToDartString(String url) => url;
String fromDartStringToGraphQLUrl(String url) => url;

String? fromGraphQLUrlNullableToDartStringNullable(String? url) => url;

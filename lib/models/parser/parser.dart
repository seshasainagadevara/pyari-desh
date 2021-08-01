import '../country_data.dart';

//this class parses the response of the REST API request
//JSON serializable parser for required json keys
class ParserState {
  List<CountryData> parseData(Map<String, dynamic> response) {
    final result = response['data']
        .entries
        .toList()
        .map<CountryData>((MapEntry<String, dynamic> e) =>
            CountryData.fromJSON(e.key, e.value))
        .toList();

    return result;
  }
}

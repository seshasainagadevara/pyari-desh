class CountryData {
  //Data class/model or JSON serializable class for entire countries data fetched from api
  CountryData({required this.id, required this.country, this.toggled = false});

  String id;
  Country country;
  bool toggled;

  factory CountryData.fromJSON(String id, Map<String, dynamic> json) {
    return CountryData(
      id: id,
      country: Country.fromJSON(json),
    );
  }

  CountryData copyWith({String? id, Country? country, required bool toggled}) {
    return CountryData(
        country: country ?? this.country, id: id ?? this.id, toggled: toggled);
  }
}

class Country {
  String country;
  String region;

  Country({
    required this.country,
    required this.region,
  });
  factory Country.fromJSON(Map<String, dynamic> json) {
    return Country(
      country: json['country'],
      region: json['region'],
    );
  }
}

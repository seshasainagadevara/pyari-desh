import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pyari_desh/models/country_data.dart';

//this is the statenotifer class which notifies consumers about state changes
//the state is immutable

class FavouriteState extends StateNotifier<List<CountryData>> {
  FavouriteState() : super(const []);
//list of facorite countries
  List<CountryData> get favorites => state;
  int get favCount => state.length;
//changing state upon marking/selecting a favorite country
  void mark(CountryData countryData) {
    state = [...state, countryData.copyWith(toggled: !countryData.toggled)];
  }

//changing state upon umarking a favorite country
  void unmark(String id) {
    state = state.where((element) => element.id != id).toList();
  }
}

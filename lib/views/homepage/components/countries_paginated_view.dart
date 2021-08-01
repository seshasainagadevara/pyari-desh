import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pyari_desh/models/country_data.dart';
import 'package:pyari_desh/view-model-manager/country_data_state_provider.dart';
import 'package:pyari_desh/views/homepage/components/grid_view.dart';

class CountriesPaginatedView extends ConsumerWidget {
  const CountriesPaginatedView({Key? key}) : super(key: key);

  @override
  Widget build(
      BuildContext context, T Function<T>(ProviderBase<Object?, T>) watch) {
    //countryStateprovider returns AsyncValue which contains data, error, loading properties
    AsyncValue<List<CountryData>> countries = watch(countryStateProvider);

    return Expanded(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 15.0),
        child: countries.when(
            loading: () => Center(
                  child: CircularProgressIndicator(
                    color: Colors.green,
                    valueColor: AlwaysStoppedAnimation(Colors.white),
                  ),
                ),
            data: (List<CountryData> data) => CountriesGridView(
                  data: data,
                ),
            error: (Object error, StackTrace? stackTrace) {
              return Text('network error');
            }),
      ),
    );
  }
}

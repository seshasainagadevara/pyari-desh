import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pyari_desh/models/country_data.dart';
import 'package:pyari_desh/models/parser/parser.dart';
import 'package:pyari_desh/view-model-manager/state_change_notifer.dart';

import 'internet_checker.dart';

//state providers from river pod state management
//entire application state is managed by these providers of different types
//all are global

final countryStateProvider =
    FutureProvider.autoDispose<List<CountryData>>((ref) async {
  //this is future provider which provides data upon asynchronous action
  final cancelToken = CancelToken();
  ref.onDispose(() => cancelToken.cancel()); //

  final response =
      await Dio() //used DIO package for get request of the api asynchronously
          .get('https://api.first.org/data/v1/countries',
              cancelToken: cancelToken);
  ref.maintainState =
      true; //maintains or caches state without changing state for repititive api requests
  return ParserState().parseData(response.data
      as Map<String, dynamic>); //sends the response JSON object to parser
});

// Stateprovider for providing favorites countries state changes
final favoriteProvider = StateNotifierProvider((ref) => FavouriteState());
//change notifier provider for internet connection state changes
final internetProvider =
    ChangeNotifierProvider.autoDispose((ref) => InternetChecker());

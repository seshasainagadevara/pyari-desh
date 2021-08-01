import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:pyari_desh/models/country_data.dart';
import 'package:pyari_desh/view-model-manager/country_data_state_provider.dart';

class CountriesGridView extends ConsumerWidget {
  const CountriesGridView({Key? key, required this.data}) : super(key: key);
  final List<CountryData> data;

  @override
  Widget build(BuildContext context, ScopedReader watch) {
    //watch for favorites state changes
    final favs = watch(favoriteProvider);
    //staggered grid view for each item
    return StaggeredGridView.countBuilder(
      crossAxisCount: 4,
      itemCount: data.length,
      itemBuilder: (BuildContext context, int index) {
        //logic for checking and building objects with favorite country choice field
        var dataAtIndex = data.elementAt(index);
        (favs as List).forEach((element) {
          if (element.id == dataAtIndex.id)
            dataAtIndex = dataAtIndex.copyWith(toggled: element.toggled);
        });
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            padding: EdgeInsets.all(5.0),
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(15.0),
                boxShadow: [
                  BoxShadow(
                    color: Colors.white70,
                    blurRadius: 5.0,
                    spreadRadius: 0.8,
                  )
                ]),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    //displaying each country flag with country ID in a circular avatar
                    CircleAvatar(
                      radius: 30.0,
                      backgroundImage: AssetImage(
                          'icons/flags/png/${dataAtIndex.id.toLowerCase()}.png',
                          package: 'country_icons'),
                    ),
                    Text(
                      dataAtIndex.id,
                      style: TextStyle(
                          fontSize: 12.0, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                Text(dataAtIndex.country.country,
                    style: TextStyle(
                      fontSize: 11.0,
                    )),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 8.0),
                  decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.all(Radius.circular(8.0))),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      //logic for changing state of favorite button on each tile of the countries grid view
                      //with updated toggled value for mark and unmark state changes
                      IconButton(
                          icon: Icon(Icons.favorite),
                          color:
                              dataAtIndex.toggled ? Colors.lime : Colors.white,
                          onPressed: () {
                            if (dataAtIndex.toggled)
                              context
                                  .read(favoriteProvider
                                      .notifier) //accessing the state of the Provider and
                                  .unmark(dataAtIndex
                                      .id); // updating the state with new value
                            else
                              context
                                  .read(favoriteProvider.notifier)
                                  .mark(dataAtIndex);
                          }),
                      Text(
                        dataAtIndex.country.region,
                        style: TextStyle(
                            fontSize: 11.0,
                            fontWeight: FontWeight.w700,
                            color: Colors.white70),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        );
      },
      staggeredTileBuilder: (int index) =>
          StaggeredTile.count(2, index.isEven ? 3 : 2),
      mainAxisSpacing: 4.0,
      crossAxisSpacing: 4.0,
    );
  }
}

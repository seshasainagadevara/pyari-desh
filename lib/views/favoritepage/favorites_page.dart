import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pyari_desh/models/country_data.dart';
import 'package:pyari_desh/view-model-manager/country_data_state_provider.dart';

class FavoritePage extends ConsumerWidget {
  const FavoritePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, ScopedReader watch) {
    //watching for state changes of favorite country
    var favs = watch(favoriteProvider);

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Favorites',
          style: TextStyle(color: Colors.yellow),
        ),
        backgroundColor: Colors.black,
      ),
      body: Container(
        //if there are no favorite countries this page will display this message
        child: favs.length == 0
            ? Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.emoji_emotions_sharp),
                    SizedBox(
                      height: 10.0,
                    ),
                    Text(
                      'Mark your favorites now !',
                      style: TextStyle(color: Colors.black54, fontSize: 12.0),
                    ),
                  ],
                ),
              )
            : ListView.builder(
                //displays list of countries irrespective of offline/online during app session
                itemBuilder: (context, index) {
                  CountryData elementAtIndex = favs.elementAt(index);
                  return ListTile(
                      leading: CircleAvatar(
                        backgroundImage: AssetImage(
                            'icons/flags/png/${elementAtIndex.id.toLowerCase()}.png',
                            package: 'country_icons'),
                      ),
                      trailing: Text(
                        elementAtIndex.id,
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      title: Text(
                        elementAtIndex.country.country,
                        style: TextStyle(
                            color: Colors.black87, fontWeight: FontWeight.w800),
                      ),
                      subtitle: Text(
                        elementAtIndex.country.region,
                        style: TextStyle(
                            color: Colors.black54, fontWeight: FontWeight.w800),
                      ));
                },
                itemCount: favs.length,
              ),
      ),
    );
  }
}

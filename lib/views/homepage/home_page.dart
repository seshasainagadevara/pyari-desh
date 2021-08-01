import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pyari_desh/view-model-manager/country_data_state_provider.dart';
import 'package:pyari_desh/views/homepage/components/countries_paginated_view.dart';
import 'package:pyari_desh/views/homepage/components/custom_appbar.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
          body: Container(
              width: size.width,
              height: size.height,
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomCenter,
                      colors: [Colors.black, Colors.black, Colors.indigo])),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  //custome app bar which includes favroties icon
                  CustomAppBar(
                    title: widget.title,
                  ),
                  SizedBox(
                    height: size.height * 0.05,
                  ),
                  //consumer for listening internet connection state changes
                  Consumer(builder: (BuildContext context,
                      T Function<T>(ProviderBase<Object?, T>) watch,
                      Widget? child) {
                    var watcher = watch(internetProvider).isConnected;
                    return watcher
                        ? CountriesPaginatedView()
                        : Center(
                            child: Container(
                              height: size.height * 0.5,
                              width: size.width * 0.8,
                              child: Card(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Image.asset(
                                      'assets/internet.png',
                                      fit: BoxFit.contain,
                                      width: 120.0,
                                      height: 120.0,
                                    ),
                                    SizedBox(
                                      height: 50.0,
                                    ),
                                    Text(
                                      'Please check internet connection !',
                                      style: TextStyle(
                                        color: Colors.black87,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          );
                  })
                ],
              ))),
    );
  }
}

import 'package:provider/provider.dart';

import '../../data/providers/home_page_provider.dart';
import '../../utils/contants.dart';
import 'package:flutter/material.dart';

import '../../utils/hive_util.dart';
import '../widgets/custom_app_bar.dart';
import '../widgets/main_weather_tab.dart';
import '../widgets/weather_quality_tab.dart';
import '../widgets/weekly_tab.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with HiveUtil {
  HomeProvider homeProvider = HomeProvider();

  _showMessage(String text, {bool isError = true}) {
    Future.delayed(
        Duration.zero,
        () => ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                backgroundColor: isError ? Colors.red : Colors.green[400],
                content: Text(
                  text,
                  style: kTextStyle(size: 15, fontWeight: FontWeight.w500),
                ),
              ),
            ));
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<HomeProvider>(
      builder: (context, homeProvider, child) => FutureBuilder(
          future: homeProvider.data == null
              ? homeProvider.loadData(homeProvider.requestName)
              : homeProvider.loadData(homeProvider.requestName),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Scaffold(
                appBar: customAppBar(homeProvider, true),
                body: const Center(
                  child: CircularProgressIndicator(),
                ),
              );
            } else if (snapshot.connectionState == ConnectionState.done 
            &&homeProvider.data?.date != null
                ) {
              /////////////
              return Scaffold(
                appBar: customAppBar(homeProvider, false),
                body: ListView(
                  children: [
                    Container(
                      decoration: const BoxDecoration(
                        gradient: LinearGradient(
                            colors: [
                              Color(0xfffef7ff),
                              Color(0xfffcebff),
                            ],
                            begin: FractionalOffset(0.0, 0.0),
                            end: FractionalOffset(1.0, 0.0),
                            stops: [0.0, 1.0],
                            tileMode: TileMode.clamp),
                      ),
                      padding: const EdgeInsets.only(
                        left: 25,
                        right: 25,
                        bottom: 25,
                      ),
                      child: Column(
                        children: [
                          mainWeatherTab(homeProvider),
                          weatherQualityTab(homeProvider),
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              "Haftalik ob-havo ma'lumoti",
                              style: kTextStyle(
                                  size: 22,
                                  fontWeight: FontWeight.w700,
                                  color: Colors.black),
                            ),
                          ),
                          weeklyReportTab(homeProvider),
                        ],
                      ),
                    ),
                  ],
                ),
              );
            } else {
              return _showMessage('Internet Connection failed');
            }
          },
        ),
      );
  }
}

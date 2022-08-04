import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:provider/provider.dart';
import 'package:weather_with_provider/data/providers/home_page_provider.dart';

import 'data/model/weather_model.dart';
import 'utils/routes.dart';

void main() async{
  await Hive.initFlutter();
  Hive.registerAdapter<WeatherModel>(WeatherModelAdapter());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_)=> HomeProvider())
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        onGenerateRoute: (settings) => Routes.generateRoute(settings),
      ),
    );
  }
}

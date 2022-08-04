import 'package:flutter/material.dart';
import 'package:html/parser.dart';
import 'package:http/http.dart';

import '../../utils/hive_util.dart';
import '../model/weather_model.dart';

class HomeProvider extends ChangeNotifier with HiveUtil {
  WeatherModel? data;
  var requestName = 'ferghana';
  Future<void> loadData(String city) async {
    data = WeatherModel();

    Future<bool> loadLocalData() async {
      try {
        var model = await getBox<WeatherModel?>('weatherBox', key: requestName);
        if (model!.date ==
            "${DateTime.now().day}.${DateTime.now().month}.${DateTime.now().year}") {
          data = model;
          return true;
        }
        return false;
      } catch (e) {
        return false;
      }
    }

    var isLoad = await loadLocalData();

    if (!isLoad) {
      try {
        var response = await get(Uri.parse('https://obhavo.uz/$city'));
        if (response.statusCode == 200) {
          var document = parse(response.body);
          var days = [];
          var current = [];
          var tempDays = [];
          var feelings = [];
          var weekDays = [];
          var rainPercs = [];
          var tempNights = [];

          var currentWeather =
              document.getElementsByClassName('grid-1 cont-block')[0];
          current.add(
              currentWeather.getElementsByClassName('current-day')[0].text);
          current.add(currentWeather.getElementsByTagName('strong')[0].text);
          current.add(currentWeather.getElementsByTagName('span')[2].text);
          current.add(currentWeather
              .getElementsByClassName("current-forecast-desc")[0]
              .text);
          current.add(currentWeather.getElementsByTagName('p')[0].text);
          current.add(currentWeather.getElementsByTagName('p')[1].text);
          current.add(currentWeather.getElementsByTagName('p')[2].text);
          current.add(currentWeather.getElementsByTagName('p')[3].text);
          current.add(currentWeather.getElementsByTagName('p')[4].text);
          current.add(currentWeather.getElementsByTagName('p')[5].text);

          var weatherList = document
              .getElementsByClassName('weather-table')[0]
              .getElementsByTagName('tr');

          for (var i = 1; i < weatherList.length; i++) {
            weekDays.add(weatherList[i].getElementsByTagName('strong')[1].text);
            days.add(weatherList[i].getElementsByTagName('div')[1].text);
            tempDays.add(
                weatherList[i].getElementsByClassName('forecast-day')[0].text);
            tempNights.add(weatherList[i]
                .getElementsByClassName('forecast-night')[0]
                .text);
            feelings.add(weatherList[i]
                .getElementsByClassName('weather-row-desc')[0]
                .text);
            rainPercs.add(weatherList[i]
                .getElementsByClassName('weather-row-pop')[0]
                .text
                .trim());
          }
          var today =
              "${DateTime.now().day}.${DateTime.now().month}.${DateTime.now().year}";
          WeatherModel weatherModel = WeatherModel(
              date: today,
              today: current,
              weekDays: weekDays,
              days: days,
              tempDay: tempDays,
              tempNight: tempNights,
              feeling: feelings,
              rainPerc: rainPercs);

          data = weatherModel;
          await saveBox<WeatherModel?>('weatherBox', data, key: requestName);
          notifyListeners();
        }
      } catch (e) {}
    } else {}
  }

  var zero = true;
  var one = false;
  var two = false;
  var three = false;
  var four = false;
  var five = false;
  var six = false;

  void updateState() {
    notifyListeners();
  }

  check(int selected) {
    switch (selected) {
      case 0:
        zero = true;
        one = false;
        two = false;
        three = false;
        four = false;
        five = false;
        six = false;
        break;
      case 1:
        zero = false;
        one = true;
        two = false;
        three = false;
        four = false;
        five = false;
        six = false;
        break;
      case 2:
        zero = false;
        one = false;
        two = true;
        three = false;
        four = false;
        five = false;
        six = false;
        break;
      case 3:
        zero = false;
        one = false;
        two = false;
        three = true;
        four = false;
        five = false;
        six = false;
        break;
      case 4:
        zero = false;
        one = false;
        two = false;
        three = false;
        four = true;
        five = false;
        six = false;
        break;
      case 5:
        zero = false;
        one = false;
        two = false;
        three = false;
        four = false;
        five = true;
        six = false;
        break;
      case 6:
        zero = false;
        one = false;
        two = false;
        three = false;
        four = false;
        five = false;
        six = true;
        break;
      default:
    }
    notifyListeners();
  }

  var dItems = {
    'Toshkent': 'Tashkent',
    'Andijon': 'Andijan',
    'Buxoro': 'Bukhara',
    'Guliston': 'Gulistan',
    'Jizzax': 'Jizzakh',
    'Zarafshon': 'Zarafshan',
    'Qarshi': 'Karshi',
    'Navoiy': 'Navoi',
    'Namangan': 'Namangan',
    'Nukus': 'Nukus',
    'Samarqand': 'Samarkand',
    'Termiz': 'Termez',
    'Urganch': 'Urgench',
    "Farg'ona": 'Ferghana',
    'Xiva': 'Khiva'
  };

  var dropdownValue = "Farg'ona";
}

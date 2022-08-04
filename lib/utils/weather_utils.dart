
import 'package:flutter/material.dart';

AssetImage weatherIcon(String? position) {
  if (position != null) {
    if (position.trim().contains('ochiq havo')) {
      return const AssetImage('assets/weather_icons/ic_sunny.png');
    } else if (position.trim().contains('bulutli')) {
      return const AssetImage('assets/weather_icons/ic_mist.png');
    } else if (position.trim().contains("yomg'ir")) {
      return const AssetImage('assets/weather_icons/ic_drizzle.png');
    } else if (position.trim().contains("chaqmoq")) {
      return const AssetImage('assets/weather_icons/ic_storm.png');
    } else if (position.trim().contains("qor")) {
      return const AssetImage('assets/weather_icons/ic_snow.png');
    }
  }

  return const AssetImage('assets/weather_icons/ic_cloudy.png');
}
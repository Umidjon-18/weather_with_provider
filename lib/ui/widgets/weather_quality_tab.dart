  import 'package:flutter/material.dart';

import '../../data/providers/home_page_provider.dart';
import '../../utils/contants.dart';
import 'item_info.dart';

Widget weatherQualityTab(HomeProvider homeProvider) {
    return Container(
      width: double.infinity,
      height: 180,
      margin: const EdgeInsets.only(
        top: 25,
        bottom: 25,
      ),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          color: const Color(0xffFFFFFF)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              // const SizedBox(width: 21.92),
              const Image(
                image: AssetImage('assets/weather_icons/quality_air.png'),
                width: 29.17,
                height: 29.17,
              ),
              // const SizedBox(width: 16.92),
              Text(
                'Havo sifati',
                style: kTextStyle(
                    size: 18,
                    fontWeight: FontWeight.w600,
                    color: const Color(0xff25272E)),
              ),
              Container(
                width: 35,
                height: 35,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(17.5),
                  color: Colors.white,
                ),
                child: IconButton(
                  onPressed: (){
                    homeProvider.updateState();
                  },
                  icon: Image.asset(
                    'assets/weather_icons/ic_refresh.png',
                    width: 14.28,
                  ),
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  itemInfo(
                      'assets/weather_icons/ic_pressure.png',
                      'Havo bosimi',
                      '${homeProvider.data?.today?[6].toString().substring(7, 10)}mm.s.us'),
                  const SizedBox(height: 20),
                  itemInfo('assets/weather_icons/ic_rain_perc.png', 'Namlik',
                      '${homeProvider.data?.today?[4].toString().substring(8)}'),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  itemInfo(
                      'assets/weather_icons/ic_wind.png',
                      'Shamol tezligi',
                      '${homeProvider.data?.today?[5].toString().split(",")[1].trim()}'),
                  const SizedBox(height: 20),
                  itemInfo('assets/weather_icons/ic_moon.png', "Oy ko'rinishi",
                      '${homeProvider.data?.today?[7].toString().substring(4)}'),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  itemInfo(
                      'assets/weather_icons/ic_sun_up.png',
                      'Quyosh chiqishi',
                      '${homeProvider.data?.today?[8].toString().substring(17)}'),
                  const SizedBox(height: 20),
                  itemInfo(
                      'assets/weather_icons/ic_sun_down.png',
                      'Quyosh botishi',
                      '${homeProvider.data?.today?[9].toString().substring(16)}'),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }

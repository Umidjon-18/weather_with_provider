  import 'package:flutter/material.dart';

import '../../data/providers/home_page_provider.dart';
import '../../utils/contants.dart';
import '../../utils/weather_utils.dart';

Widget mainWeatherTab(HomeProvider homeProvider) {
    return SizedBox(
      height: 222,
      child: Stack(
        children: [
          Container(
            margin: const EdgeInsets.only(top: 30),
            width: double.infinity,
            height: 202,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              gradient: const LinearGradient(
                  colors: [Color(0xffe662e5), Color(0xff5364f0)],
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight),
              boxShadow: [
                BoxShadow(
                  color: const Color(0xff5264F0).withOpacity(0.5),
                  blurRadius: 20,
                  offset: const Offset(10, 15),
                ),
              ],
            ),
          ),
          Align(
            alignment: Alignment.topLeft,
            child: Padding(
              padding: const EdgeInsets.only(
                left: 26,
                top: 7,
              ),
              child: Image(
                image: weatherIcon(homeProvider.data?.today?[3].toString().toLowerCase()),
                width: 160,
                height: 160,
              ),
            ),
          ),
          Align(
            alignment: Alignment.topRight,
            child: Padding(
              padding: const EdgeInsets.only(
                right: 26,
                top: 44,
              ),
              child: RichText(
                text: TextSpan(
                  text: '${homeProvider.data?.today?[0].toString().substring(0, 5)}\n',
                  style: kTextStyle(size: 16, fontWeight: FontWeight.w500),
                  children: [
                    TextSpan(
                      text: ' ${homeProvider.data?.today?[0].toString().substring(6)}',
                      style: kTextStyle(size: 16, fontWeight: FontWeight.w500),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.topRight,
            child: Padding(
              padding: const EdgeInsets.only(
                right: 21,
                top: 98,
              ),
              child: Column(
                children: [
                  Text(
                    '${homeProvider.data?.today?[1]}',
                    style: kTextStyle(size: 60, fontWeight: FontWeight.w700),
                  ),
                  Text(
                    'Oqshom ${homeProvider.data?.today?[2]}',
                    style: kTextStyle(size: 15, fontWeight: FontWeight.w500),
                  ),
                ],
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomLeft,
            child: Padding(
              padding: const EdgeInsets.only(
                left: 28,
                bottom: 23,
              ),
              child: Text(
                '${homeProvider.data?.today?[3]}',
                style: kTextStyle(size: 26, fontWeight: FontWeight.w600),
              ),
            ),
          )
        ],
      ),
    );
  }

  import 'package:flutter/material.dart';
import 'dart:math' as math;
import '../../utils/contants.dart';
import '../../utils/weather_utils.dart';

Widget itemWeek(String shortWeek, String shortDate, String feeling,
      String temp, String perc, bool grd) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 12),
      width: 66,
      height: 190,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(33),
        gradient: grd
            ? const LinearGradient(
                colors: [
                  Color(0xffE662E5),
                  Color(0xff5364F0),
                ],
                transform: GradientRotation(2 * math.pi / 13),
              )
            : null,
      ),
      child: Column(
        children: [
          const SizedBox(height: 17),
          Text(
            shortWeek,
            style: kTextStyle(
                size: 12,
                fontWeight: FontWeight.w600,
                color: grd ? Colors.white : Colors.black),
          ),
          const SizedBox(height: 5),
          Text(
            shortDate,
            style: kTextStyle(
                size: 12,
                fontWeight: FontWeight.w600,
                color: grd ? Colors.white : Colors.grey),
          ),
          const SizedBox(height: 13),
          SizedBox(
            width: 40,
            height: 40,
            child: Image(
              image: weatherIcon(feeling.trim()),
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(height: 13),
          Padding(
            padding: const EdgeInsets.only(left: 8, bottom: 10),
            child: Text(
              temp,
              style: kTextStyle(
                  size: 22,
                  fontWeight: FontWeight.w600,
                  color: grd ? Colors.white : Colors.black),
            ),
          ),
          Container(
            alignment: Alignment.center,
            width: 30,
            height: 20,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: const Color(0xff2DBE8D),
            ),
            child: Text(
              perc,
              style: kTextStyle(size: 10, fontWeight: FontWeight.w600),
            ),
          ),
        ],
      ),
    );
  }
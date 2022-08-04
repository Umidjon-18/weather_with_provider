import 'package:flutter/material.dart';

import '../../data/providers/home_page_provider.dart';
import '../../utils/contants.dart';

PreferredSizeWidget customAppBar(HomeProvider homeProvider, bool isLoading) {
  return PreferredSize(
    preferredSize: const Size.fromHeight(100.0),
    child: Container(
      padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 20),
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
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GestureDetector(
            child: Container(
              alignment: Alignment.center,
              width: 50,
              height: 50,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25),
                color: Colors.white,
              ),
              child: Image.asset(
                'assets/weather_icons/ic_menu.png',
                width: 15,
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(
              left: 20,
              top: 10,
            ),
            child: Column(
              children: [
                Row(
                  children: [
                    const Image(
                      image: AssetImage('assets/weather_icons/ic_location.png'),
                      width: 15,
                      height: 17.48,
                    ),
                    const SizedBox(width: 7.5),
                    DropdownButtonHideUnderline(
                      child: DropdownButton(
                        borderRadius: BorderRadius.circular(20),
                        menuMaxHeight: 360,
                        iconSize: 0.0,
                        value: homeProvider.dropdownValue,
                        items: homeProvider.dItems.keys.map((String item) {
                          return DropdownMenuItem(
                            value: item,
                            child: Text(
                              item,
                              style: kTextStyle(
                                  size: 20,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.black),
                            ),
                          );
                        }).toList(),
                        onChanged: (String? newValue) {
                          homeProvider.dropdownValue = newValue ?? "Farg'ona";
                          homeProvider.requestName = homeProvider
                              .dItems[homeProvider.dropdownValue]!
                              .toLowerCase();
                          homeProvider.check(0);
                          homeProvider.data = null;
                        },
                      ),
                    ),
                  ],
                ),
                InkWell(
                  onTap: () {
                    homeProvider.updateState();
                  },
                  child: Container(
                    margin: const EdgeInsets.only(right: 30),
                    alignment: Alignment.center,
                    width: 100,
                    height: 22,
                    decoration: BoxDecoration(
                      gradient: const LinearGradient(
                          colors: [Color(0xffe662e5), Color(0xff5364f0)],
                          begin: Alignment.centerLeft,
                          end: Alignment.centerRight),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Text(
                      isLoading ? 'Yangilanmoqda°' : 'Yangilangan°',
                      style: kTextStyle(size: 12, fontWeight: FontWeight.w400),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            width: 50,
            height: 50,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25), color: Colors.grey),
            child: const Image(
              image: AssetImage('assets/weather_icons/ic_logo.png'),
              fit: BoxFit.cover,
            ),
          ),
        ],
      ),
    ),
  );
}

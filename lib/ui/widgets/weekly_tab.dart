  import 'package:flutter/material.dart';

import '../../data/providers/home_page_provider.dart';
import 'item_week.dart';

Widget weeklyReportTab(HomeProvider homeProvider) {
    return Container(
      margin: const EdgeInsets.only(top: 20),
      height: 200,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: [
          InkWell(
            onTap: () {
                homeProvider.check(0);
            },
            child: itemWeek(
                '${homeProvider.data?.weekDays?[0]}',
                '${homeProvider.data?.days?[0]}',
                '${homeProvider.data?.feeling?[0]}',
                '${homeProvider.data?.tempDay?[0]}',
                '${homeProvider.data?.rainPerc?[0]}',
                homeProvider.zero),
          ),
          InkWell(
            onTap: () {
              homeProvider.check(1);
            },
            child: itemWeek(
                '${homeProvider.data?.weekDays?[1]}',
                '${homeProvider.data?.days?[1]}',
                '${homeProvider.data?.feeling?[1]}',
                '${homeProvider.data?.tempDay?[1]}',
                '${homeProvider.data?.rainPerc?[1]}',
                homeProvider.one),
          ),
          InkWell(
            onTap: () {
              homeProvider.check(2);
            },
            child: itemWeek(
                '${homeProvider.data?.weekDays?[2]}',
                '${homeProvider.data?.days?[2]}',
                '${homeProvider.data?.feeling?[2]}',
                '${homeProvider.data?.tempDay?[2]}',
                '${homeProvider.data?.rainPerc?[2]}',
                homeProvider.two),
          ),
          InkWell(
            onTap: () {
              homeProvider.check(3);
            },
            child: itemWeek(
                '${homeProvider.data?.weekDays?[3]}',
                '${homeProvider.data?.days?[3]}',
                '${homeProvider.data?.feeling?[3]}',
                '${homeProvider.data?.tempDay?[3]}',
                '${homeProvider.data?.rainPerc?[3]}',
                homeProvider.three),
          ),
          InkWell(
            onTap: () {
              homeProvider.check(4);
            },
            child: itemWeek(
                '${homeProvider.data?.weekDays?[4]}',
                '${homeProvider.data?.days?[4]}',
                '${homeProvider.data?.feeling?[4]}',
                '${homeProvider.data?.tempDay?[4]}',
                '${homeProvider.data?.rainPerc?[4]}',
                homeProvider.four),
          ),
          InkWell(
            onTap: () {
                homeProvider.check(5);
            },
            child: itemWeek(
                '${homeProvider.data?.weekDays?[5]}',
                '${homeProvider.data?.days?[5]}',
                '${homeProvider.data?.feeling?[5]}',
                '${homeProvider.data?.tempDay?[5]}',
                '${homeProvider.data?.rainPerc?[5]}',
                homeProvider.five),
          ),
          InkWell(
            onTap: () {
              homeProvider.check(6);
            },
            child: itemWeek(
                '${homeProvider.data?.weekDays?[6]}',
                '${homeProvider.data?.days?[6]}',
                '${homeProvider.data?.feeling?[6]}',
                '${homeProvider.data?.tempDay?[6]}',
                '${homeProvider.data?.rainPerc?[6]}',
                homeProvider.six),
          ),
        ],
      ),
    );
  }

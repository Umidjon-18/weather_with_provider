  import 'package:flutter/material.dart';

import '../../utils/contants.dart';

Widget itemInfo(String iconPath, String infoName, String amount) {
    return Row(
      children: [
        Image(
          image: AssetImage(iconPath),
          width: 25,
        ),
        const SizedBox(width: 7),
        RichText(
          text: TextSpan(
            text: '$infoName\n',
            style: kTextStyle(
                size: 10,
                fontWeight: FontWeight.w600,
                color: const Color(0xffCBCBCB)),
            children: [
              TextSpan(
                text: amount,
                style: kTextStyle(
                    size: 10, fontWeight: FontWeight.w600, color: Colors.black),
              ),
            ],
          ),
        ),
      ],
    );
  }


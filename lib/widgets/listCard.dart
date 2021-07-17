import 'package:flutter/material.dart';
import 'dart:math';

import '../constants/constants.dart';

class ListCard extends StatelessWidget {
  final _random = Random();
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      child: Material(
        elevation: 10,
        color: cardColor[_random.nextInt(cardColor.length)],
        borderRadius: BorderRadius.circular(15),
        child: InkWell(
          borderRadius: BorderRadius.circular(15),
          splashColor: Colors.redAccent.withOpacity(0.5),
          highlightColor: Colors.red.withOpacity(1),
          onTap: () {},
          child: Container(
            height: 150,
            padding: EdgeInsets.fromLTRB(0, 20, 0, 20),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
            ),
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Icon(
                    Icons.drag_indicator_outlined,
                    color: Colors.white54,
                    size: 25,
                  ),
                ),
                Expanded(
                    child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Make a coffee!!",
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 5),
                    Text(
                      "Drinking in the day’s first sip of coffee is like paradise massaging the taste buds. It is, as one coffee-in-a-can company figured out long ago, the best part of waking up. For a single moment at your favorite coffee shop, or while your fingers hug your favorite mug in the kitchen, you’ve been taken to the scene of your last vacation – the day’s worries momentarily melting away, letting you breathe in the serenity of sunshine just as the caffeine smacks your brain.",
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                      ),
                    ),
                    SizedBox(height: 7),
                    Row(
                      children: [
                        Icon(
                          Icons.alarm,
                          color: Colors.white,
                          size: 16,
                        ),
                        SizedBox(width: 10),
                        Text(
                          "5d",
                          style: TextStyle(color: Colors.white),
                        )
                      ],
                    )
                  ],
                )),
                Icon(
                  Icons.chevron_right,
                  color: Colors.white54,
                  size: 60,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

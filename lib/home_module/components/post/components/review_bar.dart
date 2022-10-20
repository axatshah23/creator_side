import 'package:creator_side/lists.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import '../../../../constants.dart';

class ReviewBar extends StatefulWidget {
  const ReviewBar({Key? key}) : super(key: key);

  @override
  State<ReviewBar> createState() => _ReviewBarState();
}

class _ReviewBarState extends State<ReviewBar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 20.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          /// For circle avatar, name and options button
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              /// Circle Avatar and Name
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  CircleAvatar(
                    radius: 22.0,
                    //TODO: Fetch the profile image from the database and display here
                    backgroundImage: NetworkImage(imageAddress.first),
                  ),
                  SizedBox(width: 12.0),
                  Text(
                    name.first,
                    maxLines: 1,
                    softWrap: false,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.w600,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),

              /// Options button
              IconButton(
                onPressed: () {
                  //TODO: open options
                },
                icon: Icon(
                  IconlyLight.moreCircle,
                  size: 20.0,
                ),
              )
            ],
          ),

          /// For comment
          // TODO: Fetch reviews from database and display here

          const Text(
            'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.',
            style: TextStyle(fontSize: 14.0, fontWeight: FontWeight.w400),
          ),
          const SizedBox(height: 4.0),

          /// Star indicators
          // TODO: Fetch from database and reflect it here
          RatingBarIndicator(
            rating: 4,
            itemBuilder: (context, index) => const Icon(
              IconlyBold.star,
              color: kAppThemeRed,
            ),
            itemCount: 5,
            itemSize: 24,
            unratedColor: kAppThemeRedLight,
            direction: Axis.horizontal,
          ),
        ],
      ),
    );
  }
}

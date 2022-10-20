import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';

import 'components/review_bar.dart';

class ReviewsTabScreen extends StatefulWidget {
  const ReviewsTabScreen({Key? key}) : super(key: key);

  @override
  State<ReviewsTabScreen> createState() => _ReviewsTabScreenState();
}

class _ReviewsTabScreenState extends State<ReviewsTabScreen> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        /// For padding
        const SizedBox(height: 8.0),

        /// Number of Comments and see all button
        SizedBox(
          height: 32.0,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // TODO: Find number of comments and show here.
              Text(
                '6.9K Reviews',
                style: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.w700,
                  color: Colors.black,
                ),
              ),
              IconButton(
                onPressed: () {
                  // TODO: Trigger more options event
                },
                icon: Icon(
                  IconlyLight.moreCircle,
                  color: Colors.black,
                ),
              )
            ],
          ),
        ),

        /// ListView to display all the comments
        Flexible(
          child: ListView.builder(
            itemCount: 12,
            padding: EdgeInsets.only(top: 16.0),
            itemBuilder: (context, index) {
              return const ReviewBar();
            },
          ),
        ),
      ],
    );
  }
}

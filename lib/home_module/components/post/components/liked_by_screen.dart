import 'package:creator_side/widgets/find_friend_search_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';

import '../../../../constants.dart';
import '../../../../lists.dart';
import '../../../../widgets/follow_account_bar.dart';

class LikedByScreen extends StatefulWidget {
  const LikedByScreen({Key? key, required this.likes}) : super(key: key);
  final int likes;

  @override
  State<LikedByScreen> createState() => _LikedByScreenState();
}

class _LikedByScreenState extends State<LikedByScreen> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;

    /// Method that returns screen according to likes
    Widget LikedBody() {
      if (widget.likes == 0) {
        return Center(
          child: Text(
            'No Likes yet',
            textScaleFactor: 2.0,
          ),
        );
      } else {
        return Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: height * 0.025),

            /// Search Bar
            const FindFriendSearchBar(),
            SizedBox(height: height * 0.02),
            // TODO: Search bar functionality

            /// Listview of different accounts to follow
            // TODO: Functionality of displaying accounts who actually have liked the image
            Expanded(
              child: ListView.builder(
                itemCount: imageAddress.length,
                itemBuilder: (context, index) {
                  return FollowAccountBar(
                    imageURL: imageAddress[index],
                    mainText: name[index],
                    subText: subText[index],
                  );
                },
              ),
            ),
          ],
        );
      }
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            IconlyLight.arrowLeft,
            color: Colors.black,
          ),
        ),
        centerTitle: true,
        title: const Text(
          'Likes',
          style: kAppBarTitleTextStyle,
        ),
      ),
      body: LikedBody(),
    );
  }
}

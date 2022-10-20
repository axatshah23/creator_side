import 'package:flutter/material.dart';

import '../../lists.dart';
import '../components/post/display_post.dart';
import '../components/story/display_story.dart';

class FollowingScreen extends StatefulWidget {
  const FollowingScreen({Key? key}) : super(key: key);

  @override
  State<FollowingScreen> createState() => _FollowingScreenState();
}

class _FollowingScreenState extends State<FollowingScreen> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          /// Stories
          StoryContainer(),
          SizedBox(width: 12.0),

          /// Posts will go here
          /// Single image
          DisplayPost(
            profilePicture: imageAddress[14],
            name: name[14],
            isLocationShared: false,
            time: '20 seconds ago',
            caption: caption[14],
            numberOfContent: 1,
            isImage: [true],
            content: [imageAddress[14]],
            likeCounter: 154,
            commentCounter: 15,
          ),

          /// Multi image
          DisplayPost(
            profilePicture: imageAddress[09],
            name: name[09],
            isLocationShared: false,
            time: '2 hours ago',
            caption: 'No more mutants',
            numberOfContent: 5,
            isImage: [true,true,true,true,true],
            content: [
              imageAddress[09],
              imageAddress[10],
              imageAddress[11],
              imageAddress[12],
              imageAddress[13],
            ],
            likeCounter: 2328,
            commentCounter: 18,
          ),
        ],
      ),
    );
  }
}

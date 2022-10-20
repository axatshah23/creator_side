import 'package:flutter/material.dart';

import '../../../lists.dart';
import 'components/story_button.dart';
import 'components/your_story_button.dart';

class StoryContainer extends StatefulWidget {
  const StoryContainer({Key? key}) : super(key: key);

  @override
  State<StoryContainer> createState() => _StoryContainerState();
}

class _StoryContainerState extends State<StoryContainer> {
  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 2.0,
      child: Container(
        padding: const EdgeInsets.fromLTRB(16.0, 16.0, 0.0, 16.0),
        width: double.infinity,
        height: 114.0,
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              /// Your Story
              const YourStoryButton(
                hasStory: true,
              ),

              /// Others Story
              ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                scrollDirection: Axis.horizontal,
                itemCount: imageAddress.length,
                itemBuilder: (context, index) {
                  return StoryButton(
                    name: name[index],
                    imageURL: imageAddress[index],
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

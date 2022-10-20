import 'package:creator_side/home_module/components/story/components/story_screen.dart';
import 'package:flutter/material.dart';

import '../../../../constants.dart';
import 'data.dart';

class StoryButton extends StatefulWidget {
  const StoryButton({Key? key, required this.name, required this.imageURL})
      : super(key: key);
  final String name;
  final String imageURL;

  @override
  State<StoryButton> createState() => _StoryButtonState();
}

class _StoryButtonState extends State<StoryButton> {
  bool isViewed = false;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => StoryScreen(
              stories: stories,
              imageURL: widget.imageURL,
              name: widget.name,
            ),
          ),
        );
        setState(() {
          isViewed = true;
        });
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 2.5),
        child: Column(
          children: [
            /// Story stack

            Stack(
              alignment: AlignmentDirectional.center,
              children: [
                /// Outline container
                Container(
                  height: 55.0,
                  width: 55.0,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    gradient: LinearGradient(
                      colors: isViewed
                          ? [Color(0xFFD6D6D6), Color(0xFFD6D6D6)]
                          : [Color(0xFFFF906A), kPinkColor],
                      begin: Alignment.topRight,
                      end: Alignment.bottomLeft,
                    ),
                  ),
                ),

                /// Profile Picture container
                Container(
                  height: 50.0,
                  width: 50.0,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(color: Colors.white, width: 2),
                    image: DecorationImage(
                      image: NetworkImage(widget.imageURL),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ],
            ),

            /// Name Text
            const SizedBox(height: 6.0),
            SizedBox(
              height: 20.0,
              width: 70.0,
              child: Text(
                widget.name,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.center,
                style: kStoryUsernameTextStyle,
              ),
            )
          ],
        ),
      ),
    );
  }
}

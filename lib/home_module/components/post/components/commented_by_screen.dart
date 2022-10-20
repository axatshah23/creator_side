import 'package:carousel_slider/carousel_slider.dart';
import 'package:creator_side/home_module/components/post/components/video_player.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';

import '../../../../constants.dart';
import 'comment_bar.dart';

class CommentedByScreen extends StatefulWidget {
  CommentedByScreen({
    Key? key,
    required this.currentIndex,
    required this.comments,
    required this.aspectRatio,
    required this.numberOfContent,
    required this.isImage,
    required this.content,
  }) : super(key: key);
  int currentIndex;
  final int comments;
  final int numberOfContent;
  final List<bool> isImage;
  final List<String> content;
  final double aspectRatio;

  @override
  State<CommentedByScreen> createState() => _CommentedByScreenState();
}

class _CommentedByScreenState extends State<CommentedByScreen> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.white,
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
          'Comments',
          style: kAppBarTitleTextStyle,
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            /// content itself
            CarouselSlider(
              options: CarouselOptions(
                aspectRatio: widget.aspectRatio,
                viewportFraction: 1.0,
                enableInfiniteScroll: false,
                onPageChanged: (index, reason) {
                  setState(
                    () {
                      widget.currentIndex = index;
                    },
                  );
                },
              ),
              items: widget.content
                  .map(
                    (item) => Stack(
                      alignment: AlignmentDirectional.topEnd,
                      children: [
                        /// Stack containing content and like animation
                        Stack(
                          alignment: AlignmentDirectional.center,
                          children: [
                            /// Content
                            Container(
                              child: widget.isImage[widget.currentIndex]
                                  ? AspectRatio(
                                      aspectRatio: widget.aspectRatio,
                                      child: Image(
                                        image: NetworkImage(item),
                                        fit: BoxFit.cover,
                                      ),
                                    )
                                  : Center(
                                      child: CustomVideoPlayer(url: item),
                                    ),
                            ),
                          ],
                        ),

                        /// content number indicator
                        Visibility(
                          visible: widget.numberOfContent > 1,
                          child: Container(
                            margin: const EdgeInsets.all(8.0),
                            height: 25.0,
                            width: 50.0,
                            decoration: BoxDecoration(
                              color: kLightBlackBackground,
                              borderRadius: BorderRadius.circular(12.0),
                            ),
                            child: Center(
                              child: Text(
                                '${(widget.currentIndex + 1).toString()}/${widget.numberOfContent}',
                                style: const TextStyle(color: Colors.white),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  )
                  .toList(),
            ),

            /// Comments
            const SizedBox(height: 8.0),

            /// Number of Comments and see all button
            Container(
              margin: EdgeInsets.fromLTRB(16.0, 4.0, 12.0, 0.0),
              height: 32.0,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // TODO: Find number of comments and show here.
                  Text(
                    '24.6K Comments',
                    style: TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.w700,
                      color: Colors.black,
                    ),
                  ),
                  TextButton(
                      onPressed: () {
                        // TODO: Trigger on see all event
                      },
                      child: Text(
                        'See all',
                        style: TextStyle(
                          fontSize: 14.0,
                          fontWeight: FontWeight.w600,
                          color: kAppThemeRed,
                        ),
                      ))
                ],
              ),
            ),

            /// ListView to display all the comments
            Container(
              margin: EdgeInsets.only(left: 12.0, right: 8.0),
              child: ListView.builder(
                itemCount: 12,
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                padding: EdgeInsets.only(top: 16.0),
                itemBuilder: (context, index) {
                  return const CommentBar();
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}

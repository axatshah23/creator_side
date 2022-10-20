import 'package:carousel_slider/carousel_slider.dart';
import 'package:creator_side/home_module/components/post/comments_tab_screen.dart';
import 'package:creator_side/home_module/components/post/reviews_tab_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../constants.dart';
import '../../../lists.dart';
import 'components/commented_by_screen.dart';
import 'components/liked_by_screen.dart';
import 'components/video_player.dart';
import 'components/viewed_by_avatar_circles.dart';
import 'components/viewed_by_screen.dart';
import 'more_like_this_tab_screen.dart';

class DetailedPostScreen extends StatefulWidget {
  DetailedPostScreen({
    Key? key,
    required this.username,
    required this.currentIndex,
    required this.numberOfContent,
    required this.isImage,
    required this.content,
    required this.aspectRatio,
    required this.isLiked,
    required this.likeIcon,
    required this.likeCounter,
    required this.commentCounter,
  }) : super(key: key);
  final String username;
  int currentIndex;
  final int numberOfContent;
  final List<bool> isImage;
  final List<String> content;
  final double aspectRatio;
  bool isLiked;
  Icon likeIcon;
  int likeCounter;
  int commentCounter;
  @override
  State<DetailedPostScreen> createState() => _DetailedPostScreenState();
}

class _DetailedPostScreenState extends State<DetailedPostScreen> {
  bool isHeartAnimating = false;
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
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
        title: Text(
          widget.username,
          style: kAppBarUsernameTextStyle,
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(IconlyLight.moreCircle),
            color: Colors.black,
          )
        ],
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

            /// Like, Comment share and view
            Container(
              margin: EdgeInsets.symmetric(horizontal: 6.0),
              decoration: BoxDecoration(
                  border: Border(
                      bottom: BorderSide(
                width: 0.75,
                color: Colors.grey[350]!,
              ))),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  /// Row for like and comment buttons
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      /// Like Icon
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            widget.isLiked = !widget.isLiked;
                            if (widget.isLiked) {
                              /// Like incremented
                              widget.likeIcon = const Icon(
                                Icons.favorite,
                                color: Colors.red,
                                size: 26.0,
                              );
                              widget.likeCounter++;
                            } else {
                              /// Like decremented
                              widget.likeIcon = const Icon(
                                Icons.favorite_border,
                                size: 26.0,
                              );
                              widget.likeCounter--;
                            }
                          });
                        },
                        child: widget.likeIcon,
                      ),
                      const SizedBox(width: 8.0),

                      /// Like Counter
                      GestureDetector(
                        onTap: () {
                          // TODO: Take to liked by screen.
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => LikedByScreen(
                                likes: widget.likeCounter,
                              ),
                            ),
                          );
                        },
                        child: Text(
                          widget.likeCounter.toString(),
                          style: const TextStyle(fontSize: 16.0),
                        ),
                      ),
                      const SizedBox(width: 24.0),

                      /// Comment Icon and Counter
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => CommentedByScreen(
                                currentIndex: widget.currentIndex,
                                comments: widget.commentCounter,
                                aspectRatio: widget.aspectRatio,
                                numberOfContent: widget.numberOfContent,
                                isImage: widget.isImage,
                                content: widget.content,
                              ),
                            ),
                          );
                        },
                        child: Row(
                          children: [
                            const Icon(
                              FontAwesomeIcons.comment,
                              size: 24.0,
                            ),
                            const SizedBox(width: 8.0),
                            // TODO: Update with actual number of comments
                            Text(
                              widget.commentCounter.toString(),
                              style: const TextStyle(fontSize: 16.0),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(width: 12.0),

                      /// Share Button
                      IconButton(
                        onPressed: () {
                          // TODO: Add share action
                        },
                        icon: const Icon(
                          FontAwesomeIcons.paperPlane,
                          size: 22.0,
                        ),
                      ),
                    ],
                  ),

                  /// Three overlapping circles (Liked by circles)
                  // TODO: Make a way to display three random profile pictures of people who have viewed image
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ViewedByScreen(
                            likes: widget.likeCounter,
                          ),
                        ),
                      );
                    },
                    child: Container(
                      height: 30.0,
                      width: 65.0,
                      color: Colors.transparent,
                      child: ViewedByAvatarCircles(
                        topImage: imageAddress[6],
                        centerImage: imageAddress[5],
                        bottomImage: imageAddress[9],
                      ),
                    ),
                  )
                ],
              ),
            ),

            /// TabView
            /// TabView
            Container(
              margin: const EdgeInsets.all(12.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  DefaultTabController(
                    length: 3, // length of tabs
                    initialIndex: 0,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: <Widget>[
                        /// TabBar
                        Container(
                          decoration: BoxDecoration(
                            border: Border(
                              bottom: BorderSide(
                                width: 2.0,
                                color: Colors.grey[200]!,
                              ),
                            ),
                          ),
                          child: TabBar(
                            labelColor: kAppThemeRed,
                            unselectedLabelColor: Colors.grey[350],
                            indicatorColor: kAppThemeRed,
                            indicatorWeight: 3.0,
                            labelPadding: EdgeInsets.zero,
                            labelStyle: const TextStyle(
                              fontSize: 16.0,
                              fontWeight: FontWeight.w600,
                            ),
                            unselectedLabelStyle: const TextStyle(
                              fontSize: 16.0,
                              fontWeight: FontWeight.w600,
                            ),
                            tabs: const [
                              Tab(text: 'Comments'),
                              Tab(text: 'Reviews'),
                              Tab(text: 'More like this'),
                            ],
                          ),
                        ),

                        /// TabBarView
                        Container(
                          height: height * 0.75,
                          child: const TabBarView(
                            children: <Widget>[
                              CommentTabScreen(),
                              ReviewsTabScreen(),
                              MoreLikeThisTabScreen(),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:creator_side/constants.dart';
import 'package:creator_side/home_module/components/create_popup_fields.dart';
import 'package:creator_side/home_module/components/home_screen_search_bar.dart';
import 'package:creator_side/home_module/components/post/create_post_screen.dart';
import 'package:creator_side/home_module/explore_module/explore_screen.dart';
import 'package:creator_side/home_module/followers_module/followers_screen.dart';
import 'package:creator_side/home_module/following_module/following_screen.dart';
import 'package:creator_side/home_module/group_module/group_screen.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0.0,

          /// App Icon goes here
          leading: const Icon(
            Icons.facebook,
            color: kAppThemeRed,
            size: 36.0,
          ),

          /// Search Bar
          // TODO: Create an actually working search bar. This is just a prototype
          title: const HomeScreenSearchBar(),
          centerTitle: false,

          /// Create Button
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 8.0),
              child: PopupMenuButton(
                  icon: Container(
                    width: 40.0,
                    height: 40.0,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      gradient: LinearGradient(
                        colors: kCreateButtonGradient,
                        begin: Alignment.topRight,
                        end: Alignment.bottomLeft,
                      ),
                    ),
                    child: const Icon(
                      Icons.add,
                      size: 28.0,
                    ),
                  ),
                  itemBuilder: (context) {
                    return const [
                      PopupMenuItem<int>(
                        value: 0,
                        child: CreatePopUpFields(
                          icon: Icons.camera_alt_outlined,
                          label: 'Post',
                        ),
                      ),
                      PopupMenuItem<int>(
                        value: 1,
                        child: CreatePopUpFields(
                          icon: Icons.circle_outlined,
                          label: 'Story',
                        ),
                      ),
                      PopupMenuItem<int>(
                          value: 2,
                          child: CreatePopUpFields(
                            icon: Icons.movie_filter_outlined,
                            label: 'Reel',
                          )),
                      PopupMenuItem<int>(
                          value: 3,
                          child: CreatePopUpFields(
                            icon: Icons.podcasts_outlined,
                            label: 'Live',
                          )),
                    ];
                  },
                  onSelected: (value) {
                    switch (value) {
                      case 0:
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    const CreatePostScreen()));
                        break;
                      case 1:
                        print('Story');
                        break;
                      case 2:
                        print('Reel');
                        break;
                      case 3:
                        print('Live');
                        break;
                    }
                  }),
            ),
          ],

          /// Tab Bar
          bottom: const TabBar(
            indicatorColor: Colors.white,
            labelStyle: kSelectedTabTextStyle,
            labelColor: kSelectedLabelColor,
            unselectedLabelStyle: kUnSelectedTabTextStyle,
            unselectedLabelColor: kUnSelectedLabelColor,
            labelPadding: EdgeInsets.zero,
            isScrollable: true,
            tabs: [
              Tab(
                text: 'Following',
              ),
              Padding(
                padding: EdgeInsets.only(left: 22.0, right: 22.0),
                child: Tab(
                  text: 'Explore',
                ),
              ),
              Padding(
                padding: EdgeInsets.only(right: 22.0),
                child: Tab(
                  text: 'Followers',
                ),
              ),
              Tab(
                text: 'Group',
              ),
            ],
          ),
        ),
        body: const TabBarView(
          children: [
            FollowingScreen(),
            ExploreScreen(),
            FollowersScreen(),
            GroupScreen(),
          ],
        ),
      ),
    );
  }
}

import 'package:creator_side/constants.dart';
import 'package:creator_side/home_module/components/post/components/create_post_add_content_bars.dart';
import 'package:creator_side/home_module/components/post/components/dropdown_child.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';

class CreatePostScreen extends StatefulWidget {
  const CreatePostScreen({Key? key}) : super(key: key);

  @override
  State<CreatePostScreen> createState() => _CreatePostScreenState();
}

// TODO: Get the actual user data and display his profile and name
class _CreatePostScreenState extends State<CreatePostScreen> {
  var dropDownItems = [
    DropdownMenuItem(
      value: '1',
      child: DropDownChild(
        icon: Icons.group,
        label: 'Followers',
      ),
    ),
    DropdownMenuItem(
      value: '2',
      child: DropDownChild(
        icon: Icons.group_add,
        label: 'Close Friends',
      ),
    ),
    DropdownMenuItem(
      value: '3',
      child: DropDownChild(
        icon: Icons.public,
        label: 'Anyone',
      ),
    ),
    DropdownMenuItem(
      value: '4',
      child: DropDownChild(
        icon: Icons.public_off,
        label: 'Private',
      ),
    ),
  ];
  String _dropDownValue = '1';
  void dropDownCallback(String? selectedValue) {
    if (selectedValue is String) {
      setState(() {
        _dropDownValue = selectedValue;
      });
    }
  }

  bool isAbleToPost = false;
  bool isVisible = true;
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 1.0,

        /// Back Button
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            IconlyLight.arrowLeft,
            color: Colors.black,
          ),
        ),

        /// Title
        title: const Text('Create Post', style: kAppBarTitleTextStyle),

        /// Post Button
        actions: [
          GestureDetector(
            onTap: () {
              setState(() {
                isAbleToPost = !isAbleToPost;
              });
            },
            child: Container(
              margin:
                  const EdgeInsets.only(right: 12.0, top: 12.0, bottom: 12.0),
              padding:
                  const EdgeInsets.symmetric(vertical: 4.0, horizontal: 14.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(4.0),
                color: isAbleToPost ? kAppThemeRed : Colors.grey[300]!,
              ),
              child: Center(
                child: Text(
                  'Post',
                  style: TextStyle(
                    fontSize: 18.0,
                    color: isAbleToPost ? Colors.white : Colors.grey,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
      body: Stack(
        children: [
          /// Profile Picture, Name and Privacy Drop-down
          Positioned(
            top: 0.0,
            child: Container(
              margin: const EdgeInsets.all(12.0),
              width: width,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  /// Profile Picture
                  const CircleAvatar(
                    radius: 32.0,
                    backgroundImage: NetworkImage(
                        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ12dDMIEyNQ4NnppnZkk4PKWDe9vH6uuT44Q&usqp=CAU'),
                  ),
                  const SizedBox(width: 16.0),

                  /// Name and Privacy Drop-down
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Nick Fury',
                        style: kUserNameTextStyle,
                      ),
                      DropdownButton(
                        items: dropDownItems,
                        value: _dropDownValue,
                        onChanged: dropDownCallback,
                        iconEnabledColor: Colors.grey,
                        iconDisabledColor: Colors.grey,
                        style: kPrivacyDropDownLabelStyle,
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
          Positioned(
            bottom: 0.0,
            child: SizedBox(
              width: width,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  IconButton(
                    onPressed: () {
                      setState(() {
                        isVisible = !isVisible;
                      });
                    },
                    icon: Icon(
                      isVisible
                          ? Icons.keyboard_arrow_down
                          : Icons.keyboard_arrow_up,
                    ),
                  ),
                  Visibility(
                    visible: isVisible,
                    child: Column(
                      children: [
                        CreatePostAddContentBars(
                            icon: Icons.photo_library_sharp,
                            label: 'Photos',
                            onTap: () {
                              // TODO: Add Photos Functionality
                            }),
                        CreatePostAddContentBars(
                            icon: Icons.videocam_rounded,
                            label: 'Video',
                            onTap: () {
                              // TODO: Add Video Functionality
                            }),
                        CreatePostAddContentBars(
                            icon: Icons.person_add_alt_1,
                            label: 'Tag People',
                            onTap: () {
                              // TODO: Tag People Functionality
                            }),
                        CreatePostAddContentBars(
                            icon: Icons.emoji_emotions_outlined,
                            label: 'Feelings/Activity',
                            onTap: () {
                              // TODO: Feelings/Activity Functionality
                            }),
                        CreatePostAddContentBars(
                            icon: Icons.location_on,
                            label: 'Add location',
                            onTap: () {
                              // TODO: Add location Functionality
                            }),
                        CreatePostAddContentBars(
                            icon: Icons.color_lens,
                            label: 'Background Color',
                            onTap: () {
                              // TODO: Add Background Color Functionality
                            }),
                        CreatePostAddContentBars(
                            icon: Icons.camera_alt_outlined,
                            label: 'Camera',
                            onTap: () {
                              // TODO: Add Camera Functionality
                            }),
                      ],
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

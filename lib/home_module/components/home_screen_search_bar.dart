import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';

import '../../constants.dart';

class HomeScreenSearchBar extends StatefulWidget {
  const HomeScreenSearchBar({Key? key}) : super(key: key);

  @override
  State<HomeScreenSearchBar> createState() => _HomeScreenSearchBarState();
}

class _HomeScreenSearchBarState extends State<HomeScreenSearchBar> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Container(
      width: width,
      margin: const EdgeInsets.fromLTRB(8.0, 16.0, 0.0, 16.0),
      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
      decoration: BoxDecoration(
        color: kHomeSearchBarBackground,
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: const [
          Icon(
            IconlyLight.search,
            color: kHomeSearchBarTextIconColor,
            size: 20.0,
          ),
          SizedBox(width: 15.0),
          Text(
            'Search',
            style: kHomeSearchBarTextStyle,
          )
        ],
      ),
    );
  }
}

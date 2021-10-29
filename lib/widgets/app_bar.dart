import 'package:tugas_mod3_kel08/pages/about.dart';
import 'package:tugas_mod3_kel08/utils/nav.dart';
import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final bool isBack;

  CustomAppBar({this.title = '', this.isBack = false});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(10, 50, 10, 10),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          this.isBack
              ? InkWell(
                  onTap: () {
                    pop(context);
                  },
                  child: Icon(Icons.arrow_back_ios),
                )
              : InkWell(
                  onTap: () {
                    print('action click');
                  },
                  child: Icon(Icons.search),
                ),
          Text(
            this.title,
            style: TextStyle(
              fontSize: 18,
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => AboutPage(),
                ),
              );
            },
            child: const CircleAvatar(
              backgroundImage: NetworkImage(
                'https://i.pinimg.com/originals/2c/c9/ab/2cc9ab79e64290961b5729bef370e568.jpg',
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Size get preferredSize => Size(double.infinity, double.maxFinite);
}

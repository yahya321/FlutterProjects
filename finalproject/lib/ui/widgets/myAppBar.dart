import 'package:flutter/material.dart';

import '../../Utilities/routes.dart';

class NavBar extends StatelessWidget implements PreferredSizeWidget {
  @override
  Widget build(BuildContext context) {
    return AppBar(
        backgroundColor: Colors.black,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            IconButton(
              icon: Icon(Icons.notifications_none_outlined),
              color: Colors.white,
              onPressed: () {
                Navigator.popUntil(
                    context, ModalRoute.withName(MyRoutes.homePage));
                Navigator.pushNamed(context, MyRoutes.notificationPage);
              },
            ),
          ],
        ));
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}

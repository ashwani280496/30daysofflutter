import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final image = "https://unsplash.com/photos/TByr08LbMek";
    return Drawer(
      child: Container(
        color: Colors.red,
        child: ListView(
          children: [
            DrawerHeader(
                padding: EdgeInsets.zero,
                child: UserAccountsDrawerHeader(
                  accountName: Text(
                    "Ashwani Kumar",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  accountEmail: Text("ashwani.cse4@gmail.com"),
                  currentAccountPicture: CircleAvatar(
                    backgroundImage: NetworkImage(
                        "https://homepages.cae.wisc.edu/~ece533/images/airplane.png"),
                  ),
                )),
            ListTile(
              leading: Icon(
                CupertinoIcons.home,
                color: Colors.white,
              ),
              title: Text(
                "Home",
                style: TextStyle(color: Colors.white),
                textScaleFactor: 1.2,
              ),
            ),
            ListTile(
              leading: Icon(
                Icons.dashboard,
                color: Colors.white,
              ),
              title: Text(
                "Dashboard",
                style: TextStyle(color: Colors.white),
                textScaleFactor: 1.2,
              ),
            ),
            ListTile(
              leading: Icon(
                CupertinoIcons.mail,
                color: Colors.white,
              ),
              title: Text(
                "Email me",
                style: TextStyle(color: Colors.white),
                textScaleFactor: 1.2,
              ),
            ),
            ListTile(
              leading: Icon(
                Icons.history_sharp,
                color: Colors.white,
              ),
              title: Text(
                "About us",
                style: TextStyle(color: Colors.white),
                textScaleFactor: 1.2,
              ),
            )
          ],
        ),
      ),
    );
  }
}

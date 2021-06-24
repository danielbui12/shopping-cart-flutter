import 'package:flutter/material.dart';

class UserInfo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _titleWrapper("User Information"),
          Container(
              alignment: Alignment.center,
              width: MediaQuery.of(context).size.width * 0.8,
              child: Divider(thickness: 1.0)),
          _userListTile(context, "Email", "example@example.com", 0),
          _userListTile(context, "Phone", "0913115560", 1),
          _userListTile(context, "Shipping adress", "Hà Đông ,Hà Nội", 2),
          _userListTile(context, "Joined Date", "12/01/2002", 3),
          // _userListTile(context, "user", "example@example.com", 4),
        ],
      ),
    );
  }

  List<IconData> _userTitleIcons = [
    Icons.email,
    Icons.phone,
    Icons.local_shipping,
    Icons.watch_later,
    Icons.exit_to_app_rounded
  ];

  _userListTile(
      BuildContext context, String title, String subtitle, int index) {
    return Material(
        color: Colors.transparent,
        child: InkWell(
          splashColor: Theme.of(context).splashColor,
          child: ListTile(
              title: Text(title),
              subtitle: Text(subtitle),
              leading: Icon(_userTitleIcons[index])),
          onTap: () {},
        ));
  }

  _titleWrapper(String title) {
    return Padding(
      padding: const EdgeInsets.only(left: 8.0),
      child: Text(
        title,
        style: TextStyle(fontSize: 26.0, fontWeight: FontWeight.bold),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:list_tile_switch/list_tile_switch.dart';
import 'package:myapp/const/Colors.dart';
import 'package:myapp/provider/darkTheme.dart';
import 'package:provider/provider.dart';

String url =
    "https://thumbs.dreamstime.com/b/default-avatar-profile-icon-vector-social-media-user-portrait-176256935.jpg";

class UserInfo extends StatefulWidget {
  @override
  _UserInfoState createState() => _UserInfoState();
}

class _UserInfoState extends State<UserInfo> {
  var icon = Icons.dark_mode;
  String switchMode = "Dark Mode";
  ScrollController _scrollController = ScrollController();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _scrollController = ScrollController();
    _scrollController.addListener(() {
      setState(() {});
    });
  }

  var top = 0.0;
  @override
  Widget build(BuildContext context) {
    var themeChange = Provider.of<DarkThemeProvider>(context);
    return Scaffold(
        body: Stack(
      children: [
        CustomScrollView(
          controller: _scrollController,
          slivers: <Widget>[
            SliverAppBar(
              automaticallyImplyLeading: false,
              elevation: 4.0,
              expandedHeight: 200.0,
              pinned: true,
              flexibleSpace: LayoutBuilder(
                builder: (BuildContext context, BoxConstraints constraints) {
                  top = constraints.biggest.height;
                  return Container(
                    decoration: BoxDecoration(
                        gradient: LinearGradient(
                            colors: [
                              ColorsConsts.starterColor,
                              ColorsConsts.endColor
                            ],
                            begin: const FractionalOffset(0.0, 0.0),
                            end: const FractionalOffset(1.0, 0.0),
                            stops: [0.0, 1.0],
                            tileMode: TileMode.clamp)),
                    child: FlexibleSpaceBar(
                      collapseMode: CollapseMode.parallax,
                      centerTitle: true,
                      title: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          AnimatedOpacity(
                            opacity: top <= 110.0 ? 1.0 : 0,
                            duration: Duration(milliseconds: 300),
                            child: Row(
                              children: <Widget>[
                                SizedBox(
                                  width: 12,
                                ),
                                Container(
                                    height: kToolbarHeight / 1.8,
                                    width: kToolbarHeight / 1.8,
                                    decoration: BoxDecoration(
                                      boxShadow: [
                                        BoxShadow(color: Colors.white),
                                      ],
                                      shape: BoxShape.circle,
                                      image: DecorationImage(
                                          fit: BoxFit.fill,
                                          image: NetworkImage(url)),
                                    )),
                                SizedBox(
                                  width: 12,
                                ),
                                Text("Guest",
                                    style: TextStyle(
                                      fontSize: 20.0,
                                      color: Colors.white,
                                    )),
                              ],
                            ),
                          )
                        ],
                      ),
                      background: Image(
                        fit: BoxFit.cover,
                        image: NetworkImage(url),
                      ),
                    ),
                  );
                },
              ),
            ),
            SliverToBoxAdapter(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _titleWrapper("User Information"),
                  Container(
                      alignment: Alignment.centerRight,
                      width: MediaQuery.of(context).size.width * 0.8,
                      child: Divider(thickness: 1.0)),
                  _userListTile(context, "Email", "example@example.com", 0),
                  _userListTile(context, "Phone", "0913115560", 1),
                  _userListTile(
                      context, "Shipping adress", "Hà Đông ,Hà Nội", 2),
                  _userListTile(
                      context, "Shipping adress", "Hà Đông ,Hà Nội", 2),
                  _userListTile(
                      context, "Shipping adress", "Hà Đông ,Hà Nội", 2),
                  _userListTile(
                      context, "Shipping adress", "Hà Đông ,Hà Nội", 2),
                  _userListTile(
                      context, "Shipping adress", "Hà Đông ,Hà Nội", 2),
                  _userListTile(context, "Joined Date", "12/01/2002", 3),
                  _titleWrapper("User Setting"),
                  Container(
                      alignment: Alignment.centerRight,
                      width: MediaQuery.of(context).size.width * 0.8,
                      child: Divider(thickness: 1.0)),
                  ListTileSwitch(
                    value: themeChange.darkTheme,
                    leading: Icon(icon),
                    onChanged: (value) {
                      setState(() {
                        themeChange.darkTheme = value;
                        if (icon != Icons.light_mode)
                          icon = Icons.light_mode;
                        else
                          icon = Icons.dark_mode;

                        if (switchMode == "Dark Mode")
                          switchMode = "Light Mode";
                        else
                          switchMode = "Dark Mode";
                      });
                    },
                    visualDensity: VisualDensity.comfortable,
                    switchType: SwitchType.cupertino,
                    switchActiveColor: Colors.indigo,
                    title: Text(switchMode),
                  ),
                  _userListTile(context, "Logout", "", 4),
                ],
              ),
            )
          ],
        ),
        _buildFab()
      ],
    ));
  }

  _buildFab() {
    //start position
    final double defaultTopMargin = 180.0 - 4.0;
    final double scaleStart = 160.0;
    final double scaleEnd = scaleStart / 2.0;
    double top = defaultTopMargin;
    double scale = 1.0;

    if (_scrollController.hasClients) {
      double offset = _scrollController.offset;
      top -= offset;
      if (offset < defaultTopMargin - scaleStart) {
        scale = 1.0;
      } else if (offset < defaultTopMargin - scaleEnd) {
        scale = (defaultTopMargin - scaleEnd - offset) / scaleEnd;
      } else {
        scale = 0;
      }
    }

    return Positioned(
        top: top,
        right: 16.0,
        child: Transform(
          transform: Matrix4.identity()..scale(scale),
          alignment: Alignment.center,
          child: FloatingActionButton(
            backgroundColor: Colors.purple[700],
            heroTag: "btn1",
            child: Icon(Icons.camera_alt_outlined),
            onPressed: () {},
          ),
        ));
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
    return Container(
      margin: const EdgeInsets.all(8.0),
      padding: const EdgeInsets.only(left: 16.0),
      child: Text(
        title,
        style: TextStyle(fontSize: 26.0, fontWeight: FontWeight.bold),
      ),
    );
  }
}

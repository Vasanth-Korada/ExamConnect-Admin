import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:oepadmin/common/widgets/text-widget.dart';
import 'package:url_launcher/url_launcher.dart';

class DrawerWidget extends StatefulWidget {
  final String username;

  DrawerWidget({required this.username});

  @override
  _DrawerWidgetState createState() => _DrawerWidgetState();
}

class _DrawerWidgetState extends State<DrawerWidget> {
  String welcomeMessage = "Loading ...";

  @override
  void initState() {
    super.initState();
    fetchWelcomeMessage();
  }

  _rateUsLink() async {
    var url =
        'https://play.google.com/store/apps/details?id=com.vktech.talent_connect';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  fetchWelcomeMessage() async {}

  _waGroupLink() async {}

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Drawer(
        child: ListView(
          children: <Widget>[
            SizedBox(
              height: 25,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: const <Widget>[
                CircleAvatar(
                  backgroundColor: Color(0XFFf9fafd),
                  minRadius: 70,
                  maxRadius: 100,
                  backgroundImage: AssetImage("assets/images/new_logo.png"),
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            const Divider(),
            Card(
              margin: const EdgeInsets.all(8.0),
              color: Colors.indigo[500],
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0)),
              child: ListTile(
                title: PrimaryTextWidget(
                  content: "Hi " +
                      widget.username.toString().split(" ")[0] +
                      " 😃\n$welcomeMessage",
                  color: Colors.white,
                  fontSize: 12,
                ),
              ),
            ),
            ListTile(
              onTap: () {
                _rateUsLink();
              },
              leading: Icon(Icons.star_border_outlined),
              title: HeaderTextWidget(
                content: "Rate Us",
              ),
            ),
            ListTile(
              onTap: () {
                Navigator.pushNamed(context, "/resourcesPage");
              },
              leading: Icon(Icons.youtube_searched_for_outlined),
              title: HeaderTextWidget(
                content: "Resources",
              ),
            ),
            ListTile(
              onTap: () {
                _waGroupLink();
              },
              leading: Icon(Icons.chat_outlined),
              title: HeaderTextWidget(
                content: "Community Group",
              ),
            ),
            ListTile(
              onTap: () => {},
              leading: Icon(Icons.info_outline),
              title: HeaderTextWidget(
                content: "About Us",
              ),
            ),
          ],
        ),
      ),
    );
  }
}

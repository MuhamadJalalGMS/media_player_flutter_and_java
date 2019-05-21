import 'package:flutter/material.dart';
import 'package:media_player/screens/albums.dart';
import 'package:media_player/screens/more_routes.dart';
import 'package:media_player/screens/search.dart';
import 'package:media_player/screens/tracks.dart';
import 'package:media_player/screens/videos.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'app_localization/app_localization.dart';
import 'values.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  var title;

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: [
        AppLocalizationsDelegate(),
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate
      ],
      supportedLocales: [Locale("en"), Locale("ar")],
      onGenerateTitle: (BuildContext context) {
        // assign a string value to the title here to avoid getting null context exception
        title = AppLocalizations.of(context).title;
        return AppLocalizations.of(context).title;
      },
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primaryColor: primaryOrange, splashColor: primaryOrange),
      home: MyHomePage(title: title),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  /// here add a condition to check which widget should appear
  Widget bodyWidget = Container();

  _bottomNavItem(IconData icon, Widget screen) {
    return InkWell(
      child: Icon(
        icon,
        size: 35,
        color: Colors.white,
      ),
      onTap: () {
        setState(() {
          bodyWidget = screen;
        });
//        Navigator.of(context)
//            .push(MaterialPageRoute(builder: (context) => screen));
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context).title),
        actions: <Widget>[
          Container(
            child: Row(
              children: <Widget>[
                IconButton(
                    icon: Icon(
                      Icons.search,
                      color: Colors.white,
                    ),
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => SearchList()));
                    }),
              ],
            ),
          )
        ],
        leading: Icon(Icons.album),
      ),
      /// todo replace body Center with custom widget and aAdding onBACKPRESSED to navigate to the bio
      body: bodyWidget,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: Colors.white,
        child: Container(
          padding: EdgeInsets.all(5.0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(50.0)),
            color: primaryOrange,
          ),
          child: Icon(
            Icons.play_circle_filled,
          ),
        ),
        elevation: 5.0,
//        mini: true,
      ),
      bottomNavigationBar: BottomAppBar(
        color: primaryOrange,
        child: Container(
          padding: EdgeInsets.all(8.0),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              _bottomNavItem(Icons.queue_music, tracksScreen()),
              _bottomNavItem(Icons.album, albumsScreen()),
              Container(
                height: 35,
              ),
              _bottomNavItem(Icons.video_library, videosScreen()),
              _bottomNavItem(Icons.menu, MoreItems()),
            ],
          ),
        ),
        shape: CircularNotchedRectangle(),
//        notchMargin: 8.5,
      ),
    );
  }
}

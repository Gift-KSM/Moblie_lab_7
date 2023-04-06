import 'package:flutter/material.dart';
import 'package:flutter_application_4_2_widget2/favorites_page.dart';
import 'package:flutter_application_4_2_widget2/form_screen.dart';
import 'package:flutter_application_4_2_widget2/neon_button.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'favorites_page.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Neon Light Button',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: const MyHomePage(title: 'Neon Light Button'),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  // bool isPressed = false;
  int index = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return FromScreen();
                }));
              },
              icon: Icon(Icons.add))
        ],
      ),
      backgroundColor: Colors.greenAccent,
      drawer: NavigationDrawer(),
      body: Center(
          child: Text('$index',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 120,
                  fontWeight: FontWeight.bold))),

      bottomNavigationBar: Theme(
        data: Theme.of(context).copyWith(
            iconTheme: IconThemeData(color: Color.fromARGB(255, 255, 39, 129))),
        child: CurvedNavigationBar(
          index: index,
          height: 60.0,
          items: <Widget>[
            Icon(Icons.home, size: 30),
            Icon(Icons.search, size: 30),
            Icon(Icons.favorite, size: 30),
            Icon(Icons.settings, size: 30),
            Icon(Icons.percent, size: 30),
          ],
          color: Colors.white,
          buttonBackgroundColor: Colors.blue.shade200,
          backgroundColor: Colors.transparent,
          animationCurve: Curves.easeInOut,
          animationDuration: Duration(milliseconds: 600),
          onTap: (index) {
            setState(() {
              this.index = index;
            });
          },
          letIndexChange: (index) => true,
        ),
      ),
      // backgroundColor: Colors.black,
      // drawer: NavigationDrawer(),
      // body: Center(
      //     child: Column(
      //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      //   children: [
      //     NeonButton(Colors.red),
      //     NeonButton(Colors.greenAccent.shade700),
      //     NeonButton(Colors.blueAccent.shade700),
      //     NeonButton(Colors.yellowAccent.shade700),
      //     NeonButton(Colors.blue),
      //     NeonButton(Colors.white),
      //     Listener(
      //         onPointerDown: (e) => setState(() {
      //               isPressed = true;
      //             }),
      //         onPointerUp: (e) => setState(() {
      //               isPressed = false;
      //             }),
      //         child: Container(
      //             decoration: BoxDecoration(
      //                 borderRadius: BorderRadius.circular(10),
      //                 boxShadow: [
      //                   for (double i = 1; i < 5; i++)
      //                     BoxShadow(
      //                         // color: shadowColor,
      //                         blurRadius: (isPressed ? 5 : 3) * i,
      //                         blurStyle: BlurStyle.outer),
      //                 ]),
      //             child: SpinKitCircle(
      //               size: 140,
      //               itemBuilder: ((context, index) {
      //                 final colors = [
      //                   Colors.green,
      //                   Colors.red,
      //                   Colors.yellow
      //                 ];
      //                 final color = colors[index % colors.length];
      //                 return DecoratedBox(
      //                     decoration: BoxDecoration(
      //                         color: color, shape: BoxShape.circle));
      //               }),
      //             )
      // child: TextButton(
      //   onHover: (hovered) => setState(() {
      //     isPressed = hovered;
      //   }),
      //   style: TextButton.styleFrom(
      //       side: BorderSide(color: Colors.white, width: 4),
      //       shape: RoundedRectangleBorder(
      //           borderRadius: BorderRadius.circular(10))),
      //   onPressed: () {},
      //   child: Padding(
      //     padding: EdgeInsets.all(8.0),
      //     child: Text(
      //       'Neon Button',
      //       style: TextStyle(
      //           fontSize: 30,
      //           color: Colors.white,
      //           shadows: [
      //             Shadow(color: shadowColor, blurRadius: 3),
      //             Shadow(color: shadowColor, blurRadius: 6),
      //             Shadow(color: shadowColor, blurRadius: 9),
      //             for (double i = 1; i < (isPressed ? 8 : 4); i++)
      //               Shadow(blurRadius: 3 * i),
      //           ]),
      //     ),
      //   ))
      //             )),
      //   ],
    ); // )));
  }
}

class NavigationDrawer extends StatelessWidget {
  const NavigationDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            buildHeader(context),
            buildMenuItems(context),
          ],
        ),
      ),
    );
  }
}

Widget buildHeader(BuildContext context) => Container(
      color: Colors.green.shade700,
      padding: EdgeInsets.only(
        top: 24 * MediaQuery.of(context).padding.top,
        bottom: 24,
      ),
      child: Column(children: [
        CircleAvatar(
          radius: 52,
          backgroundImage: const NetworkImage(
              'data:image/jpeg;base64,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'),
        ),
        SizedBox(height: 12),
        Text('Flutter Dev',
            style: TextStyle(fontSize: 28, color: Colors.white)),
        Text('Flutter@Dev.com',
            style: TextStyle(fontSize: 16, color: Colors.white))
      ]),
    );

Widget buildMenuItems(BuildContext context) => Container(
      padding: EdgeInsets.all(24),
      child: Wrap(
        runSpacing: 16,
        children: [
          ListTile(
            leading: Icon(Icons.home_outlined),
            title: Text('Home'),
            onTap: (() {
              Navigator.of(context).pushReplacement(MaterialPageRoute(
                  builder: (context) => MyHomePage(title: 'Home Page')));
            }),
          ),
          ListTile(
            leading: Icon(Icons.favorite_border),
            title: Text('Favourites'),
            onTap: () {
              Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => FavouritesPage()));
            },
          ),
          ListTile(
            leading: Icon(Icons.workspaces_outline),
            title: Text('Workflow'),
            onTap: () {},
          ),
          ListTile(
            leading: Icon(Icons.update),
            title: Text('Updates'),
            onTap: () {},
          ),
          Divider(color: Colors.black54),
          ListTile(
            leading: Icon(Icons.account_tree_outlined),
            title: Text('Plugins'),
            onTap: () {},
          ),
          ListTile(
            leading: Icon(Icons.notifications_outlined),
            title: Text('Notification'),
            onTap: () {},
          )
        ],
      ),
    );

class LoadingPage extends StatelessWidget {
  const LoadingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SpinKitCircle(
        size: 140,
        itemBuilder: (context, index) {
          final colors = [Colors.green, Colors.red, Colors.yellow];
          final color = colors[index % colors.length];
          return DecoratedBox(
              decoration: BoxDecoration(color: color, shape: BoxShape.circle));
        },
      ),
    );
  }
}


import 'package:flutter/material.dart';
import 'package:my_mess_book_app/common_widgets/HexaClr.dart';
import 'package:my_mess_book_app/common_widgets/platform_alert_dialog.dart';
import 'package:my_mess_book_app/services/auth.dart';
import 'package:provider/provider.dart';

Future<void> _signOut(BuildContext context) async {
  try {
    final auth = Provider.of<AuthBase>(context);
    await auth.signOut();
  } catch (e) {
    print(e.toString());
  }
}

Future<void> _confirmSignOut(BuildContext context) async {
  final didRequestSignOut = await PlatformAlertDialog(
    title: 'Logout',
    content: 'Are you sure that you want to logout?',
    cancelActionText: 'Cancel',
    defaultActionText: 'Logout',
  ).show(context);
  if (didRequestSignOut == true) {
    _signOut(context);
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DefaultTabController(
        length: choices.length,
        child: Scaffold(
          backgroundColor: Colors.grey[200],
          appBar: AppBar(
            actions: [
              IconButton(icon: Icon(Icons.exit_to_app), onPressed:()=> _confirmSignOut(context))

            ],
            iconTheme: new IconThemeData(color: Colors.white),
            backgroundColor: HexColor("#000033"),
            elevation: 0.5,
            centerTitle: true,
            title: const Text(
              'My Messbook',
              style: TextStyle(
                  color: Colors.white, fontWeight: FontWeight.w700),
            ),
            bottom: TabBar(
              indicatorSize: TabBarIndicatorSize.tab,
              unselectedLabelColor: Colors.white,
              indicatorColor: Colors.white,
              labelColor: Colors.white,
              isScrollable: true,
              tabs: choices.map<Widget>((Choice choice) {
                return Tab(
                  iconMargin: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                  text: choice.title,
                  icon: Icon(choice.icon,size: 25,),
                );
              }).toList(),
            ),
          ),
          body: TabBarView(
            children: choices.map((Choice choice) {
              return Padding(
                padding: const EdgeInsets.all(8),
                child: ChoicePage(
                  choice: choice,
                ),
              );
            }).toList(),
          ),
        ),
      ),
    );
  }
}

class Choice {
  final String title;
  final IconData icon;

  const Choice({this.title, this.icon});
}

const List<Choice> choices = <Choice>[
  Choice(title: 'Home', icon: Icons.home),
  Choice(title: 'Mess off', icon: Icons.date_range),
  Choice(title: 'Payments', icon: Icons.payment),
  Choice(title: 'My Account', icon: Icons.account_circle),
];

class ChoicePage extends StatelessWidget {
  const ChoicePage({Key key, this.choice}) : super(key: key);
  final Choice choice;

  @override
  Widget build(BuildContext context) {
    // ignore: deprecated_member_use
    final TextStyle textStyle = Theme.of(context).textTheme.display1;
    return Card(
      color: Colors.white,
      elevation: 0.5,
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Icon(
              choice.icon,
              size: 150.0,
              color: HexColor("#000033"),
            ),
            Text(
              choice.title,
              style: TextStyle(
                color: HexColor("#000033"),
                fontSize: 40,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

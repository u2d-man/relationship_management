import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MenuScreen extends StatelessWidget {
  static const String menu = '/menu';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text('Menu'),
      ),
      body: SafeArea(
        child: Column(
          children: <Widget>[
            ListTile(
              leading: Icon(Icons.verified_user),
              title: Text('プライバシーポリシー'),
              onTap: () {

              },
            ),
            ListTile(
              leading: Icon(Icons.pan_tool),
              title: Text('使い方'),
              onTap: () {

              },
            ),
            ListTile(
              leading: Icon(Icons.power_settings_new),
              title: Text('ログアウト'),
              onTap: () {
                _showSignOutDialog(context);
              },
            )
          ],
        ),
      ),
    );
  }
}

void _showSignOutDialog(BuildContext context) {
  showDialog(
      context: context,
      builder: (BuildContext context) {
        return CupertinoAlertDialog(
          title: Text('ログアウトしますか？'),
          content: Text('データは消えません。'),
          actions: <Widget>[
            CupertinoDialogAction(
              child: Text('戻る'),
              onPressed: () {

              },
            ),
            CupertinoDialogAction(
              child: Text('ログアウト'),
              onPressed: () {

              },
            ),
          ],
        );
      }
  );
}

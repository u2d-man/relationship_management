import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:relationship_management/src/controllers/items_controller.dart';

class ItemModal extends StatelessWidget {
  final DocumentSnapshot item;
  ItemModal({@required this.item});

  @override
  Widget build(BuildContext context) {
    // String displayItemSum = this.item['name'];
    DateFormat formatter = DateFormat('yyyy/MM/dd');
    String formattedDateOpened =
        formatter.format(DateTime.parse(this.item['time'].toDate().toString()));

    return Center(
      child: Container(
        height: 450,
        margin: EdgeInsets.only(left: 20, right: 20),
        decoration: BoxDecoration(
          color: Theme.of(context).backgroundColor,
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Stack(
          fit: StackFit.expand,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: Column(
                children: <Widget>[
                  SizedBox(height: 20),

                  Text(
                    this.item['categoryKey'] == true
                        ? '${this.item['categoryKey']}'
                        : '',
                  ),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        this.item['name'],
                        style: Theme.of(context).textTheme.subtitle,
                      ),
                      // todo: ボタン化する
                      Icon(
                          Icons.star
                      ),
                    ],
                  ),

                  SizedBox(height: 20),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        'Hobby',
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 30,
                            fontWeight: FontWeight.bold
                        ),
                      ),
                    ],
                  ),

                  SizedBox(height: 10),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        '${this.item['hobby']}',
                      ),
                    ],
                  ),

                  SizedBox(height: 220),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      FlatButton(
                        child: Text(
                            '編集'
                        ),
                        onPressed: () {
                          // todo: 予めデータがある場合の編集画面を作る
                        },
                      ),

                      RaisedButton(
                        child: Text(
                            '削除'
                        ),
                        onPressed: () {
                          ItemsController.deleteItem(this.item.documentID);
                          Navigator.pop(context);
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:relationship_management/src/controllers/items_controller.dart';
import 'package:relationship_management/src/providers/filter_state.dart';
import 'package:relationship_management/src/ui/widgets/items_grid.dart';
import 'package:relationship_management/src/ui/widgets/items_info.dart';
import 'package:relationship_management/src/ui/widgets/loader.dart';

class ItemsContainer extends StatefulWidget {
  @override
  _ItemContainerState createState() => _ItemContainerState();
}

class _ItemContainerState extends State<ItemsContainer> {
  int currentPageIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Consumer<QuerySnapshot>(
      builder: (context, itemsData, child) {
        if (itemsData == null)
          return Center(
            child: Loader(),
          );
        else
          return ChangeNotifierProvider<FilterState>(
            create: (context) => FilterState(),
            child: Column(
              children: <Widget>[
                ItemsInfo(
                  ItemsController.filterAllItems(itemsData.documents)
                ),
                Expanded(
                  child: PageView(
                    onPageChanged: (int page) {
                      setState(() {
                        currentPageIndex = page;
                      });
                    },
                    physics: ClampingScrollPhysics(),
                    children: <Widget>[ItemsGrid(true)],
                  ),
                )
              ],
            ),
          );
      },
    );
  }
}

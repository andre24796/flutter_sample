import 'package:flutter/material.dart';
import 'package:flutter_app/stores/issue_store.dart';
import 'package:provider/provider.dart';

class PaginationNavigator extends StatefulWidget {
  @override
  _PaginationNavigatorState createState() => _PaginationNavigatorState();
}

class _PaginationNavigatorState extends State<PaginationNavigator> {
  @override
  Widget build(BuildContext context) {
    final issueStore = Provider.of<IssueStore>(context);
    return Stack(
      children: [
        if (issueStore.isPrevAvailable)
          Positioned(
            left: 10,
            child: RaisedButton(
              child: Text('PREV'),
              onPressed: issueStore.loadPrevPage,
            ),
          ),
        if (issueStore.isNextAvailable)
          Positioned(
            right: 10,
            child: RaisedButton(
              child: Text('NEXT'),
              onPressed: issueStore.loadNextPage,
            ),
          ),
        Center(
          child: Container(
            height: 30,
            width: 30,
            decoration: BoxDecoration(
              color: Colors.lightBlue,
              borderRadius: BorderRadius.circular(15),
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                '${issueStore.pageNumber}',
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

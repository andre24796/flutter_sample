import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/backend_api/models/issue.dart';

class ListIssueItem extends StatefulWidget {
  const ListIssueItem({
    @required this.issue,
    @required this.isSelected,
    Key key,
  }) : super(key: key);
  final Issue issue;
  final isSelected;

  @override
  _ListIssueItemState createState() => _ListIssueItemState();
}

class _ListIssueItemState extends State<ListIssueItem> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: widget.isSelected ? Colors.blueGrey : Colors.white,
      padding: EdgeInsets.all(8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Flexible(
            flex: 1,
            child: Container(
              child: CachedNetworkImage(
                imageUrl: widget.issue.user.avatarUrl,
              ),
            ),
          ),
          SizedBox(
            width: 20,
          ),
          Flexible(
            flex: 3,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    '${widget.issue.issueTitle}',
                    maxLines: 3,
                    style: TextStyle(fontSize: 15),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    left: 8.0,
                    right: 8.0,
                    bottom: 8.0,
                  ),
                  child: Text(
                    '${widget.issue.issueId}',
                    maxLines: 3,
                    style: TextStyle(fontSize: 12),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

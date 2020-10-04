import 'package:flutter/material.dart';
import 'package:flutter_app/components/list_issue_item.dart';
import 'package:flutter_app/components/pagination_navigator.dart';
import 'package:flutter_app/stores/issue_store.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:provider/provider.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  IssueStore _issueStore = IssueStore();
  @override
  void initState() {
    super.initState();
    _issueStore.getIssueList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        actions: [
          IconButton(
            icon: Icon(Icons.refresh),
            onPressed: () => _issueStore.getIssueList(),
          )
        ],
      ),
      body: Container(
        color: Colors.white,
        child: Center(
          child: Observer(
            builder: (_) {
              final selectedItem = _issueStore.selectedPosition;
              final listIssue = _issueStore.issueList;
              return ModalProgressHUD(
                progressIndicator: CircularProgressIndicator(),
                inAsyncCall: _issueStore.isLoading,
                child: Column(
                  children: [
                    Expanded(
                      child: Stack(
                        children: [
                          (listIssue != null && listIssue.isNotEmpty)
                              ? RefreshIndicator(
                                  onRefresh: _issueStore.getIssueList,
                                  child: ListView.builder(
                                    itemCount: listIssue.length,
                                    itemBuilder: (_, i) {
                                      final issue = listIssue[i];
                                      final isSelected = selectedItem == i;
                                      return GestureDetector(
                                        child: ListIssueItem(
                                          issue: issue,
                                          isSelected: isSelected,
                                        ),
                                        onTap: () {
                                          if (i ==
                                              _issueStore.selectedPosition) {
                                            _issueStore.selectItem(-1);
                                          } else {
                                            _issueStore.selectItem(i);
                                          }
                                        },
                                      );
                                    },
                                  ),
                                )
                              : Container(
                                  child: Center(
                                    child: Padding(
                                      padding: const EdgeInsets.all(30.0),
                                      child: Text(
                                        'Can not load any issue. Please check your internet connection',
                                        maxLines: 2,
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          fontSize: 25,
                                          color: Colors.black45,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                        ],
                      ),
                    ),
                    Container(
                      height: 50,
                      child: Provider<IssueStore>.value(
                        value: _issueStore,
                        child: PaginationNavigator(),
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}

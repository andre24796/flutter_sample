import 'package:flutter_app/backend_api/models/issue.dart';
import 'package:flutter_app/backend_api/requests/get_issues.dart';
import 'package:flutter_app/utils/others.dart';
import 'package:mobx/mobx.dart';

part 'issue_store.g.dart';

class IssueStore = _IssueStore with _$IssueStore;

abstract class _IssueStore with Store {
  @observable
  bool isLoading = false;

  @observable
  int selectedPosition = -1;

  @observable
  int pageNumber = 1;

  @observable
  List<Issue> issueList;

  @observable
  bool isNextAvailable = false;

  @observable
  bool isPrevAvailable = false;

  static const String MAX_PER_PAGE = '5';

  @action
  void loadNextPage() {
    pageNumber = pageNumber + 1;
    getIssueList();
  }

  @action
  void loadPrevPage() {
    pageNumber = pageNumber - 1;
    getIssueList();
  }

  @action
  void selectItem(int position) {
    selectedPosition = position;
  }

  @action
  Future getIssueList() async {
    isLoading = true;
    final request = await GetIssueRequest(
            pageNumber: pageNumber.toString(), maxPerPage: MAX_PER_PAGE)
        .sendRequest();
    final nextRequest = await GetIssueRequest(
            pageNumber: (pageNumber + 1).toString(), maxPerPage: MAX_PER_PAGE)
        .sendRequest();
    final prevRequest = await GetIssueRequest(
            pageNumber: (pageNumber - 1).toString(), maxPerPage: MAX_PER_PAGE)
        .sendRequest();
    if (request.isSuccess) {
      issueList = List<Issue>.from(request.getResponse);
      isNextAvailable = nextRequest.getResponse.toList().isNotEmpty;
      isPrevAvailable =
          pageNumber > 1 && prevRequest.getResponse.toList().isNotEmpty;
    } else {
      DevLog.getLogger().logError(
          'Get issue list error - Status code ${request.getStatusCode}');
      issueList = [];
      isNextAvailable = true;
      isPrevAvailable = pageNumber > 1;
    }
    selectedPosition = -1;
    isLoading = false;
  }
}

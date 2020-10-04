// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'issue_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$IssueStore on _IssueStore, Store {
  final _$isLoadingAtom = Atom(name: '_IssueStore.isLoading');

  @override
  bool get isLoading {
    _$isLoadingAtom.reportRead();
    return super.isLoading;
  }

  @override
  set isLoading(bool value) {
    _$isLoadingAtom.reportWrite(value, super.isLoading, () {
      super.isLoading = value;
    });
  }

  final _$selectedPositionAtom = Atom(name: '_IssueStore.selectedPosition');

  @override
  int get selectedPosition {
    _$selectedPositionAtom.reportRead();
    return super.selectedPosition;
  }

  @override
  set selectedPosition(int value) {
    _$selectedPositionAtom.reportWrite(value, super.selectedPosition, () {
      super.selectedPosition = value;
    });
  }

  final _$pageNumberAtom = Atom(name: '_IssueStore.pageNumber');

  @override
  int get pageNumber {
    _$pageNumberAtom.reportRead();
    return super.pageNumber;
  }

  @override
  set pageNumber(int value) {
    _$pageNumberAtom.reportWrite(value, super.pageNumber, () {
      super.pageNumber = value;
    });
  }

  final _$issueListAtom = Atom(name: '_IssueStore.issueList');

  @override
  List<Issue> get issueList {
    _$issueListAtom.reportRead();
    return super.issueList;
  }

  @override
  set issueList(List<Issue> value) {
    _$issueListAtom.reportWrite(value, super.issueList, () {
      super.issueList = value;
    });
  }

  final _$isNextAvailableAtom = Atom(name: '_IssueStore.isNextAvailable');

  @override
  bool get isNextAvailable {
    _$isNextAvailableAtom.reportRead();
    return super.isNextAvailable;
  }

  @override
  set isNextAvailable(bool value) {
    _$isNextAvailableAtom.reportWrite(value, super.isNextAvailable, () {
      super.isNextAvailable = value;
    });
  }

  final _$isPrevAvailableAtom = Atom(name: '_IssueStore.isPrevAvailable');

  @override
  bool get isPrevAvailable {
    _$isPrevAvailableAtom.reportRead();
    return super.isPrevAvailable;
  }

  @override
  set isPrevAvailable(bool value) {
    _$isPrevAvailableAtom.reportWrite(value, super.isPrevAvailable, () {
      super.isPrevAvailable = value;
    });
  }

  final _$getIssueListAsyncAction = AsyncAction('_IssueStore.getIssueList');

  @override
  Future<dynamic> getIssueList() {
    return _$getIssueListAsyncAction.run(() => super.getIssueList());
  }

  final _$_IssueStoreActionController = ActionController(name: '_IssueStore');

  @override
  void loadNextPage() {
    final _$actionInfo = _$_IssueStoreActionController.startAction(
        name: '_IssueStore.loadNextPage');
    try {
      return super.loadNextPage();
    } finally {
      _$_IssueStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void loadPrevPage() {
    final _$actionInfo = _$_IssueStoreActionController.startAction(
        name: '_IssueStore.loadPrevPage');
    try {
      return super.loadPrevPage();
    } finally {
      _$_IssueStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void selectItem(int position) {
    final _$actionInfo = _$_IssueStoreActionController.startAction(
        name: '_IssueStore.selectItem');
    try {
      return super.selectItem(position);
    } finally {
      _$_IssueStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
isLoading: ${isLoading},
selectedPosition: ${selectedPosition},
pageNumber: ${pageNumber},
issueList: ${issueList},
isNextAvailable: ${isNextAvailable},
isPrevAvailable: ${isPrevAvailable}
    ''';
  }
}

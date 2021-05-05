import 'package:flutter_app_bloc_dio/managers/api_service/localized_document/api_localized_document_provider.dart';
import 'package:rxdart/rxdart.dart';

class LocalizedListBloc {
  final BehaviorSubject<String> _behaviorSubject = BehaviorSubject<String>.seeded("");
  BehaviorSubject<String> get behaviorSubject => _behaviorSubject;
  fetchLocalizedDocument(){
    APILocalizedDocumentProvider().fetchLocalizedDocument().then((value) {
      _behaviorSubject.sink.add("done");
    });
  }
  dispose(){
    _behaviorSubject.close();
  }
}
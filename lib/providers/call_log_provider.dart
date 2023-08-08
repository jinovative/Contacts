import 'package:flutter/foundation.dart';
import 'package:contact/models/call_log.dart';

class CallLogProvider with ChangeNotifier {
  List<CallLog> _callLogs = [];

  List<CallLog> get callLogs => _callLogs;

  void addCallLog(String contactName, String time, CallType callType) {
    _callLogs.add(CallLog(contactName: contactName, time: time, callType: callType));
    notifyListeners();
  }


}

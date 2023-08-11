import 'package:flutter/foundation.dart';
import 'package:contact/models/call_log.dart';

class CallLogProvider with ChangeNotifier {
  List<CallLog> _callLogs = [];

  List<CallLog> get callLogs => _callLogs;

  void addCallLog({required String contactName, required String time, required CallType callType}) {
    _callLogs.add(CallLog(contactName: contactName, time: time, callType: callType));
    notifyListeners();
  }

}

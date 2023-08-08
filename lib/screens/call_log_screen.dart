import 'package:flutter/material.dart';

class CallLogScreen extends StatelessWidget {
  final List<CallLog> callLogs = [
    CallLog(contactName: 'Alice', time: '오전 10:30', callType: CallType.incoming),
    CallLog(contactName: 'Bob', time: '오후 3:15', callType: CallType.missed),
    // 여기에 더 많은 통화 기록 추가
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('통화 기록'),
      ),
      body: ListView.builder(
        itemCount: callLogs.length,
        itemBuilder: (context, index) {
          final callLog = callLogs[index];
          return ListTile(
            leading: Icon(callLog.callType.icon),
            title: Text(callLog.contactName),
            subtitle: Text(callLog.time),
            onTap: () {
              // 통화 기록 상세 화면으로 이동하거나 다른 동작 수행
            },
          );
        },
      ),
    );
  }
}

class CallLog {
  final String contactName;
  final String time;
  final CallType callType;

  CallLog({required this.contactName, required this.time, required this.callType});
}

enum CallType {
  incoming,
  outgoing,
  missed,
}

extension CallTypeExtension on CallType {
  IconData get icon {
    switch (this) {
      case CallType.incoming:
        return Icons.call_received;
      case CallType.outgoing:
        return Icons.call_made;
      case CallType.missed:
        return Icons.call_missed;
      default:
        return Icons.call;
    }
  }
}

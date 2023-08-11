import 'package:contact/models/call_log.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/call_log_provider.dart';

class CallLogScreen extends StatelessWidget {
  final List<CallLog> callLogs = [
  ];

  @override
  Widget build(BuildContext context) {
    // CallLogProvider의 인스턴스에 액세스
    final callLogProvider = Provider.of<CallLogProvider>(context);
    // CallLogProvider에서 통화 기록 가져오기
    final callLogs = callLogProvider.callLogs;

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

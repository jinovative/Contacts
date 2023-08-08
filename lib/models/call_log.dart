import 'package:flutter/material.dart';

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

import 'package:contact/models/call_log.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/call_log_provider.dart';

class CallLogScreen extends StatefulWidget {
  @override
  _CallLogScreenState createState() => _CallLogScreenState();
}

class _CallLogScreenState extends State<CallLogScreen> {
  int? selectedCallLogIndex; // 선택한 통화 기록의 인덱스

  @override
  Widget build(BuildContext context) {
    final callLogProvider = Provider.of<CallLogProvider>(context);
    final callLogs = callLogProvider.callLogs;

    return Scaffold(
      appBar: AppBar(
        title: Text('통화 기록'),
      ),
      body: ListView.builder(
        itemCount: callLogs.length,
        itemBuilder: (context, index) {
          final callLog = callLogs[index];

          return Column(
            children: [
              ListTile(
                leading: Icon(callLog.callType.icon),
                title: Text(callLog.contactName),
                subtitle: Text(callLog.time),
                onTap: () {
                  setState(() {
                    selectedCallLogIndex = selectedCallLogIndex == index ? null : index; // 탭 선택/해제
                  });
                },
              ),
              // 선택한 통화 기록에 대한 카테고리 탭 표시
              if (selectedCallLogIndex == index)
                Row(
                  children: [
                    TextButton(
                      child: Text('통화'),
                      onPressed: () {
                        // 통화 로직 실행
                      },
                    ),
                    TextButton(
                      child: Text('메시지'),
                      onPressed: () {
                        // 메시지 로직 실행
                      },
                    ),
                    TextButton(
                      child: Text('저장'),
                      onPressed: () {
                        // 메시지 로직 실행
                      },
                    ),
                    TextButton(
                      child: Text('상세보기'),
                      onPressed: () {
                        // 메시지 로직 실행
                      },
                    ),

                    // 여기에 더 많은 카테고리를 추가할 수 있습니다.
                  ],
                ),
            ],
          );
        },
      ),
    );
  }
}

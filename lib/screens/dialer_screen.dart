import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:contact/providers/contacts_provider.dart';
import '../models/call_log.dart';
import '../models/contact.dart';
import '../providers/call_log_provider.dart';
import 'contact_detail_screen.dart';

class DialerScreen extends StatefulWidget {
  @override
  _DialerScreenState createState() => _DialerScreenState();
}

class _DialerScreenState extends State<DialerScreen> {
  final TextEditingController phoneController = TextEditingController();

  String findContactName(String phoneNumber, List<Contact> contacts) {
    final contact = contacts.firstWhere(
          (contact) => contact.phone == phoneNumber,
      orElse: () => Contact(
        firstName: '',
        lastName: '',
        company: '',
        phone: '',
        email: '',
        ringtone: '',
        textTone: '',
        url: '',
        address: '',
        birthday: null,
        addDate: null,
        relatedName: '',
        socialProfile: '',
        instantMessage: '',
        note: '',
      ), // 빈 연락처 반환
    );

    String contactName = "${contact.firstName} ${contact.lastName}".trim();
    return contactName.isNotEmpty ? contactName : phoneNumber;
  }

  @override
  void initState() {
    super.initState();
    phoneController.addListener(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            height: 150,
            padding: EdgeInsets.symmetric(horizontal: 30),
            child: Center(
              child: CupertinoTextField(
                controller: phoneController,
                keyboardType: TextInputType.phone,
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 30),
                placeholder: "번호 입력",
                padding: EdgeInsets.symmetric(horizontal: 50, vertical: 100),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.transparent),
                ),
              ),
            ),
          ),


            // 연락처 저장 버튼
            Container(
              height: 55, // 고정된 높이 설정
              child: phoneController.text.isNotEmpty
                  ? CupertinoButton(
                    onPressed: () {
                      Navigator.push(
                    context,
                    CupertinoPageRoute(
                      builder: (context) => ContactDetailScreen(phoneNumber: phoneController.text),
                       ),
                     );
                    },
                    child: Text('저장'),
              )

              : SizedBox.shrink(),
        ),


          Expanded(
            child: GridView.count(
              crossAxisCount: 3,
              childAspectRatio: 1.1,
              mainAxisSpacing: 10.0, // 세로 간격 조절
              crossAxisSpacing: 20.0, // 가로 간격 조절
              children: List.generate(12, (index) {
                return DialerButton(
                  text: index < 9 ? '${index + 1}' : index == 9 ? '*' : index == 10 ? '0' : '#',
                  onTap: () {
                    phoneController.text += index < 9 ? '${index + 1}' : index == 9 ? '*' : index == 10 ? '0' : '#';
                  },
                );
              }),
            ),
          ),

          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () {
                  final phoneNumber = phoneController.text;
                  final contactsProvider = Provider.of<ContactsProvider>(context, listen: false);
                  final contactName = findContactName(phoneNumber, contactsProvider.contacts);

                  // 현재 시간을 가져와 원하는 형식으로 변환합니다.
                  final currentTime = DateFormat('hh:mm').format(DateTime.now());

                  // 전화 걸기 로직
                  print('전화 걸기: $phoneNumber');

                  // 통화 기록에 추가
                  final callLogProvider = Provider.of<CallLogProvider>(context, listen: false);
                  callLogProvider.addCallLog(
                    contactName: contactName,
                    time: currentTime, // 현재 시간을 사용
                    callType: CallType.outgoing,
                  );
                },
                style: ElevatedButton.styleFrom(
                  shape: CircleBorder(), backgroundColor: Colors.green,
                  padding: EdgeInsets.all(30),
                  fixedSize: Size.fromHeight(180),
                ),
                child: Icon(Icons.call, size: 40, color: Colors.white),
              ),
              SizedBox(width: 50), // 지우기 버튼과 통화 버튼 사이의 간격 조절
              IconButton(
                icon: Icon(Icons.backspace_outlined, size: 30, color: Colors.grey),
                onPressed: () {
                  if (phoneController.text.isNotEmpty) {
                    phoneController.text = phoneController.text.substring(0, phoneController.text.length - 1);
                  }
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}


class DialerButton extends StatelessWidget {
  final String text;
  final VoidCallback onTap;

  DialerButton({required this.text, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      customBorder: CircleBorder(),
      child: Container(
        width: 50, // 버튼의 너비 설정
        height: 50, // 버튼의 높이 설정
        decoration: BoxDecoration(
          color: Colors.grey[200],
          shape: BoxShape.circle,
        ),
        child: Center(
          child: Text(
            text,
            style: TextStyle(fontSize: 30, color: Colors.black),
          ),
        ),
      ),
    );
  }
}

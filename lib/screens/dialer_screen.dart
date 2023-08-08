import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:contact/providers/contacts_provider.dart';

class DialerScreen extends StatefulWidget {
  @override
  _DialerScreenState createState() => _DialerScreenState();
}

class _DialerScreenState extends State<DialerScreen> {
  final TextEditingController phoneController = TextEditingController();

  @override
  void initState() {
    super.initState();

    // 전화번호 입력값이 변경될 때마다 상태를 다시 빌드합니다.
    phoneController.addListener(() {
      setState(() {});
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Contact'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            height: 80,
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: TextField(
              controller: phoneController,
              keyboardType: TextInputType.phone,
              textAlign: TextAlign.center,
              decoration: const InputDecoration(
                border: InputBorder.none,
              ),
              style: TextStyle(fontSize: 30),
            ),
          ),
          // 연락처 저장 버튼
          if (phoneController.text.isNotEmpty) // 조건을 추가하여 입력값이 있을 때만 버튼을 표시합니다.
            ElevatedButton(
              onPressed: () {
                // ContactsProvider 인스턴스를 가져옴
                final contactsProvider = Provider.of<ContactsProvider>(context, listen: false);

                // 연락처 저장 함수 호출
                contactsProvider.addContact("이름", phoneController.text);
              },
              child: Text('저장'),
            ),
          Expanded(
            child: GridView.count(
              crossAxisCount: 3,
              childAspectRatio: 1.5,
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
                  // 전화 걸기 로직
                  print('전화 걸기: ${phoneController.text}');
                },
                style: ElevatedButton.styleFrom(
                  shape: CircleBorder(),
                  primary: Colors.green,
                  padding: EdgeInsets.all(30),
                  fixedSize: Size.fromHeight(180),
                ),
                child: Icon(Icons.call, size: 40, color: Colors.white),
              ),
              SizedBox(width: 80), // 지우기 버튼과 통화 버튼 사이의 간격 조절
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
      customBorder: CircleBorder(), // 터치 효과의 테두리를 원형으로 만듦
      child: Container(
        width: 10, // 버튼의 너비 설정
        height: 10, // 버튼의 높이 설정
        decoration: BoxDecoration(
          color: Colors.grey[200], // 버튼의 배경색을 연한 회색으로 설정
          shape: BoxShape.circle, // 버튼의 모양을 원형으로 만듦
        ),
        child: Center(
          child: Text(
            text,
            style: TextStyle(fontSize: 30, color: Colors.black), // 텍스트 크기 조정
          ),
        ),
      ),
    );
  }
}



import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:contact/providers/contacts_provider.dart';


class ContactDetailScreen extends StatefulWidget {
  final int? index;
  final String phoneNumber;

  ContactDetailScreen({this.index, required this.phoneNumber});

  @override
  _ContactDetailScreenState createState() => _ContactDetailScreenState();
}

class _ContactDetailScreenState extends State<ContactDetailScreen> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  String? profileImage; // 프로필 이미지 URL
  bool showAddressField = false; // 주소 필드 표시 여부

  // 주소 필드 표시 함수
  void _toggleAddressField() {
    setState(() {
      showAddressField = !showAddressField;
    });
  }

  @override
  void initState() {
    super.initState();
    phoneController.text = widget.phoneNumber;
    if (widget.index != null) {
      final contactsProvider = Provider.of<ContactsProvider>(context, listen: false);
      nameController.text = contactsProvider.contacts[widget.index!].name;
    }
  }

  void _updateProfileImage(String imageUrl) {
    setState(() {
      profileImage = imageUrl;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('연락처 상세')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  InkWell(
                    onTap: () {
                      // 이미지 선택 로직
                    },
                    customBorder: CircleBorder(), // 원 형태의 터치 영역
                    child: Stack(
                      alignment: Alignment.bottomRight,
                      children: [
                        Container(
                          width: MediaQuery.of(context).size.width * 0.22, // 화면 폭의 22%
                          height: MediaQuery.of(context).size.width * 0.22, // 화면 폭의 22%
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.grey, // 원의 색상을 지정
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 8), // 원과 텍스트 사이의 간격 조절
                  InkWell(
                    onTap: () {
                      // 이미지 선택 로직
                    },
                    child: Text(
                      profileImage == null ? 'add photo' : 'edit photo',
                      style: TextStyle(
                        color: Colors.blue, // 텍스트 색상을 원과 동일하게 설정
                        // 여기에 추가적인 스타일 속성을 추가할 수 있습니다.
                      ),
                    ),
                  ),
                ],
              ),
            ),


            TextField(
              controller: nameController,
              decoration: InputDecoration(labelText: 'First Name'),
            ),
            TextField(
              decoration: InputDecoration(labelText: 'Last Name'),
            ),
            TextField(
              decoration: InputDecoration(labelText: 'Company'),
            ),
            TextField(
              controller: phoneController,
              decoration: InputDecoration(labelText: 'add Phone'),
            ),
            GestureDetector(
              onTap: _toggleAddressField,
              child: Column(
                children: [
                  AnimatedContainer(
                    height: showAddressField ? 60 : 0, // 주소 필드 표시 여부에 따라 높이 조절
                    duration: Duration(milliseconds: 300), // 애니메이션 지속 시간
                    child: Align(
                      alignment: Alignment.topCenter,
                      child: TextField(
                        decoration: InputDecoration(labelText: 'add email'),
                      ),
                    ),
                  ),
                  ListTile(
                    leading: Container(
                      width: 30,
                      height: 30,
                      decoration: BoxDecoration(
                        color: Colors.green,
                        shape: BoxShape.circle,
                      ),
                      child: Icon(
                        Icons.add_rounded,
                        color: Colors.white,
                      ),
                    ),
                    title: Text('add email'),
                  ),
                ],
              ),
            ),
            TextField(
              decoration: InputDecoration(labelText: 'Ringtone'),
            ),
            TextField(
              decoration: InputDecoration(labelText: 'Vibration'),
            ),
            TextField(
              decoration: InputDecoration(labelText: 'Text Tone'),
            ),
            GestureDetector(
              onTap: _toggleAddressField,
              child: Column(
                children: [
                  AnimatedContainer(
                    height: showAddressField ? 60 : 0, // 주소 필드 표시 여부에 따라 높이 조절
                    duration: Duration(milliseconds: 300), // 애니메이션 지속 시간
                    child: Align(
                      alignment: Alignment.topCenter,
                      child: TextField(
                        decoration: InputDecoration(labelText: 'add url'),
                      ),
                    ),
                  ),
                  ListTile(
                    leading: Container(
                      width: 30,
                      height: 30,
                      decoration: BoxDecoration(
                        color: Colors.green,
                        shape: BoxShape.circle,
                      ),
                      child: Icon(
                        Icons.add_rounded,
                        color: Colors.white,
                      ),
                    ),
                    title: Text('add url'),
                  ),
                ],
              ),
            ),
            GestureDetector(
              onTap: _toggleAddressField,
              child: Column(
                children: [
                  AnimatedContainer(
                    height: showAddressField ? 60 : 0, // 주소 필드 표시 여부에 따라 높이 조절
                    duration: Duration(milliseconds: 300), // 애니메이션 지속 시간
                    child: Align(
                      alignment: Alignment.topCenter,
                      child: TextField(
                        decoration: InputDecoration(labelText: 'add address'),
                      ),
                    ),
                  ),
                  ListTile(
                    leading: Container(
                      width: 30,
                      height: 30,
                      decoration: BoxDecoration(
                        color: Colors.green,
                        shape: BoxShape.circle,
                      ),
                      child: Icon(
                        Icons.add_rounded,
                        color: Colors.white,
                      ),
                    ),
                    title: Text('add address'),
                  ),
                ],
              ),
            ),
            GestureDetector(
              onTap: _toggleAddressField,
              child: Column(
                children: [
                  AnimatedContainer(
                    height: showAddressField ? 60 : 0, // 주소 필드 표시 여부에 따라 높이 조절
                    duration: Duration(milliseconds: 300), // 애니메이션 지속 시간
                    child: Align(
                      alignment: Alignment.topCenter,
                      child: TextField(
                        decoration: InputDecoration(labelText: 'add birthday'),
                      ),
                    ),
                  ),
                  ListTile(
                    leading: Container(
                      width: 30,
                      height: 30,
                      decoration: BoxDecoration(
                        color: Colors.green,
                        shape: BoxShape.circle,
                      ),
                      child: Icon(
                        Icons.add_rounded,
                        color: Colors.white,
                      ),
                    ),
                    title: Text('add birthday'),
                  ),
                ],
              ),
            ),
            GestureDetector(
              onTap: _toggleAddressField,
              child: Column(
                children: [
                  AnimatedContainer(
                    height: showAddressField ? 60 : 0, // 주소 필드 표시 여부에 따라 높이 조절
                    duration: Duration(milliseconds: 300), // 애니메이션 지속 시간
                    child: Align(
                      alignment: Alignment.topCenter,
                      child: TextField(
                        decoration: InputDecoration(labelText: 'add date'),
                      ),
                    ),
                  ),
                  ListTile(
                    leading: Container(
                      width: 30,
                      height: 30,
                      decoration: BoxDecoration(
                        color: Colors.green,
                        shape: BoxShape.circle,
                      ),
                      child: Icon(
                        Icons.add_rounded,
                        color: Colors.white,
                      ),
                    ),
                    title: Text('add date'),
                  ),
                ],
              ),
            ),
            GestureDetector(
              onTap: _toggleAddressField,
              child: Column(
                children: [
                  AnimatedContainer(
                    height: showAddressField ? 60 : 0, // 주소 필드 표시 여부에 따라 높이 조절
                    duration: Duration(milliseconds: 300), // 애니메이션 지속 시간
                    child: Align(
                      alignment: Alignment.topCenter,
                      child: TextField(
                        decoration: InputDecoration(labelText: 'add related name'),
                      ),
                    ),
                  ),
                  ListTile(
                    leading: Container(
                      width: 30,
                      height: 30,
                      decoration: BoxDecoration(
                        color: Colors.green,
                        shape: BoxShape.circle,
                      ),
                      child: Icon(
                        Icons.add_rounded,
                        color: Colors.white,
                      ),
                    ),
                    title: Text('add related name'),
                  ),
                ],
              ),
            ),
            GestureDetector(
              onTap: _toggleAddressField,
              child: Column(
                children: [
                  AnimatedContainer(
                    height: showAddressField ? 60 : 0, // 주소 필드 표시 여부에 따라 높이 조절
                    duration: Duration(milliseconds: 300), // 애니메이션 지속 시간
                    child: Align(
                      alignment: Alignment.topCenter,
                      child: TextField(
                        decoration: InputDecoration(labelText: 'add social profile'),
                      ),
                    ),
                  ),
                  ListTile(
                    leading: Container(
                      width: 30,
                      height: 30,
                      decoration: BoxDecoration(
                        color: Colors.green,
                        shape: BoxShape.circle,
                      ),
                      child: Icon(
                        Icons.add_rounded,
                        color: Colors.white,
                      ),
                    ),
                    title: Text('add social profile'),
                  ),
                ],
              ),
            ),
            GestureDetector(
              onTap: _toggleAddressField,
              child: Column(
                children: [
                  AnimatedContainer(
                    height: showAddressField ? 60 : 0, // 주소 필드 표시 여부에 따라 높이 조절
                    duration: Duration(milliseconds: 300), // 애니메이션 지속 시간
                    child: Align(
                      alignment: Alignment.topCenter,
                      child: TextField(
                        decoration: InputDecoration(labelText: 'add Instant message'),
                      ),
                    ),
                  ),
                  ListTile(
                    leading: Container(
                      width: 30,
                      height: 30,
                      decoration: BoxDecoration(
                        color: Colors.green,
                        shape: BoxShape.circle,
                      ),
                      child: Icon(
                        Icons.add_rounded,
                        color: Colors.white,
                      ),
                    ),
                    title: Text('add Instant message'),
                  ),
                ],
              ),
            ),
            TextField(
              decoration: InputDecoration(labelText: 'Notes'),
            ),
            TextField(
              decoration: InputDecoration(labelText: 'add field'),
            ),
            // 여기에 추가 필드를 계속해서 추가
            ElevatedButton(
              onPressed: () {
                final contactsProvider = Provider.of<ContactsProvider>(context, listen: false);
                contactsProvider.addContact(nameController.text, phoneController.text); // 전화번호 저장

                // 연락처 저장 후 이전 화면으로 돌아갑니다.
                Navigator.pop(context);
              },
              child: Text('저장'),
            ),
          ],
        ),
      ),
    );
  }
}


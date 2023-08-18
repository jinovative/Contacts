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

class NewFieldSelectionPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Add New Field')),
      body: ListView(
        children: [
          ListTile(
            title: Text('Option 1'),
            onTap: () {
              // Option 1 선택 로직
            },
          ),
          ListTile(
            title: Text('Option 2'),
            onTap: () {
              // Option 2 선택 로직
            },
          ),
          // 여기에 추가적인 옵션을 계속해서 추가할 수 있습니다.
        ],
      ),
    );
  }
}

class _ContactDetailScreenState extends State<ContactDetailScreen> {
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController companyController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController ringtoneController = TextEditingController();
  final TextEditingController textToneController = TextEditingController();
  final TextEditingController urlController = TextEditingController();
  final TextEditingController addressController = TextEditingController();
  final TextEditingController birthdayController = TextEditingController();
  final TextEditingController addDateController = TextEditingController();
  final TextEditingController relatedNameController = TextEditingController();
  final TextEditingController socialProfileController = TextEditingController();
  final TextEditingController instantMessageController = TextEditingController();
  final TextEditingController noteController = TextEditingController();
  String? profileImage;

  bool showAddPhoneField = false;
  bool showEmailField = false;
  bool showRelatedNameField = false;
  bool showUrlField = false;
  bool showAddressField = false;
  bool showBirthdayField = false;
  bool showDateField = false;
  bool showSocialProfileField = false;
  bool showInstantMessageField = false;

  DateTime? parseDate(String? date) {
    if (date == null || date.isEmpty) {
      return null;
    }

    try {
      return DateTime.parse(date);
    } catch (e) {
      print('Error parsing date: $e');
      return null;
    }
  }
  // 각 토글 함수
  void _toggleAddPhoneField() {
    setState(() {
      showAddPhoneField = !showAddPhoneField;
    });
  }

  void _toggleEmailField() {
    setState(() {
      showEmailField = !showEmailField;
    });
  }

  void _toggleRelatedNameField() {
    setState(() {
      showRelatedNameField = !showRelatedNameField;
    });
  }

  void _toggleUrlField() {
    setState(() {
      showUrlField = !showUrlField;
    });
  }

  void _toggleAddressField() {
    setState(() {
      showAddressField = !showAddressField;
    });
  }

  void _toggleBirthdayField() {
    setState(() {
      showBirthdayField = !showBirthdayField;
    });
  }

  void _toggleDateField() {
    setState(() {
      showDateField = !showDateField;
    });
  }

  void _toggleSocialProfileField() {
    setState(() {
      showSocialProfileField = !showSocialProfileField;
    });
  }

  void _toggleInstantMessageField() {
    setState(() {
      showInstantMessageField = !showInstantMessageField;
    });
  }


  @override
  void initState() {
    super.initState();
    phoneController.text = widget.phoneNumber;
    if (widget.index != null) {
      final contactsProvider = Provider.of<ContactsProvider>(context, listen: false);
      final contact = contactsProvider.contacts[widget.index!];

      firstNameController.text = contact.firstName;
      lastNameController.text = contact.lastName;
      companyController.text = contact.company;
      phoneController.text = contact.phone;
      emailController.text = contact.email;
      ringtoneController.text = contact.ringtone;
      textToneController.text = contact.textTone;
      urlController.text = contact.url;
      addressController.text = contact.address;
      birthdayController.text = contact.birthday != null ? contact.birthday.toString() : "";
      relatedNameController.text = contact.relatedName;
      socialProfileController.text = contact.socialProfile;
      instantMessageController.text = contact.instantMessage;
      noteController.text = contact.note;
    }
  }

  @override
  Widget _buildAddIcon() {
    return Container(
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
    );
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
              controller: firstNameController,
              decoration: InputDecoration(labelText: 'First Name'),
            ),
            TextField(
              controller: lastNameController,
              decoration: InputDecoration(labelText: 'Last Name'),
            ),
            TextField(
              controller: companyController,
              decoration: InputDecoration(labelText: 'Company'),
            ),
            GestureDetector(
              onTap: _toggleAddPhoneField,
              child: Column(
                children: [
                  AnimatedContainer(
                    height: showAddPhoneField ? 60 : 0,
                    duration: Duration(milliseconds: 300),
                    child: Align(
                      alignment: Alignment.topCenter,
                      child: TextField(
                        controller: phoneController,
                        decoration: InputDecoration(labelText: 'add phone'),
                      ),
                    ),
                  ),
                  ListTile(
                    leading: _buildAddIcon(),
                    title: Text('add phone'),
                  ),
                ],
              ),
            ),
            GestureDetector(
              onTap: _toggleEmailField,
              child: Column(
                children: [
                  AnimatedContainer(
                    height: showEmailField ? 60 : 0,
                    duration: Duration(milliseconds: 300),
                    child: Align(
                      alignment: Alignment.topCenter,
                      child: TextField(
                        controller: emailController,
                        decoration: InputDecoration(labelText: 'add email'),
                      ),
                    ),
                  ),
                  ListTile(
                    leading: _buildAddIcon(),
                    title: Text('add email'),
                  ),
                ],
              ),
            ),
            TextField(
              controller: ringtoneController,
              decoration: InputDecoration(labelText: 'Ringtone'),
            ),
            TextField(
              controller: textToneController,
              decoration: InputDecoration(labelText: 'Text Tone'),
            ),
            GestureDetector(
              onTap: _toggleUrlField,  // 소셜 프로필 항목에 대한 토글 함수 연결
              child: Column(
                children: [
                  AnimatedContainer(
                    height: showUrlField ? 60 : 0,
                    duration: Duration(milliseconds: 300),
                    child: Align(
                      alignment: Alignment.topCenter,
                      child: TextField(
                        controller: urlController,
                        decoration: InputDecoration(labelText: 'add url'),
                      ),
                    ),
                  ),
                  ListTile(
                    leading: _buildAddIcon(),
                    title: Text('add url'),
                  ),
                ],
              ),
            ),
            GestureDetector(
              onTap: _toggleAddressField, // 이 부분에서 토글 함수를 연결했습니다.
              child: Column(
                children: [
                  AnimatedContainer(
                    height: showAddressField ? 60 : 0,
                    duration: Duration(milliseconds: 300),
                    child: Align(
                      alignment: Alignment.topCenter,
                      child: TextField(
                        controller: addressController,
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
              onTap: _toggleBirthdayField,
              child: Column(
                children: [
                  AnimatedContainer(
                    height: showBirthdayField ? 60 : 0, // 주소 필드 표시 여부에 따라 높이 조절
                    duration: Duration(milliseconds: 300), // 애니메이션 지속 시간
                    child: Align(
                      alignment: Alignment.topCenter,
                      child: TextField(
                        controller: birthdayController,
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
              onTap: _toggleDateField,
              child: Column(
                children: [
                  AnimatedContainer(
                    height: showDateField ? 60 : 0, // 주소 필드 표시 여부에 따라 높이 조절
                    duration: Duration(milliseconds: 300), // 애니메이션 지속 시간
                    child: Align(
                      alignment: Alignment.topCenter,
                      child: TextField(
                        controller: addDateController,
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
              onTap: _toggleRelatedNameField,
              child: Column(
                children: [
                  AnimatedContainer(
                    height: showRelatedNameField ? 60 : 0, // 주소 필드 표시 여부에 따라 높이 조절
                    duration: Duration(milliseconds: 300), // 애니메이션 지속 시간
                    child: Align(
                      alignment: Alignment.topCenter,
                      child: TextField(
                        controller: relatedNameController,
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
              onTap: _toggleSocialProfileField,
              child: Column(
                children: [
                  AnimatedContainer(
                    height: showSocialProfileField ? 60 : 0,
                    duration: Duration(milliseconds: 300),
                    child: Align(
                      alignment: Alignment.topCenter,
                      child: TextField(
                        controller: socialProfileController,
                        decoration: InputDecoration(labelText: 'add social profile'),
                      ),
                    ),
                  ),
                  ListTile(
                    leading: _buildAddIcon(),
                    title: Text('add social profile'),
                  ),
                ],
              ),
            ),
            GestureDetector(
              onTap: _toggleInstantMessageField,
              child: Column(
                children: [
                  AnimatedContainer(
                    height: showInstantMessageField ? 60 : 0, // 주소 필드 표시 여부에 따라 높이 조절
                    duration: Duration(milliseconds: 300), // 애니메이션 지속 시간
                    child: Align(
                      alignment: Alignment.topCenter,
                      child: TextField(
                        controller: instantMessageController,
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
            Container(
              padding: EdgeInsets.all(8.0), // 내부 여백을 추가하여 텍스트와 테두리 사이에 간격을 줍니다.
              decoration: BoxDecoration(
                border: Border.all(color: Colors.blueAccent), // 테두리 색상 설정
                borderRadius: BorderRadius.circular(8.0), // 모서리 둥글게 처리
              ),
              child: TextField(
                controller: noteController,
                decoration: InputDecoration(
                  labelText: 'Notes',
                  border: InputBorder.none, // 기본 TextField 테두리 제거
                ),
                maxLines: null, // 여러 줄의 텍스트를 입력할 수 있게 설정
                keyboardType: TextInputType.multiline, // 여러 줄 입력 키보드 타입 설정
              ),
            ),
            ListTile(
              title: Text('add field'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => NewFieldSelectionPage()),
                );
              },
            ),
            ElevatedButton(
              onPressed: () {
                final contactsProvider = Provider.of<ContactsProvider>(context, listen: false);
                contactsProvider.addContact(
                  firstName: firstNameController.text,
                  lastName: lastNameController.text,
                  company: companyController.text,
                  phone: phoneController.text,
                  email: emailController.text,
                  ringtone: ringtoneController.text,
                  textTone: textToneController.text,
                  url: urlController.text,
                  address: addressController.text,
                  birthday: parseDate(birthdayController.text),
                  addDate: parseDate(addDateController.text),
                  relatedName: relatedNameController.text,
                  socialProfile: socialProfileController.text,
                  instantMessage: instantMessageController.text,
                  note: noteController.text,
                ); // 전화번호 저장

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


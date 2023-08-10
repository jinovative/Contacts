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
  final TextEditingController phoneController = TextEditingController(); // 전화번호 컨트롤러 추가

  @override
  void initState() {
    super.initState();
    phoneController.text = widget.phoneNumber;
    if (widget.index != null) {
      final contactsProvider = Provider.of<ContactsProvider>(context, listen: false);
      nameController.text = contactsProvider.contacts[widget.index!].name;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('연락처 상세')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: nameController,
              decoration: InputDecoration(labelText: '이름'),
            ),
            TextField(
              controller: phoneController, // 전화번호 입력 필드
              decoration: InputDecoration(labelText: '전화번호'),
            ),
            ElevatedButton(
              onPressed: () {
                final contactsProvider = Provider.of<ContactsProvider>(context, listen: false);
                if (widget.index != null) {
                  contactsProvider.updateContact(widget.index!, nameController.text, phoneController.text);
                } else {
                  contactsProvider.addContact(nameController.text, phoneController.text);
                }
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


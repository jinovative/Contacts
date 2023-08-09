import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:contact/providers/contacts_provider.dart';

class ContactDetailScreen extends StatefulWidget {
  final String phoneNumber;

  ContactDetailScreen({required this.phoneNumber});

  @override
  _ContactDetailScreenState createState() => _ContactDetailScreenState();
}

class _ContactDetailScreenState extends State<ContactDetailScreen> {
  final TextEditingController nameController = TextEditingController();

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
              controller: TextEditingController(text: widget.phoneNumber),
              decoration: InputDecoration(labelText: '전화번호'),
              readOnly: true,
            ),
            ElevatedButton(
              onPressed: () {
                final contactsProvider = Provider.of<ContactsProvider>(context, listen: false);
                contactsProvider.addContact(nameController.text, widget.phoneNumber);

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

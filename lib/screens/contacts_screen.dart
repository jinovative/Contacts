import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:contact/providers/contacts_provider.dart';

import '../models/contact.dart';
import 'contact_detail_screen.dart'; // 연락처 프로바이더 가져오기

class ContactsScreen extends StatelessWidget {
  final List<Contact> contacts = [
    Contact(name: 'Alice', phone: '010-1234-5678'),
    Contact(name: 'Bob', phone: '010-9876-5432'),
    // 여기에 더 많은 연락처 추가
  ];

  @override
  Widget build(BuildContext context) {
    // 연락처 프로바이더를 가져옴
    final contactsProvider = Provider.of<ContactsProvider>(context);
    final contacts = contactsProvider.contacts; // 연락처 목록을 가져옴

    return Scaffold(
      appBar: AppBar(
        title: Text('연락처'),
      ),
      body: ListView.builder(
        itemCount: contacts.length,
        itemBuilder: (context, index) {
          final contact = contacts[index];
          return ListTile(
            leading: Icon(Icons.person),
            title: Text(contact.name),
            subtitle: Text(contact.phone),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ContactDetailScreen(phoneNumber: contact.phone), // phoneNumber를 전달
                ),
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // 새 연락처 추가 화면으로 이동
        },
        child: Icon(Icons.add),
      ),
    );
  }
}

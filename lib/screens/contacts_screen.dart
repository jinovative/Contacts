import 'package:flutter/material.dart';

class ContactsScreen extends StatelessWidget {
  final List<Contact> contacts = [
    Contact(name: 'Alice', phone: '010-1234-5678'),
    Contact(name: 'Bob', phone: '010-9876-5432'),
    // 여기에 더 많은 연락처 추가
  ];

  @override
  Widget build(BuildContext context) {
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
              // 연락처 상세 화면으로 이동하거나 다른 동작 수행
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

class Contact {
  final String name;
  final String phone;

  Contact({required this.name, required this.phone});
}

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:contact/providers/contacts_provider.dart';
import 'contact_detail_screen.dart';

class ContactsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // 연락처 프로바이더를 가져옴
    final contactsProvider = Provider.of<ContactsProvider>(context);
    final contacts = contactsProvider.contacts; // 연락처 목록을 가져옴

    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: Text('연락처'),
        trailing: CupertinoButton(
          padding: EdgeInsets.zero,
          child: Icon(CupertinoIcons.add),
          onPressed: () {
            // 새 연락처 추가 화면으로 이동
            Navigator.push(
              context,
              CupertinoPageRoute(
                builder: (context) => ContactDetailScreen(phoneNumber: ''), // phoneNumber를 빈 문자열로 전달
              ),
            );
          },
        ),
      ),
      child: ListView.builder(
        itemCount: contacts.length,
        itemBuilder: (context, index) {
          final contact = contacts[index];
          return ListTile(
            leading: Icon(CupertinoIcons.person),
            title: Text(contact.name),
            subtitle: Text(contact.phone),
            onTap: () {
              Navigator.push(
                context,
                CupertinoPageRoute(
                  builder: (context) => ContactDetailScreen(
                      index: index, phoneNumber: contacts[index].phone),
                ),
              );
            },
          );
        },
      ),
    );
  }
}

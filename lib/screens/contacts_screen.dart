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
            Navigator.of(context).push(
              PageRouteBuilder(
                pageBuilder: (context, animation, secondaryAnimation) => Container(
                  margin: EdgeInsets.only(top: 10.0),  // 위쪽에 여백 추가
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(  // 라운딩 처리된 모서리 적용
                      topLeft: Radius.circular(20.0),
                      topRight: Radius.circular(20.0),
                    ),
                  ),
                  child: ContactDetailScreen(phoneNumber: ''),
                ),
                transitionsBuilder: (context, animation, secondaryAnimation, child) {
                  const begin = Offset(0.0, 1.0);
                  const end = Offset.zero;
                  const curve = Curves.easeInOut;
                  var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
                  var offsetAnimation = animation.drive(tween);
                  return SlideTransition(position: offsetAnimation, child: child);
                },
              ),
            );
          },

        ),
      ),
      child: ListView.builder(
        itemCount: contacts.length,
        itemBuilder: (context, index) {
          final contact = contacts[index];
          final contactName = "${contact.firstName} ${contact.lastName}".trim();
          return ListTile(
            leading: Icon(CupertinoIcons.person),
            title: Text(contactName),
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

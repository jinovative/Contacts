import 'package:flutter/material.dart';
import 'package:contact/models/contact.dart'; // 모델 클래스의 정확한 경로로 바꾸세요.

class ContactListItem extends StatelessWidget {
  final Contact contact;

  ContactListItem({required this.contact});

  @override
  Widget build(BuildContext context) {
    // firstName과 lastName을 합쳐 이름을 표시
    final contactName = "${contact.firstName} ${contact.lastName}".trim();

    return ListTile(
      leading: Icon(Icons.person),
      title: Text(contactName),
      subtitle: Text(contact.phone),
      onTap: (){
        // 연락처 상세 화면으로 이동하거나 다른 동작 수행
      },
    );
  }
}

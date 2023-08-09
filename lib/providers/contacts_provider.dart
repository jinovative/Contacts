import 'package:flutter/foundation.dart';
import 'package:contact/models/contact.dart';

class ContactsProvider with ChangeNotifier {
  List<Contact> _contacts = [];

  List<Contact> get contacts => _contacts;

  void addContact(String name, String phone) {
    _contacts.add(Contact(name: name, phone: phone));
    notifyListeners();
  }

  void updateContact(Contact updatedContact) {
    // 연락처 목록에서 해당 연락처를 찾음 (예: 전화번호를 기준으로 찾을 수 있음)
    final index = contacts.indexWhere((contact) => contact.phone == updatedContact.phone);

    if (index != -1) {
      // 연락처를 찾았다면, 해당 인덱스의 연락처를 새 연락처로 업데이트
      contacts[index] = updatedContact;

      // UI를 다시 빌드하여 변경 사항을 반영
      notifyListeners();
    } else {
      // 연락처를 찾을 수 없는 경우의 처리 (옵션)
    }
  }


// 필요한 경우 추가 메서드
}

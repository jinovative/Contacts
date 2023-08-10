import 'package:flutter/foundation.dart';
import 'package:contact/models/contact.dart';

class ContactsProvider with ChangeNotifier {
  List<Contact> _contacts = [];

  // 기존 연락처 목록 가져오기
  List<Contact> get contacts => _contacts;

  // 연락처 추가
  void addContact(String name, String phone) {
    _contacts.add(Contact(name: name, phone: phone));
    notifyListeners();
  }

  void updateContact(int index, String name, String phone) {
    _contacts[index] = Contact(name: name, phone: phone);
    notifyListeners();
  }

  int findContactIndex(Contact contact) {
    return contacts.indexWhere((element) => element.phone == contact.phone);
  }

}


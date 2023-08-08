import 'package:flutter/foundation.dart';
import 'package:contact/models/contact.dart';

class ContactsProvider with ChangeNotifier {
  List<Contact> _contacts = [];

  List<Contact> get contacts => _contacts;

  void addContact(String name, String phone) {
    _contacts.add(Contact(name: name, phone: phone));
    notifyListeners();
  }

// 필요한 경우 추가 메서드
}

import 'package:flutter/foundation.dart';

class Contact {
  final String name;
  final String phone;

  Contact({required this.name, required this.phone});
}

class ContactsProvider with ChangeNotifier {
  List<Contact> _contacts = [];

  List<Contact> get contacts => _contacts;

  void addContact(String name, String phone) {
    _contacts.add(Contact(name: name, phone: phone));
    notifyListeners();
  }
}

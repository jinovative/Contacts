import 'package:flutter/foundation.dart';
import 'package:contact/models/contact.dart';

class ContactsProvider with ChangeNotifier {
  List<Contact> _contacts = [];

  List<Contact> get contacts => _contacts;

  DateTime? parseDate(String? date) {
    if (date == null || date.isEmpty) {
      return null;
    }

    try {
      return DateTime.parse(date);
    } catch (e) {
      print('Error parsing date: $e');
      return null;
    }
  }

  void addContact({
    required String firstName,
    required String lastName,
    required String company,
    required String phone,
    required String email,
    required String ringtone,
    required String textTone,
    required String url,
    required String address,
    DateTime? birthday,
    DateTime? addDate,
    required String relatedName,
    required String socialProfile,
    required String instantMessage,
    required String note,
  }) {
    final newContact = Contact(
      firstName: firstName,
      lastName: lastName,
      company: company,
      phone: phone,
      email: email,
      ringtone: ringtone,
      textTone: textTone,
      url: url,
      address: address,
      birthday: birthday,
      addDate: addDate,
      relatedName: relatedName,
      socialProfile: socialProfile,
      instantMessage: instantMessage,
      note: note,
    );
    _contacts.add(newContact);
    notifyListeners();
  }

  void updateContact(int index, {
    required String firstName,
    required String lastName,
    required String company,
    required String phone,
    required String email,
    required String ringtone,
    required String textTone,
    required String url,
    required String address,
    DateTime? birthday,
    DateTime? addDate,
    required String relatedName,
    required String socialProfile,
    required String instantMessage,
    required String note,
  }) {
    _contacts[index] = Contact(
      firstName: firstName,
      lastName: lastName,
      company: company,
      phone: phone,
      email: email,
      ringtone: ringtone,
      textTone: textTone,
      url: url,
      address: address,
      birthday: birthday,
      addDate: addDate,
      relatedName: relatedName,
      socialProfile: socialProfile,
      instantMessage: instantMessage,
      note: note,
    );
    notifyListeners();
  }

  int findContactIndex(Contact contact) {
    return contacts.indexWhere((element) => element.phone == contact.phone);
  }
}

class Contact {
  final String firstName;
  final String lastName;
  final String company;
  final String phone;
  final String email;
  final String ringtone;
  final String textTone;
  final String url;
  final String address;
  final DateTime? birthday;
  final DateTime? addDate;
  final String relatedName;
  final String socialProfile;
  final String instantMessage;
  final String note;

  Contact({
    required this.firstName,
    required this.lastName,
    required this.company,
    required this.phone,
    required this.email,
    required this.ringtone,
    required this.textTone,
    required this.url,
    required this.address,
    this.birthday,
    this.addDate,
    required this.relatedName,
    required this.socialProfile,
    required this.instantMessage,
    required this.note,
  });

  List<Contact> searchContacts(String query, List<Contact> contacts) {
    return contacts.where((contact) {
      return contact.firstName.contains(query) ||
          contact.lastName.contains(query) ||
          contact.company.contains(query) ||
          contact.phone.contains(query) ||
          contact.email.contains(query) ||
          contact.ringtone.contains(query) ||
          contact.textTone.contains(query) ||
          contact.url.contains(query) ||
          contact.address.contains(query) ||
          (contact.birthday != null && contact.birthday!.toIso8601String().contains(query)) ||
          (contact.addDate != null && contact.addDate!.toIso8601String().contains(query)) ||
          contact.relatedName.contains(query) ||
          contact.socialProfile.contains(query) ||
          contact.instantMessage.contains(query) ||
          contact.note.contains(query);
    }).toList();
  }
}

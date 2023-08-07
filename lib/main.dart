import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'Contact.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => ContactsProvider(),
      child: ContactsApp(),
    ),
  );
}

class ContactsApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ContactsPage(),
    );
  }
}

class ContactsPage extends StatelessWidget {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Contacts'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: nameController,
              decoration: InputDecoration(labelText: 'Name'),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: phoneController,
              decoration: InputDecoration(labelText: 'Contacts'),
            ),
          ),
          ElevatedButton(
            onPressed: () {
              Provider.of<ContactsProvider>(context, listen: false)
                  .addContact(nameController.text, phoneController.text);
              nameController.clear();
              phoneController.clear();
            },
            child: Text('Add'),
          ),
          Expanded(
            child: Consumer<ContactsProvider>(
              builder: (context, contactsProvider, child) {
                return ListView.builder(
                  itemCount: contactsProvider.contacts.length,
                  itemBuilder: (context, index) {
                    final contact = contactsProvider.contacts[index];
                    return ListTile(
                      title: Text(contact.name),
                      subtitle: Text(contact.phone),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

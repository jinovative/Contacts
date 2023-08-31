import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:contact/providers/contacts_provider.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class ContactDetailScreen extends StatefulWidget {
  final int? index;
  final String phoneNumber;


  ContactDetailScreen({this.index, required this.phoneNumber});

  @override
  _ContactDetailScreenState createState() => _ContactDetailScreenState();
}


class NewFieldSelectionPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Add New Field')),
      body: ListView(
        children: [
          ListTile(
            title: Text('Option 1'),
            onTap: () {
              // Option 1 선택 로직
            },
          ),
          ListTile(
            title: Text('Option 2'),
            onTap: () {
              // Option 2 선택 로직
            },
          ),
          // 여기에 추가적인 옵션을 계속해서 추가할 수 있습니다.
        ],
      ),
    );
  }
}

class AddPhoneSelectionPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Add New Field')),
      body: ListView(
        children: [
          ListTile(
            title: Text('Option 1'),
            onTap: () {
              Navigator.pop(context, 'Option 1'); // Return the selected option
            },
          ),
          ListTile(
            title: Text('Option 2'),
            onTap: () {
              Navigator.pop(context, 'Option 2'); // Return the selected option
            },
          ),
          // Add more options as needed
        ],
      ),
    );
  }
}


class _ContactDetailScreenState extends State<ContactDetailScreen> {
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController companyController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController ringtoneController = TextEditingController();
  final TextEditingController textToneController = TextEditingController();
  final TextEditingController urlController = TextEditingController();
  final TextEditingController addressController = TextEditingController();
  final TextEditingController birthdayController = TextEditingController();
  final TextEditingController addDateController = TextEditingController();
  final TextEditingController relatedNameController = TextEditingController();
  final TextEditingController socialProfileController = TextEditingController();
  final TextEditingController instantMessageController = TextEditingController();
  final TextEditingController noteController = TextEditingController();

  List<TextEditingController> phoneControllers = [];
  List<TextEditingController> emailControllers = [];

  String? profileImage;
  bool showAddPhoneField = false;
  bool showEmailField = false;
  bool showRelatedNameField = false;
  bool showUrlField = false;
  bool showAddressField = false;
  bool showBirthdayField = false;
  bool showDateField = false;
  bool showSocialProfileField = false;
  bool showInstantMessageField = false;

  String selectedOption = '';

  final SlidableController slidableController = SlidableController();

  double imageSize = 100.0;

  void _toggleRemoveField() {
    setState(() {
      showAddPhoneField = !showAddPhoneField;
    });
  }

  void _toggleAddPhoneField() {
    setState(() {
      showAddPhoneField = !showAddPhoneField;
    });
  }

  void _toggleEmailField() {
    setState(() {
      showEmailField = !showEmailField;
    });
  }

  void _toggleRelatedNameField() {
    setState(() {
      showRelatedNameField = !showRelatedNameField;
    });
  }

  void _toggleUrlField() {
    setState(() {
      showUrlField = !showUrlField;
    });
  }

  void _toggleAddressField() {
    setState(() {
      showAddressField = !showAddressField;
    });
  }

  void _toggleBirthdayField() {
    setState(() {
      showBirthdayField = !showBirthdayField;
    });
  }

  void _toggleDateField() {
    setState(() {
      showDateField = !showDateField;
    });
  }

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

  void _toggleSocialProfileField() {
    setState(() {
      showSocialProfileField = !showSocialProfileField;
    });
  }

  void _toggleInstantMessageField() {
    setState(() {
      showInstantMessageField = !showInstantMessageField;
    });
  }




  @override
  void initState() {
    super.initState();
    phoneController.text = widget.phoneNumber;
    if (widget.index != null) {
      final contactsProvider = Provider.of<ContactsProvider>(context, listen: false);
      final contact = contactsProvider.contacts[widget.index!];

      firstNameController.text = contact.firstName;
      lastNameController.text = contact.lastName;
      companyController.text = contact.company;
      List<String> phoneNumbers = contact.phone.split(',');
      for (String phoneNumber in phoneNumbers) {
        phoneControllers.add(TextEditingController(text: phoneNumber.trim()));
      }
      emailController.text = contact.email;
      ringtoneController.text = contact.ringtone;
      textToneController.text = contact.textTone;
      urlController.text = contact.url;
      addressController.text = contact.address;
      birthdayController.text = contact.birthday != null ? contact.birthday.toString() : "";
      relatedNameController.text = contact.relatedName;
      socialProfileController.text = contact.socialProfile;
      instantMessageController.text = contact.instantMessage;
      noteController.text = contact.note;
    }
  }

  Widget _buildAddIcon() {
    return Container(
      width: 25,
      height: 25,
      decoration: BoxDecoration(
        color: CupertinoColors.activeGreen,
        shape: BoxShape.circle,
      ),
      child: Icon(
        CupertinoIcons.add,
        color: CupertinoColors.white,
      ),
    );
  }

  Widget _buildDeleteIcon(TextEditingController controller) {
    return GestureDetector(
      onTap: () {
        setState(() {
          phoneControllers.remove(controller);
        });
      },
      child: Container(
        width: 25,
        height: 25,
        decoration: BoxDecoration(
          color: CupertinoColors.systemRed,
          shape: BoxShape.circle,
        ),
        child: Icon(
          CupertinoIcons.minus,
          color: CupertinoColors.white,
        ),
      ),
    );
  }

  Widget _buildCategoryBox(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          CupertinoPageRoute(builder: (context) => AddPhoneSelectionPage()),
        );
      },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 8),
        child: Row(
          children: [

            SizedBox(width: 1),
            Text(
              'Work',
              style: TextStyle(
                fontSize: 15,
                color: Colors.black,
                fontWeight: FontWeight.bold,
                decoration: TextDecoration.none,
              ),
            ),
            Icon(
              Icons.chevron_right_outlined,
              color: Colors.grey,
              size: 18,
            ),
          ],
        ),
      ),
    );
  }



  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      backgroundColor: CupertinoColors.secondarySystemBackground,
      navigationBar: CupertinoNavigationBar(
        middle: Text(
          widget.index == null ? 'New Contact' : 'Contact Detail',
          style: TextStyle(fontWeight: FontWeight.w900),
        ),
        leading: CupertinoButton(
          child: Text('Cancel'),
          padding: EdgeInsets.zero,
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        trailing: CupertinoButton(
          child: Text(widget.index == null ? 'Done' : 'Edit'),
          padding: EdgeInsets.zero,
          onPressed: () {
            final contactsProvider = Provider.
            of<ContactsProvider>(context, listen: false);
            List<String> phoneNumbers = phoneControllers.map((controller)
            => controller.text).toList();

            if (widget.index == null) {
              contactsProvider.addContact(
                firstName: firstNameController.text,
                lastName: lastNameController.text,
                company: companyController.text,
                phone: phoneNumbers.join(','),
                email: emailController.text,
                ringtone: ringtoneController.text,
                textTone: textToneController.text,
                url: urlController.text,
                address: addressController.text,
                birthday: parseDate(birthdayController.text),
                addDate: parseDate(addDateController.text),
                relatedName: relatedNameController.text,
                socialProfile: socialProfileController.text,
                instantMessage: instantMessageController.text,
                note: noteController.text,
              );
            } else {
              contactsProvider.updateContact(
                widget.index!,
                firstName: firstNameController.text,
                lastName: lastNameController.text,
                company: companyController.text,
                phone: phoneNumbers.join(','),
                email: emailController.text,
                ringtone: ringtoneController.text,
                textTone: textToneController.text,
                url: urlController.text,
                address: addressController.text,
                birthday: parseDate(birthdayController.text),
                addDate: parseDate(addDateController.text),
                relatedName: relatedNameController.text,
                socialProfile: socialProfileController.text,
                instantMessage: instantMessageController.text,
                note: noteController.text,
              );
            }
            Navigator.pop(context);
          },
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: () {
                      // 이미지 선택 로직
                    },
                    // 원 형태의 터치 영역
                    child: Stack(
                      alignment: Alignment.bottomRight,
                      children: [
                        Container(
                          width: MediaQuery.of(context).size.width * 0.1,
                          height: MediaQuery.of(context).size.width * 0.1,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: CupertinoColors.systemGrey, // 원의 색상을 지정
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 8), // 원과 텍스트 사이의 간격 조절
                  GestureDetector(
                    onTap: () {
                      // 이미지 선택 로직
                    },
                    child: Text(
                      profileImage == null ? 'Add photo' : 'edit photo',
                      style: TextStyle(
                        fontSize: 15,
                        color: CupertinoColors.activeBlue,
                        decoration: TextDecoration.none,  // 노란색 밑줄 제거
                      ),
                    ),
                  ),
                ],
              ),
            ),

            SizedBox(height: 8),


            Column(
              children: [
                CupertinoTextField(
                  controller: firstNameController,
                  placeholder: 'First Name',
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 15),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border(
                      top: BorderSide(
                        color: Colors.grey,
                        width: 0.8,
                      ),
                      bottom: BorderSide(
                        color: Colors.grey,
                      ),
                    ),
                  ),
                  style: TextStyle(fontWeight: FontWeight.bold),
                  placeholderStyle: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey),
                ),
                CupertinoTextField(
                  controller: lastNameController,
                  placeholder: 'Last Name',
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 15),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border(
                      top: BorderSide(
                        color: Colors.grey,
                        width: 0.8,
                      ),
                      bottom: BorderSide(
                        color: Colors.grey,
                      ),
                    ),
                  ),
                  style: TextStyle(fontWeight: FontWeight.bold),
                  placeholderStyle: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey),
                ),
                CupertinoTextField(
                  controller: companyController,
                  placeholder: 'Company',
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 15), // remove horizontal padding
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border(
                      top: BorderSide(
                        color: Colors.grey,
                      ),
                      bottom: BorderSide(
                        color: Colors.grey,
                        width: 0.8,
                      ),
                    ),
                  ),
                  style: TextStyle(fontWeight: FontWeight.bold),
                  placeholderStyle: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey),
                ),
              ],
            ),

            SizedBox(height: 50.0,),

            GestureDetector(
              onTap: () {
                setState(() {
                  phoneControllers.add(TextEditingController());
                });
              },
              child: Column(
                children: [
                  ...phoneControllers.map((controller) =>
                      Slidable(
                        controller: slidableController,
                        actionPane: SlidableDrawerActionPane(),
                        actionExtentRatio: 0.25,
                        secondaryActions: <Widget>[
                          IconSlideAction(
                            caption: 'Delete',
                            color: CupertinoColors.systemRed,
                            icon: CupertinoIcons.ellipsis,
                            onTap: () {
                              setState(() {
                                phoneControllers.remove(controller);
                              });
                            },
                          ),
                        ],
                        child: AnimatedContainer(
                          height: 60,
                          duration: Duration(milliseconds: 300),
                          child: CupertinoTextField(
                            controller: controller,
                            onTap: () {
                              FocusScope.of(context).unfocus();
                            },
                            placeholder: 'add phone',
                            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              border: Border(
                                top: BorderSide(
                                  color: Colors.grey,
                                  width: 1.0,
                                ),
                                bottom: BorderSide(
                                  color: Colors.grey,
                                  width: 1.0,
                                ),
                              ),
                            ),
                            style: TextStyle(fontWeight: FontWeight.bold),
                            placeholderStyle: TextStyle(fontWeight: FontWeight.bold, color: Colors.grey),
                            prefix: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                SizedBox(width: 10),
                                _buildDeleteIcon(controller), // Here, pass the controller as an argument
                                SizedBox(width: 6),
                                _buildCategoryBox(context),
                              ],
                            ),

                          ),
                        ),
                      )
                  ).toList(),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border(
                        bottom: BorderSide(
                          color: Colors.grey,
                          width: 1.0,
                        ),
                      ),
                    ),
                    child: Row(
                      children: [
                        _buildAddIcon(),
                        SizedBox(width: 16.0),
                        Text(
                          'add phone',
                          style: TextStyle(
                            color: CupertinoColors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 15.0,
                            decoration: TextDecoration.none,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),


            SizedBox(height: 50.0),

            GestureDetector(
              onTap: () {
                setState(() {
                  emailControllers.add(TextEditingController());
                });
              },
              child: Column(
                children: [
                  ...emailControllers.map((controller) =>
                      Slidable(
                        controller: slidableController,
                        actionPane: SlidableDrawerActionPane(),
                        actionExtentRatio: 0.25,
                        secondaryActions: <Widget>[
                          IconSlideAction(
                            caption: 'Delete',
                            color: CupertinoColors.systemRed,
                            icon: CupertinoIcons.ellipsis,
                            onTap: () {
                              setState(() {
                                emailControllers.remove(controller);
                              });
                            },
                          ),
                        ],
                        child: AnimatedContainer(
                          height: 60,
                          duration: Duration(milliseconds: 300),
                          child: CupertinoTextField(
                            controller: controller,
                            placeholder: 'add email',
                            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              border: Border(
                                top: BorderSide(
                                  color: Colors.grey,
                                  width: 1.0,
                                ),
                                bottom: BorderSide(
                                  color: Colors.grey,
                                  width: 1.0,
                                ),
                              ),
                            ),
                            style: TextStyle(fontWeight: FontWeight.bold),
                            placeholderStyle: TextStyle(fontWeight: FontWeight.bold, color: Colors.grey),
                          ),
                        ),
                      )
                  ).toList(),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border(
                        bottom: BorderSide(
                          color: Colors.grey,
                          width: 1.0,
                        ),
                      ),
                    ),
                    child: Row(
                      children: [
                        _buildAddIcon(),
                        SizedBox(width: 16.0),
                        Text(
                          'add email',
                          style: TextStyle(
                            color: CupertinoColors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 15.0,
                            decoration: TextDecoration.none,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            SizedBox(height: 50.0),

            CupertinoTextField(
              controller: ringtoneController,
              placeholder: 'Ringtone',
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border(
                  top: BorderSide(
                    color: Colors.grey,
                    width: 0.8,
                  ),
                  bottom: BorderSide(
                    color: Colors.grey,
                  ),
                ),
              ),
              style: TextStyle(fontWeight: FontWeight.bold),
              placeholderStyle: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                  color: Colors.black),// 볼드체 스타일 적용
            ),

            SizedBox(height: 50.0),

            CupertinoTextField(
              controller: textToneController,
              placeholder: 'Text Tone',
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border(
                  top: BorderSide(
                    color: Colors.grey,
                    width: 0.8,
                  ),
                  bottom: BorderSide(
                    color: Colors.grey,
                  ),
                ),
              ),
              style: TextStyle(fontWeight: FontWeight.bold),
              placeholderStyle: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                  color: Colors.black),
            ),

            SizedBox(height: 50.0),

            GestureDetector(
              onTap: _toggleUrlField,
              child: Column(
                children: [
                  AnimatedContainer(
                    height: showUrlField ? 60 : 0,
                    duration: Duration(milliseconds: 300),
                    child: CupertinoTextField(
                      controller: urlController,
                      placeholder: 'add url',
                      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border(
                          top: BorderSide(
                            color: Colors.grey,
                            width: 1.0,
                          ),
                          bottom: BorderSide(
                            color: Colors.grey,
                            width: 1.0,
                          ),
                        ),
                      ),
                      style: TextStyle(fontWeight: FontWeight.bold),
                      placeholderStyle: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.grey),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border(
                        bottom: BorderSide(
                          color: Colors.grey,
                          width: 1.0,
                        ),
                      ),
                    ),
                    child: Row(
                      children: [
                        _buildAddIcon(),
                        SizedBox(width: 16.0),
                        Text(
                          'add url',
                          style: TextStyle(
                            color: CupertinoColors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 15.0,
                            decoration: TextDecoration.none,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            SizedBox(height: 50.0),

            GestureDetector(
              onTap: _toggleAddressField,
              child: Column(
                children: [
                  AnimatedContainer(
                    height: showAddressField ? 60 : 0,
                    duration: Duration(milliseconds: 300),
                    child: CupertinoTextField(
                      controller: addressController,
                      placeholder: 'add address',
                      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border(
                          top: BorderSide(
                            color: Colors.grey,
                            width: 1.0,
                          ),
                          bottom: BorderSide(
                            color: Colors.grey,
                            width: 1.0,
                          ),
                        ),
                      ),
                      style: TextStyle(fontWeight: FontWeight.bold),
                      placeholderStyle: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.grey),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border(
                        bottom: BorderSide(
                          color: Colors.grey,
                          width: 1.0,
                        ),
                      ),
                    ),
                    child: Row(
                      children: [
                        _buildAddIcon(),
                        SizedBox(width: 16.0),
                        Text(
                          'add address',
                          style: TextStyle(
                            color: CupertinoColors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 15.0,
                            decoration: TextDecoration.none,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            SizedBox(height: 50.0),

            GestureDetector(
              onTap: _toggleBirthdayField,
              child: Column(
                children: [
                  AnimatedContainer(
                    height: showBirthdayField ? 60 : 0,
                    duration: Duration(milliseconds: 300),
                    child: CupertinoTextField(
                      controller: birthdayController,
                      placeholder: 'add birthday',
                      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border(
                          top: BorderSide(
                            color: Colors.grey,
                            width: 1.0,
                          ),
                          bottom: BorderSide(
                            color: Colors.grey,
                            width: 1.0,
                          ),
                        ),
                      ),
                      style: TextStyle(fontWeight: FontWeight.bold),
                      placeholderStyle: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.grey),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border(
                        bottom: BorderSide(
                          color: Colors.grey,
                          width: 1.0,
                        ),
                      ),
                    ),
                    child: Row(
                      children: [
                        _buildAddIcon(),
                        SizedBox(width: 16.0),
                        Text(
                          'add birthday',
                          style: TextStyle(
                            color: CupertinoColors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 15.0,
                            decoration: TextDecoration.none,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            SizedBox(height: 50.0),

            GestureDetector(
              onTap: _toggleDateField,
              child: Column(
                children: [
                  AnimatedContainer(
                    height: showDateField ? 60 : 0,
                    duration: Duration(milliseconds: 300),
                    child: CupertinoTextField(
                      controller: addDateController,
                      placeholder: 'add date',
                      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border(
                          top: BorderSide(
                            color: Colors.grey,
                            width: 1.0,
                          ),
                          bottom: BorderSide(
                            color: Colors.grey,
                            width: 1.0,
                          ),
                        ),
                      ),
                      style: TextStyle(fontWeight: FontWeight.bold),
                      placeholderStyle: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.grey),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border(
                        bottom: BorderSide(
                          color: Colors.grey,
                          width: 1.0,
                        ),
                      ),
                    ),
                    child: Row(
                      children: [
                        _buildAddIcon(),
                        SizedBox(width: 16.0),
                        Text(
                          'add date',
                          style: TextStyle(
                            color: CupertinoColors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 15.0,
                            decoration: TextDecoration.none,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            SizedBox(height: 50.0),

            GestureDetector(
              onTap: _toggleRelatedNameField,
              child: Column(
                children: [
                  AnimatedContainer(
                    height: showRelatedNameField ? 60 : 0,
                    duration: Duration(milliseconds: 300),
                    child: CupertinoTextField(
                      controller: relatedNameController,
                      placeholder: 'add related name',
                      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border(
                          top: BorderSide(
                            color: Colors.grey,
                            width: 1.0,
                          ),
                          bottom: BorderSide(
                            color: Colors.grey,
                            width: 1.0,
                          ),
                        ),
                      ),
                      style: TextStyle(fontWeight: FontWeight.bold),
                      placeholderStyle: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.grey),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border(
                        bottom: BorderSide(
                          color: Colors.grey,
                          width: 1.0,
                        ),
                      ),
                    ),
                    child: Row(
                      children: [
                        _buildAddIcon(),
                        SizedBox(width: 16.0),
                        Text(
                          'add related name',
                          style: TextStyle(
                            color: CupertinoColors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 15.0,
                            decoration: TextDecoration.none,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            SizedBox(height: 50.0),

            GestureDetector(
              onTap: _toggleSocialProfileField,
              child: Column(
                children: [
                  AnimatedContainer(
                    height: showSocialProfileField ? 60 : 0,
                    duration: Duration(milliseconds: 300),
                    child: CupertinoTextField(
                      controller: socialProfileController,
                      placeholder: 'add social profile',
                      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border(
                          top: BorderSide(
                            color: Colors.grey,
                            width: 1.0,
                          ),
                          bottom: BorderSide(
                            color: Colors.grey,
                            width: 1.0,
                          ),
                        ),
                      ),
                      style: TextStyle(fontWeight: FontWeight.bold),
                      placeholderStyle: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.grey),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border(
                        bottom: BorderSide(
                          color: Colors.grey,
                          width: 1.0,
                        ),
                      ),
                    ),
                    child: Row(
                      children: [
                        _buildAddIcon(),
                        SizedBox(width: 16.0),
                        Text(
                          'add social profile',
                          style: TextStyle(
                            color: CupertinoColors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 15.0,
                            decoration: TextDecoration.none,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            SizedBox(height: 50.0),

            GestureDetector(
              onTap: _toggleInstantMessageField,
              child: Column(
                children: [
                  AnimatedContainer(
                    height: showInstantMessageField ? 60 : 0,
                    duration: Duration(milliseconds: 300),
                    child: CupertinoTextField(
                      controller: instantMessageController,
                      placeholder: 'add instant message',
                      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border(
                          top: BorderSide(
                            color: Colors.grey,
                            width: 1.0,
                          ),
                          bottom: BorderSide(
                            color: Colors.grey,
                            width: 1.0,
                          ),
                        ),
                      ),
                      style: TextStyle(fontWeight: FontWeight.bold),
                      placeholderStyle: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.grey),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border(
                        bottom: BorderSide(
                          color: Colors.grey,
                          width: 1.0,
                        ),
                      ),
                    ),
                    child: Row(
                      children: [
                        _buildAddIcon(),
                        SizedBox(width: 16.0),
                        Text(
                          'add instant message',
                          style: TextStyle(
                            color: CupertinoColors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 15.0,
                            decoration: TextDecoration.none,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            SizedBox(height: 50.0),

            Container(
              height: 120.0, // 원하는 높이 값으로 설정
              child: CupertinoTextField(
                controller: noteController,
                placeholder: 'Notes',
                padding: EdgeInsets.only(left: 10, top: 10), // top 패딩을 추가하여 위로 올림
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border(
                    top: BorderSide(
                      color: Colors.grey,
                      width: 0.8,
                    ),
                    bottom: BorderSide(
                      color: Colors.grey,
                    ),
                  ),
                ),
                style: TextStyle(fontWeight: FontWeight.bold),
                placeholderStyle: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    color: Colors.black),
                textAlignVertical: TextAlignVertical.top, // 텍스트를 위로 정렬
              ),
            ),



            SizedBox(height: 50.0),

            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  CupertinoPageRoute(builder: (context) => NewFieldSelectionPage()),
                );
              },
              child: Container(
                height: 50.0,
                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10), // 패딩 추가
                decoration: BoxDecoration(
                  color: Colors.white,  // 백그라운드 컬러를 흰색으로 설정
                  border: Border(
                    top: BorderSide(
                      color: Colors.grey,
                      width: 1.0,
                    ),
                    bottom: BorderSide(
                      color: Colors.grey,
                      width: 1.0,
                    ),
                  ),
                ),
                child: Row(
                  children: [
                    SizedBox(width: 16.0),
                    Text(
                      'add field',
                      style: TextStyle(
                        color: CupertinoColors.activeBlue,
                        fontWeight: FontWeight.bold, // 폰트 가중치 조절
                        fontSize: 17.0, // 폰트 크기 조절
                        decoration: TextDecoration.none,
                      ),
                    ),
                  ],
                ),
              ),
            ),

            SizedBox(height: 50.0),
          ],
        ),
      ),
    );
  }
}
import 'package:flutter/material.dart';

class DialerPad extends StatelessWidget {
  final TextEditingController phoneController;

  DialerPad({required this.phoneController});

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: 3,
      children: List.generate(12, (index) {
        return DialerButton(
          text: index < 9 ? '${index + 1}' : index == 9 ? '*' : index == 10 ? '0' : '#',
          onTap: () {
            phoneController.text += index < 9 ? '${index + 1}' : index == 9 ? '*' : index == 10 ? '0' : '#';
          },
        );
      }),
    );
  }
}

class DialerButton extends StatelessWidget {
  final String text;
  final VoidCallback onTap;

  DialerButton({required this.text, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Center(
        child: Text(
          text,
          style: TextStyle(fontSize: 36),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:talbat1/Util/my_button.dart';

class DialogBox extends StatelessWidget {
  final TextEditingController controller;
  final void Function() onsave;
  final void Function() onCancel;

  const DialogBox({
    super.key,
    required this.controller,
    required this.onsave,
    required this.onCancel,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.amber,
      content: SizedBox(
        height: 120,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            TextField(
              controller: controller,
              decoration: const InputDecoration(
                  border: OutlineInputBorder(), hintText: "Add new task"),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                MyButton(
                  text: 'Save',
                  onPressed: onsave,
                ),
                const SizedBox(width: 88),
                MyButton(text: 'Cancel', onPressed: onCancel)
              ],
            )
          ],
        ),
      ),
    );
  }
}

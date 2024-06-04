

import 'package:flutter/material.dart';

mixin ViewTextField {
  textField(String hintTexts,
      [TextEditingController? controller]) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
            hintText: hintTexts),
      ),
    );
  }
}

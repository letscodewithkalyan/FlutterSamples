import 'package:flutter/material.dart';

class EntryWidget extends StatelessWidget {
  const EntryWidget({super.key});
  @override
  Widget build(BuildContext context) {
    debugPrint('EntryWidget built'); // ✅ runs at runtime, legal
    return Text("EntryWidget");
  }
}

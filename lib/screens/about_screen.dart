import 'package:flutter/material.dart';
import 'package:studize/components/drawer.dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        drawer: primaryDrawer(context),
        appBar: AppBar(
          title: const Text('About us'),
        ),
      ),
    );
  }
}

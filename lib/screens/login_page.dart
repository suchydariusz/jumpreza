import 'package:flutter/material.dart';

import '../widgets/appbar.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: const Size.fromHeight(50.0), child: CustomAppBar()),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(8.0),
          child: Text('''
Strona logowania
          '''),
        ),
      ),
    );
  }
}

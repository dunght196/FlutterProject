import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {

}

class ScreenArguments {
  final String title;
  final String message;

  ScreenArguments(this.title, this.message);

}

class ExtractArgumentsScreen extends StatelessWidget {
  static const routeName = '/extractArguments';

  @override
  Widget build(BuildContext context) {
    final ScreenArguments args =  ModalRoute.of(context).settings.arguments;

    return Scaffold(
      appBar: AppBar(
        title: Text(args.title),
      ),
      body: Center(
        child: Text(args.message),
      ),
    );
  }

}


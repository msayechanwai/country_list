import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class FailedWidget extends StatelessWidget {
  const FailedWidget({super.key, required this.errorMessage, required this.tryAgain});
  final String errorMessage;
  
  final Function() tryAgain;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.max,
      children: [
        Padding(padding: const EdgeInsets.all(8.0),
        child: Text(errorMessage),
        ),
        FilledButton(onPressed: tryAgain,
         child: const Text('Try Again'),
        ),
      ],
    );
  }
}
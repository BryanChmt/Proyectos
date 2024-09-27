import 'package:flutter/material.dart';
import 'package:tecnomotriz/widgets/next.dart';

class NextPage extends StatelessWidget { 
  
  const NextPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
 
    return Scaffold(
      body: Stack(
        children: [
          Container(
            color: Colors.grey[50],
          ),
          Center(child: NextContent())
        ],
      ),
    );
  }
}

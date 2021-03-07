import 'package:flutter/material.dart';
import '../pallete.dart';

class RoundedButton extends StatelessWidget {
  const RoundedButton({
    Key key,
    @required this.buttonName,
    @required this.myFunction,
    this.isGoogle,
  }) : super(key: key);

  final String buttonName;
  final Function myFunction;
  final isGoogle;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      height: size.height * 0.08,
      width: size.width * 0.8,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: isGoogle ? Colors.red : kBlue,
      ),
      child: TextButton(
        onPressed: myFunction,
        child: Text(
          buttonName,
          style: kBodyTextButton.copyWith(fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}

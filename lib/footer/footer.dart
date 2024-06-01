import 'package:flutter/material.dart';
import 'package:mobiletv/decoration/boxdecoration.dart';

class Footer extends StatelessWidget {
  const Footer({
    super.key,
    required this.mytextStyle,
  });

  final TextStyle? mytextStyle;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 160,
      width: double.infinity,
      decoration: boxDecoration,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: RichText(
            text: TextSpan(
                text: "DISCLAIMER :",
                style: mytextStyle!.copyWith(
                  color: Colors.black,
                  decoration: TextDecoration.underline,
                  decorationColor: Colors.black,
                ),
                children: [
              TextSpan(
                  text:
                      "\nIt is our policy to respond to clear notices of alleged copyright infringement. If you are a copyright owner or an agent thereof, and you believe that any content hosted on our web site (mobileTv) infringes your copyrights, then you may submit a notification for us in email (tapendrabista01@gmail.com)",
                  style: mytextStyle!.copyWith(fontSize:15, color: Colors.black))
            ])),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:webtv/decoration/boxdecoration.dart';

class Footer extends StatefulWidget {  // bottom part or footer about disclaimer
  const Footer({
    super.key,
    required this.mytextStyle,
  });

  final TextStyle? mytextStyle;

  @override
  State<Footer> createState() => _FooterState();
}

class _FooterState extends State<Footer> {
  @override
  Widget build(BuildContext context) {
        var primaryColor = Theme.of(context).primaryColor;
    return Container(
     
      width: double.infinity,
      decoration: boxDecoration,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: RichText(
            text: TextSpan(
                text: "DISCLAIMER :",
                style: widget.mytextStyle!.copyWith(
                  color: primaryColor,
                  decoration: TextDecoration.underline,
                  decorationColor:primaryColor,
                ),
                children: [
              TextSpan(
                  text:
                      "\nIt is our policy to respond to clear notices of alleged copyright infringement. If you are a copyright owner or an agent thereof, and you believe that any content hosted on our web site (webtv) infringes your copyrights, then you may submit a notification for us in email (tapendrabista01@gmail.com)",
                  style: widget.mytextStyle!.copyWith(fontSize:15, color:primaryColor))
            ])),
      ),
    );
  }
}

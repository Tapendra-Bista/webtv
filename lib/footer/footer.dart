import 'package:flutter/material.dart';
import 'package:webtv/decoration/boxdecoration.dart';

class Footer extends StatelessWidget {  // bottom part or footer about disclaimer
  const Footer({
    super.key,
    required this.mytextStyle,
  });

  final TextStyle? mytextStyle;

  @override
  Widget build(BuildContext context) {
        var primaryColor = Theme.of(context).primaryColor;
    return Container(
     
      width: double.infinity,
      decoration: boxDecoration,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            RichText(
            
                text: TextSpan(
                    text: "DISCLAIMER :",
                    style: mytextStyle!.copyWith(
                      color: primaryColor,
                      decoration: TextDecoration.underline,
                      decorationColor:primaryColor,
                    ),
                    
                    children: [
                  TextSpan(
                      text:
                          "\nIt is our policy to respond to clear notices of alleged copyright infringement. If you are a copyright owner or an agent thereof, and you believe that any content hosted on our web site (webtv) infringes your copyrights, then you may submit a notification for us (webtv group)",
                      style: mytextStyle!.copyWith(fontSize:15, color:primaryColor)),
                     
                      
                ])),
                Center(child: Text("\n© jun-2024.all rights reserved. designed and developed by: webtv group",style: mytextStyle!.copyWith(fontSize:18, color:primaryColor,)))
          ],
        ),
      ),
    );
  }
}

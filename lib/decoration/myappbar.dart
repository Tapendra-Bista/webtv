import 'package:flutter/material.dart';

AppBar myAppBar(context,String title){

return  AppBar(  // appbar with custom design
          leadingWidth:MediaQuery.of(context).size.width*0.2,
       leading: Align(
          alignment: Alignment.bottomLeft,
          child: Container(
            height:100,
            color:Colors.white,
            child: Image.asset("image/tv.png",))),
        automaticallyImplyLeading: false,
        centerTitle: true,
        backgroundColor:Theme.of(context).primaryColor,
        title: Text(title,
            style: Theme.of(context).textTheme.headlineMedium!.copyWith(color:Colors.white,fontWeight: FontWeight.normal,fontSize:30)),
      );

}
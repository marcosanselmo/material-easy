library material_easy;

import 'package:flutter/material.dart';

Widget EditText({
    @required TextEditingController controller,
    var validator ,
    TextAlign textAling = TextAlign.justify,
    Color backgroudColor,
    Color textColor = Colors.black,
    String hintText,
    double fontSize = 16.0,
    Color hintColor = const Color.fromRGBO(206, 206, 206, 1),
    EdgeInsets padding,
    double borderWidht = 2.0,
    double borderRadius = 5.0,
    Color borderColor = Colors.black,
    double focusedBorderWidht,
    double focusedBorderRadius,
    Color focusedBorderColor,
    bool obscureText = false,
  }){
  
  return TextFormField(
    obscureText: obscureText,
    style: TextStyle(
      fontSize: fontSize,
      color: textColor,
    ),
    textAlign: textAling,
    decoration: InputDecoration(
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular((focusedBorderRadius == null)?borderRadius:focusedBorderRadius),
        borderSide: BorderSide(
          width: (focusedBorderWidht == null)?borderWidht:focusedBorderWidht,
          color: (focusedBorderColor == null)?borderColor:focusedBorderColor
        )
      ),
      filled: true,
      fillColor: backgroudColor,
      hintText: hintText,
      hintStyle: TextStyle(color: hintColor),
      contentPadding: padding,
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(
          width: borderWidht,
          color: borderColor
        ),
        borderRadius: BorderRadius.circular(borderRadius)
      )
    ),
    controller: controller,
    validator: validator,
  );
}

Widget Button(context,{
    @required var onPressed,
    EdgeInsets padding,
    String textValue = 'button',
  }){
  return RaisedButton(
    onPressed: onPressed,
    padding: padding,
    child: Text(textValue),
    color: Theme.of(context).accentColor,
    shape: RoundedRectangleBorder(
      borderRadius: new BorderRadius.circular(30.0)
      ),
  );
}
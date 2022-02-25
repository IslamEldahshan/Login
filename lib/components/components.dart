import 'package:flutter/material.dart';

Widget defaultButton({
  double width = double.infinity,
  Color background = Colors.blue,
  required Function function,
  required String text,
  bool isUpperCase = true,
  double radius = 10.0,

}) => Container(
  width: width,
  height: 50.0,
  child: MaterialButton(
    onPressed: (){
      function();
    },
    child: Text(
      isUpperCase? text.toUpperCase() : text,
      style: const TextStyle(
        color: Colors.white,
        fontSize: 20.0,
      ),
    ),
  ),
  decoration: BoxDecoration(
    color: background,
    borderRadius: BorderRadius.circular(radius,),
  ),
);


Widget defaultFormField({
  required TextEditingController controller,
  required TextInputType type,
  Function? onchange,
  required validate,
  required String label,
  required IconData prefix,
  IconData? suffix,
  bool isPassword = false,
  Function? suffixPressed,

}) => TextFormField(
  validator: validate,
  controller: controller,
  keyboardType: type,
  obscureText: isPassword,
  onChanged: (value){
    onchange!();
  },
  decoration:  InputDecoration(
    labelText: label,
    border: const OutlineInputBorder(),
    prefixIcon: Icon(
      prefix,
    ),
    suffixIcon: IconButton(
      onPressed: (){
        suffixPressed!();
      },
      icon: Icon(
        suffix,
      ),
    ),
  ),
);
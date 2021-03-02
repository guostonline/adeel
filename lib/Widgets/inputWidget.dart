

  import 'package:autocomplete_textfield/autocomplete_textfield.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ship_me/Constant/Ville.dart';
import 'package:ship_me/Logics/Demande.dart';


Demande _controller = Get.put(Demande());
Widget myInputField({TextEditingController txtContorller, String title,bool isPassword = false,myFunction}) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            title,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
          ),
          SizedBox(
            height: 10,
          ),
          TextField(
              
              controller: txtContorller,
              obscureText: isPassword,
              decoration: InputDecoration(
                  border: InputBorder.none,
                  fillColor: Color(0xfff3f3f4),
                  filled: true))
        ],
      ),
    );
  }

  Widget autoComplete(context,TextEditingController textEditingController,String name){
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      DefaultTextStyle(
          style: TextStyle(fontSize: 20,color: Colors.black),
          child: Text(name=="localite"?"De?":"Vert?")),
      AutoCompleteTextField(
        controller: textEditingController,
          itemSubmitted:(item){
          textEditingController.text=item;
         if (name=="localite") _controller.localite=item;
         if (name=="destination") _controller.destination=item;
          },
          key: null,
          clearOnSubmit: false,
          decoration:   InputDecoration(
          border: InputBorder.none,
          fillColor: Color(0xfff3f3f4),
          filled: true),
          suggestions: ville,
          itemBuilder: (context,item)=>Container(
            padding: EdgeInsets.all(15),
            child: Row(
              children: [
                Text(
                  item
                ),
              ],
            ),
          ),
          itemSorter: (a,b)=>a.compareTo(b),
          itemFilter: (item,query)=>item.toLowerCase().startsWith(query.toLowerCase()),
          ),
    ],
  );
  }

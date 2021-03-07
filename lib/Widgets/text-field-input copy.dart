import 'package:autocomplete_textfield/autocomplete_textfield.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ship_me/Constant/Ville.dart';
import 'package:ship_me/Logics/Demande.dart';
import '../pallete.dart';

Demande _controller = Get.put(Demande());

class TextInputFieldAutocomplet extends StatelessWidget {
  const TextInputFieldAutocomplet({
    Key key,
    @required this.icon,
    @required this.hint,
    @required this.controller,
    @required this.isDepart,
    this.inputType,
    this.inputAction,
  }) : super(key: key);
  final TextEditingController controller;
  final IconData icon;
  final String hint;
  final TextInputType inputType;
  final TextInputAction inputAction;
  final bool isDepart;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: Container(
        height: size.height * 0.08,
        width: size.width * 0.8,
        decoration: BoxDecoration(
          color: Colors.grey[500].withOpacity(0.5),
          borderRadius: BorderRadius.circular(16),
        ),
        child: Center(
          child: AutoCompleteTextField(
            controller: controller,
            itemSubmitted: (item) {
              controller.text = item;
              isDepart
                  ? _controller.localite.value = item
                  : _controller.destination.value = item;
            },
            key: null,
            clearOnSubmit: false,
            decoration: InputDecoration(
              fillColor: Colors.red,
              border: new OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                  borderSide: new BorderSide(color: Colors.orange)),
            ),
            suggestions: ville,
            itemBuilder: (context, item) => Container(
              padding: EdgeInsets.all(15),
              child: Row(
                children: [
                  Text(item),
                ],
              ),
            ),
            itemSorter: (a, b) => a.compareTo(b),
            itemFilter: (item, query) =>
                item.toLowerCase().startsWith(query.toLowerCase()),
          ),
        ),
      ),
    );
  }
}

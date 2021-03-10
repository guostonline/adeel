import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ship_me/Logics/Demande.dart';
import 'package:flutter_switch/flutter_switch.dart';

Demande _controller = Get.put(Demande());
TextEditingController _txtNombreChambre;

class TransportDeMarchandise extends StatelessWidget {
  const TransportDeMarchandise({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Visibility(
        visible: true,
        child: Container(
          child: Column(
            children: [
              Row(
                children: [
                  Expanded(flex: 3, child: Text("Quantités des colis : ")),
                  Container(
                    height: 40,
                    width: 40,
                    child: TextField(
                      textAlign: TextAlign.right,
                      onChanged: (value) =>
                          _controller.numberSalon.value = int.parse(value),
                      controller: _txtNombreChambre,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10.0)),
                          borderSide: BorderSide(color: Colors.grey),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10.0)),
                          borderSide: BorderSide(color: Colors.grey),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 15),
              Row(
                children: [
                  Expanded(flex: 3, child: Text("Poids total des colis : ")),
                  Container(
                    height: 40,
                    width: 40,
                    child: TextField(
                      textAlign: TextAlign.right,
                      onChanged: (value) =>
                          _controller.numberSalon.value = int.parse(value),
                      controller: _txtNombreChambre,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10.0)),
                          borderSide: BorderSide(color: Colors.grey),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10.0)),
                          borderSide: BorderSide(color: Colors.grey),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Demande de facture : "),
                  FlutterSwitch(
                    showOnOff: true,
                    inactiveColor: Colors.grey,
                    activeColor: Colors.green,
                    onToggle: (bool value) {
                      _controller.chargeDecharge.value = value;
                      print(_controller.chargeDecharge.value);
                    },
                    value: _controller.chargeDecharge.value,
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

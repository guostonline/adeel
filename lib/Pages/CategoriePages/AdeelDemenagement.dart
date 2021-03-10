import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ship_me/Logics/Demande.dart';
import 'package:flutter_switch/flutter_switch.dart';

Demande _controller = Get.put(Demande());
TextEditingController _txtNombreChambre;

class AdeelDemenagement extends StatelessWidget {
  const AdeelDemenagement({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Visibility(
        visible: true,
        child: Container(
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Chargement - Déchargement : "),
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
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Montage - Démontage : "),
                  FlutterSwitch(
                    showOnOff: true,
                    inactiveColor: Colors.grey,
                    activeColor: Colors.green,
                    onToggle: (bool value) {
                      _controller.montageDementage.value = value;
                    },
                    value: _controller.montageDementage.value,
                  )
                ],
              ),
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Besoin d'emballage : "),
                  FlutterSwitch(
                    showOnOff: true,
                    inactiveColor: Colors.grey,
                    activeColor: Colors.green,
                    onToggle: (bool value) {
                      _controller.besoinEmbalage.value = value;
                    },
                    value: _controller.besoinEmbalage.value,
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
              SizedBox(height: 10),
              Row(
                children: [
                  Expanded(flex: 3, child: Text("Nombre de salons : ")),
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
              )
            ],
          ),
        ),
      ),
    );
  }
}

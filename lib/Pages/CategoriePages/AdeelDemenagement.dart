import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
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
                children: [
                  Expanded(flex: 3, child: Text("Nombre de salons : ")),
                  Expanded(
                    flex: 1,
                    child: TextField(
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

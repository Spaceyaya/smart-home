import 'package:flutter/material.dart';
import 'package:smarthome/model/button.dart';

import '../consts.dart';

import '../services/tab_service.dart';

class DevicesDefaultButton extends StatefulWidget {
  const DevicesDefaultButton({
    Key? key,
    required this.buttonsModel,
    
   //required this.isOff,
  }) : super(key: key);
  final ButtonsModel buttonsModel;
 //final bool isOff;


  @override
  State<DevicesDefaultButton> createState() => _DevicesDefaultButtonState();
}

class _DevicesDefaultButtonState extends State<DevicesDefaultButton> {
  updateButtons()
  {
    widget.buttonsModel.currentState =!widget.buttonsModel.currentState!;
    
  }
// final ButtonControler _buttonControler = ButtonControler();
// int index =0;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        TbBtnService().tbBtn(
            value: widget.buttonsModel.currentState == false
                ? widget.buttonsModel.onId!.toString()
                : widget.buttonsModel.offId!.toString());
                
                setState(() {
                  updateButtons();
                });

                
                
      },
      child: AnimatedSwitcher(
        switchInCurve: Curves.easeInOutBack,
        transitionBuilder: (child, animation) => ScaleTransition(
          scale: animation,
          child: child,
        ),
        duration: const Duration(milliseconds: 300),
        child: Container(
          height: 165 / 820 * height,
          width: 165 / 411 * width,
          decoration: BoxDecoration(
            border: Border.all(color: Colors.black.withOpacity(0.3)),
            color: widget.buttonsModel.currentState == true
                
                ? const Color(0xff2AB0F1)
                :const Color.fromARGB(255, 244, 244, 244),
            borderRadius: BorderRadius.circular(30),
          ),
          child: Stack(
            children: [
              Positioned(
                left: 0,
                top: 62 / 820 * height,
                right: 0,
                child: Column(
                  children: [
                    Text(
                      widget.buttonsModel.name!,
                      style: TextStyle(
                          fontSize: 31 / 411 * width,
                          color: widget.buttonsModel.currentState == false
                              ? Colors.black.withOpacity(0.3)
                              : Colors.white,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

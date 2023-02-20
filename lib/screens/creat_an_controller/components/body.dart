import 'package:flutter/cupertino.dart';
import 'package:smarthome/screens/creat_an_controller/components/sign_form.dart';

class CreatAnControllerBody extends StatelessWidget {
  const CreatAnControllerBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: const [
          SignForm(),
        ],
      ),
    );
  }
}

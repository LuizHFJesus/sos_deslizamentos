import 'package:flutter/material.dart';
import 'package:sos_deslizamentos/core/core.dart';
import 'package:sos_deslizamentos/modules/address_register/address_register_controller.dart';
import 'package:sos_deslizamentos/shared/models/user_model.dart';
import 'package:sos_deslizamentos/shared/shared_widgets.dart';

class AddressRegisterPage extends StatefulWidget {
  final UserModel user;

  const AddressRegisterPage({Key? key, required this.user}) : super(key: key);

  @override
  _AddressRegisterPageState createState() => _AddressRegisterPageState();
}

class _AddressRegisterPageState extends State<AddressRegisterPage> {
  final controller = AddressRegisterController();

  final inputController = TextEditingController();

  @override
  void initState() {
    controller.appStateNotifier.addListener(() {
      setState(() {});
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.appBackground,
      appBar: AppBarWidget(
        onTappedLeftButton: () {},
        onTappedRightButton: () {},
      ),
      body: controller.appState == AppState.loading
          ? CircularProgressWidget()
          : DefaultPageWidget(
              children: [
                TextHeaderWidget(label: "Cadastre o seu\nEndereço"),
                Form(
                  key: controller.formKey,
                  child: Column(
                    children: [
                      TextFieldWidget(
                        labelText: "Estado",
                        keyboardType: TextInputType.streetAddress,
                        validator: controller.validateState,
                        onChanged: (value) {
                          controller.onChange(state: value);
                        },
                      ),
                      SizedBox(height: 20),
                      TextFieldWidget(
                        labelText: "Cidade",
                        keyboardType: TextInputType.streetAddress,
                        validator: controller.validateCity,
                        onChanged: (value) {
                          controller.onChange(city: value);
                        },
                      ),
                      SizedBox(height: 20),
                      TextFieldWidget(
                        labelText: "Bairro",
                        keyboardType: TextInputType.streetAddress,
                        validator: controller.validateBairro,
                        onChanged: (value) {
                          controller.onChange(bairro: value);
                        },
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 40),
                FilledButtonWidget(
                  title: "Cadastrar Endereço",
                  onTap: () async {
                    await controller.registerAddress(context, widget.user);
                  },
                ),
              ],
            ),
    );
  }
}

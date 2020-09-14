import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:sos_deslizamentos_app/models/user_model.dart';
import 'package:sos_deslizamentos_app/widgets/custom_textFormField.dart';
import 'package:sos_deslizamentos_app/widgets/round_button.dart';


class FormAddressScreen extends StatefulWidget {
  @override
  _FormAddressScreen createState() => _FormAddressScreen();
}

class _FormAddressScreen extends State<FormAddressScreen> {

  final _cepController = TextEditingController();
  final _logradouroController = TextEditingController();
  final _bairroController = TextEditingController();
  final _cityController = TextEditingController();
  final _stateController = TextEditingController();

  final _formKey = GlobalKey<FormState>();
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        title: Text("Preencha seu endereço", style: TextStyle(fontWeight: FontWeight.bold),),
        centerTitle: true,
      ),

      body: ScopedModelDescendant<UserModel>(
        builder: (context, child, model) {

          return SingleChildScrollView(
            child: Form(
              key: _formKey,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  child: Column(
                    children: <Widget>[

                      Container(
                        padding: EdgeInsets.only(top: 20.0),
                        child: Text(
                          "Cadatre seu endereço",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 24.0,
                            fontWeight: FontWeight.w300
                          ),
                        ),
                      ),

                      CustomTextFormField(
                        title: "CEP",
                        controller: _cepController,
                        obscureText: false,
                        hintText: "00000-000",
                        prefixIcon: null,
                        suffixIcon: null,
                        inputType: TextInputType.text,
                        validator: RequiredValidator(errorText: " !")
                      ),
                      Divider(height: 16.0),

                      CustomTextFormField(
                        title: "Estado",
                        controller: _stateController,
                        obscureText: false,
                        hintText: " ",
                        prefixIcon: null,
                        suffixIcon: null,
                        inputType: TextInputType.text,
                        validator: RequiredValidator(errorText: " !")
                      ),
                      Divider(height: 16.0,),

                      CustomTextFormField(
                        title: "Cidade",
                        controller: _cityController,
                        obscureText: false,
                        hintText: " ",
                        prefixIcon: null,
                        suffixIcon: null,
                        inputType: TextInputType.text,
                        validator: RequiredValidator(errorText: " !")
                      ),
                      Divider(height: 16.0,),

                      CustomTextFormField(
                        title: "Bairro",
                        controller: _bairroController,
                        obscureText: false,
                        hintText: "Bairro",
                        prefixIcon: null,
                        suffixIcon: null,
                        inputType: TextInputType.text,
                        validator: RequiredValidator(errorText: " ")
                      ),
                      Divider(height: 16.0),

                      CustomTextFormField(
                        title: "Logradouro",
                        controller: _logradouroController,
                        obscureText: false,
                        hintText: "Nome da rua",
                        prefixIcon: null,
                        suffixIcon: null,
                        inputType: TextInputType.text,
                        validator: RequiredValidator(errorText: " ")
                      ),
                      Divider(height: 16.0),

                      Container( // cadastrar endereço
                        width: MediaQuery.of(context).size.width,
                        margin: EdgeInsets.only(top: 10.0),
                        alignment: Alignment.center,
                        child: RoundButton(
                          buttonText: "Cadastrar endereço",
                          backgroundColor: Theme.of(context).primaryColor,
                          textColor: Colors.white,
                          functionOnPressed: (){}
                        ),
                      ),

                    ]
                  ),
                ),
              ),
            ),
          );
        }
      )
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:sos_deslizamentos_app/models/user_model.dart';
import 'package:sos_deslizamentos_app/widgets/custom_textFormField.dart';
import 'package:sos_deslizamentos_app/widgets/round_button.dart';
import 'package:sos_deslizamentos_app/widgets/title_formField.dart';
import 'package:brasil_fields/brasil_fields.dart';


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
  String dropdownValue;

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
                padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 12.0),
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  child: Column(
                    children: <Widget>[

                      Row(
                        mainAxisSize: MainAxisSize.max,
                        children: <Widget>[
                          Expanded(
                            child: Column(
                              children: <Widget>[
                                TitleFormField(title: "CEP"),
                                CustomTextFormField(
                                  inputFormatter: CepInputFormatter(),
                                  controller: _cepController,
                                  obscureText: false,
                                  hintText: "00.000-000",
                                  prefixIcon: null,
                                  suffixIcon: null,
                                  inputType: TextInputType.number,
                                  validator: null
                                ),
                              ],
                            ),
                          ),

                          SizedBox(width: 16.0, ),

                          Expanded(
                            child: Column(
                              children: <Widget>[
                                TitleFormField(title: "Estado"),
                                Container(
                                  width: MediaQuery.of(context).size.width,
                                  child: DropdownButton(
                                    value: dropdownValue,
                                    isExpanded: true,
                                    underline: Container(
                                      height: 1,
                                      padding: EdgeInsets.only(top: 30.0, bottom: 0.0),
                                      color: Colors.grey,
                                    ),
                                    onChanged: (String newValue) {
                                      setState(() {
                                        dropdownValue = newValue;
                                      });
                                    },
                                    items: Estados.listaEstados.map((String value) {
                                      return DropdownMenuItem<String>(
                                        value: value,
                                        child: Text(value),
                                      );
                                    }).toList(),
                                  ),
                                ),
                              ],
                            ),
                          ) ,
                        ],
                      ),
                      Divider(height: 16.0),

                      Column(
                        children: <Widget>[
                          TitleFormField(title: "Cidade"),
                          CustomTextFormField(
                            inputFormatter: null,
                            controller: _cityController,
                            obscureText: false,
                            hintText: "Cidade",
                            prefixIcon: null,
                            suffixIcon: null,
                            inputType: TextInputType.text,
                            validator: RequiredValidator(errorText: " !")
                          ),
                        ],
                      ),
                      Divider(height: 16.0,),

                      Column(
                        children: <Widget>[
                          TitleFormField(title: "Bairro"),
                          CustomTextFormField(
                            inputFormatter: null,
                            controller: _bairroController,
                            obscureText: false,
                            hintText: "Bairro",
                            prefixIcon: null,
                            suffixIcon: null,
                            inputType: TextInputType.text,
                            validator: RequiredValidator(errorText: " ")
                          ),
                        ],
                      ),
                      Divider(height: 16.0),

                      Column(
                        children: <Widget>[
                          TitleFormField(title: "Logradouro"),
                          CustomTextFormField(
                            inputFormatter: null,
                            controller: _logradouroController,
                            obscureText: false,
                            hintText: "Nome da rua",
                            prefixIcon: null,
                            suffixIcon: null,
                            inputType: TextInputType.text,
                            validator: RequiredValidator(errorText: " ")
                          ),
                        ],
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

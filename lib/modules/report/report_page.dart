import 'package:flutter/material.dart';
import 'package:sos_deslizamentos/core/core.dart';
import 'package:sos_deslizamentos/modules/report/report_controller.dart';
import 'package:sos_deslizamentos/shared/models/user_model.dart';
import 'package:sos_deslizamentos/shared/shared_widgets.dart';

class ReportPage extends StatefulWidget {
  final UserModel user;

  const ReportPage({Key? key, required this.user}) : super(key: key);

  @override
  _ReportPageState createState() => _ReportPageState();
}

class _ReportPageState extends State<ReportPage> {
  final controller = ReportController();

  @override
  void initState() {
    controller.stateNotifier.addListener(() {
      setState(() {});
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    if (controller.state == AppState.loading)
      return Container(
          color: AppColors.appBackground, child: CircularProgressWidget());
    return Scaffold(
      backgroundColor: AppColors.appBackground,
      appBar: AppBarWidget(
          typeLeftButton: "back",
          onTappedLeftButton: () {
            Navigator.pop(context);
          },
          onTappedRightButton: () {}),
      body: DefaultPageWidget(
        children: [
          TextHeaderWidget(label: "Relate um Problema"),
          Form(
            key: controller.formKey,
            child: Column(
              children: [
                // TODO: Release pre-defined categories
                TextFieldWidget(
                  labelText: "Categoria",
                  keyboardType: TextInputType.text,
                  validator: controller.validateCategory,
                  onChanged: (value) {
                    controller.onChange(category: value);
                  },
                ),
                SizedBox(height: 20),
                // TODO: Allow image upload
                // SimpleButtonWidget(
                //   onTapped: () async {
                //     final imgFile = await ImagePicker()
                //         .getImage(source: ImageSource.gallery, imageQuality: 80);
                //     if (imgFile == null) return;
                //
                //   },
                //   title: "Compartilhe uma foto",
                //   icon: AppImages.angleRight,
                // ),
                // SizedBox(height: 20),
                TextFieldWidget(
                  labelText: "Descrição",
                  keyboardType: TextInputType.text,
                  maxLines: 5,
                  validator: controller.validateDescription,
                  onChanged: (value) {
                    controller.onChange(description: value);
                  },
                ),
                SizedBox(height: 40),
              ],
            ),
          ),
          FilledButtonWidget(
            title: "Relatar Problema",
            onTap: () async {
              await controller.registerReport(context, widget.user);
            },
          )
        ],
      ),
    );
  }
}

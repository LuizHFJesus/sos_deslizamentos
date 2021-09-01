import 'package:flutter/material.dart';
import 'package:sos_deslizamentos/core/core.dart';
import 'package:sos_deslizamentos/modules/ambient_education/ambient_education_controller.dart';
import 'package:sos_deslizamentos/modules/ambient_education/widgets/info_card/info_card_widget.dart';
import 'package:sos_deslizamentos/shared/shared_widgets.dart';

class AmbientEducationPage extends StatefulWidget {
  @override
  _AmbientEducationPageState createState() => _AmbientEducationPageState();
}

class _AmbientEducationPageState extends State<AmbientEducationPage> {
  final controller = AmbientEducationController();

  @override
  void initState() {
    super.initState();
    controller.getAmbientEducation();
    controller.stateNotifier.addListener(() {setState(() { });});
  }
  @override
  Widget build(BuildContext context) {

    if (controller.state == AppState.success) {
      return Scaffold(
          backgroundColor: AppColors.appBackground,
          appBar: AppBarWidget(
              typeLeftButton: "back",
              onTappedLeftButton: () { Navigator.pop(context); },
              onTappedRightButton: () {}),
          body: Column(
            children: [
              Expanded(
                child: GridView.count(
                    padding: EdgeInsets.all(20),
                    crossAxisCount: 2,
                    mainAxisSpacing: 20,
                    crossAxisSpacing: 20,
                    children: controller.ambientEducation!
                        .map((e) => InfoCardWidget(data: e)).toList()
                ),
              ),
            ],
          ));
    } else {
      return Scaffold(
        body: CircularProgressWidget()
      );
    }
  }
}

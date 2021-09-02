import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sos_deslizamentos/core/core.dart';
import 'package:sos_deslizamentos/modules/risk_form/risk_form_controller.dart';
import 'package:sos_deslizamentos/modules/risk_form/widgets/form_result/form_result_widget.dart';
import 'package:sos_deslizamentos/shared/models/user_model.dart';
import 'package:sos_deslizamentos/shared/widgets/risk_level_card/widgets/filled_card/filled_card_widget.dart';
import 'package:sos_deslizamentos/shared/widgets/risk_level_card/widgets/unfilled_card/unfilled_card_widget.dart';

class RiskLevelCardWidget extends StatefulWidget {
  final UserModel user;
  final bool isInFormResult;

  RiskLevelCardWidget({
    Key? key,
    required this.user,
    this.isInFormResult = false,
  }) : super(key: key);

  @override
  _RiskLevelCardWidgetState createState() => _RiskLevelCardWidgetState();
}

class _RiskLevelCardWidgetState extends State<RiskLevelCardWidget> {
  final controller = RiskFormController();

  @override
  void initState() {
    controller.getUserFormScore(widget.user);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.user.riskFormId != null
          ? () {
              // print(controller.userFormScore);
              controller.getUserFormScore(widget.user);
              if (!widget.isInFormResult)
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => FormResultWidget(
                              user: widget.user,
                              riskFormScore: controller.userFormScore,
                              pushedFrom: 2,
                            )));
            }
          : () {
              Navigator.pushNamed(context, "/risk_form",
                  arguments: widget.user);
            },
      child: Container(
          margin: EdgeInsets.symmetric(horizontal: 20),
          padding: EdgeInsets.symmetric(vertical: 30, horizontal: 20),
          decoration: BoxDecoration(
              color: widget.user.riskFormId != null
                  ? AppColors.white
                  : AppColors.primary,
              border: Border.all(
                  color: widget.user.riskFormId != null
                      ? AppColors.greyLight
                      : AppColors.primary),
              borderRadius: BorderRadius.circular(30),
              boxShadow: [AppShadows.shadowBig]),
          child: widget.user.riskFormId != null
              ? FilledCardWidget(user: widget.user)
              : UnfilledCardWidget()),
    );
  }
}

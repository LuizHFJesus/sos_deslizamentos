import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sos_deslizamentos/core/core.dart';
import 'package:sos_deslizamentos/shared/shared_widgets.dart';

class ResultPage extends StatelessWidget {
  final bool result;

  ResultPage({Key? key, required this.result}) : super(key: key);

  String get title => result ? "SUCESSO" : "ERRO";
  String get image => result ? AppImages.success : AppImages.error;
  // TODO: Refactor these messages.
  String get description => result
      ? "Tudo ocorreu com sucesso!"
      : "Aconteceu um erro durante a tentativa de 'something'. Por "
          "favor, tente novamente mais tarde.";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.appBackground,
      body: SafeArea(
        child: Center(
          child: DefaultPageWidget(children: [
            Container(height: 150, width: 150, child: SvgPicture.asset(image)),
            SizedBox(height: 30),
            Text(
              title,
              style: TextStyle(
                color: AppColors.textPrimary,
                fontFamily: AppFonts.regular,
                fontSize: 24,
              ),
            ),
            SizedBox(height: MediaQuery.of(context).size.height * .25),
            Text(
              description,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: AppColors.textThird,
                fontFamily: AppFonts.regular,
                fontSize: 16,
              ),
            ),
            SizedBox(height: 50),
            FilledButtonWidget(
              title: "Continuar",
              onTap: () {
                Navigator.pop(context);
              },
            )
          ]),
        ),
      ),
    );
  }
}

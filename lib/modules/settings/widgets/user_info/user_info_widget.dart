import 'package:flutter/material.dart';
import 'package:sos_deslizamentos/core/core.dart';
import 'package:sos_deslizamentos/shared/models/user_model.dart';

class UserInfoWidget extends StatelessWidget {
  final UserModel user;

  const UserInfoWidget({Key? key, required this.user}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            height: 120,
            width: 120,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(
                fit: BoxFit.fill,
                image: NetworkImage(user.photoUrl),
              ),
            ),
          ),
          SizedBox(height: 20),
          Text(
            user.name,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: AppColors.textPrimary,
              fontFamily: AppFonts.semiBold,
              fontSize: 24,
            ),
          ),
          Text(
            user.email,
            style: TextStyle(
              color: AppColors.textThird,
              fontFamily: AppFonts.regular,
              fontSize: 14,
            ),
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';

class ChangeProfilePictureWidget extends StatelessWidget {
  final String photoUrl;

  ChangeProfilePictureWidget({Key? key, required this.photoUrl})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        print("change profile picture");
      },
      child: Container(
        height: 110,
        width: 110,
        child: Stack(
          children: [
            Positioned(
              left: 0,
              bottom: 0,
              child: Container(
                height: 100,
                width: 100,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                    fit: BoxFit.fill,
                    image: NetworkImage(photoUrl),
                  ),
                ),
              ),
            ),
            // Positioned( TODO: Change user photo.
            //   right: 0,
            //   top: 0,
            //   child: Container(
            //     alignment: Alignment.center,
            //     height: 40,
            //     width: 40,
            //     decoration: BoxDecoration(
            //         color: AppColors.white,
            //         shape: BoxShape.circle,
            //         border: Border.all(color: AppColors.primary)),
            //     child: SvgPicture.asset(AppImages.camera),
            //   ),
            // )
          ],
        ),
      ),
    );
  }
}

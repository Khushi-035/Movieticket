import 'package:flutter/material.dart';
import 'package:movie_booking/utils/mytheme.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SocialLoginButtons extends StatelessWidget {
  final Function() onFbclick;
  final Function() onGoogleclick;

  const SocialLoginButtons({Key? key, required this.onFbclick, required this.onGoogleclick}) : super(key: key);

  // const SocialLoginButtons({super.key});
  
  


  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(child: Material(
          color: MyTheme.redLight,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5),
            side: const BorderSide(color: MyTheme.redBorder, width: 0.2),
          ),
          child: InkWell(
            onTap: onGoogleclick,
            borderRadius: BorderRadius.circular(6),
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
              child: Row(
                children: [
                  SvgPicture.asset("assets/icons/google.svg"),
                  const SizedBox(
                    width: 8,
                  ),
                  const Text("Google", style: TextStyle(
                        color: Color(0xFF666666),
                        fontWeight: FontWeight.w600,
                        fontSize: 16,
                      ),
                    ),
                ],
              ),
            ),
          ),
        ),
      ),

      const SizedBox(
        width: 10,
      ),

      Expanded(child: Material(
          color: MyTheme.blueLight,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5),
            side: const BorderSide(color: MyTheme.blueBorder, width: 0.2),
          ),
          child: InkWell(
            onTap: onFbclick,
            borderRadius: BorderRadius.circular(6),
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 5),
              child: Row(
                children: [
                  SvgPicture.asset("assets/icons/facebook.svg"),
                  const SizedBox(
                    width: 8,
                  ),
                  const Text(
                    "Facebook",
                    style: TextStyle(
                        color: Color(0xFF666666),
                        fontWeight: FontWeight.w600,
                        fontSize: 16,
                      ),
                    ),
                      
                ],
              ),
            ),
          ),
        ),
      ),

      ],
    );
  }
}


import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:login_screen/core/themes/app_colors.dart';

class SocialButtonsWidget extends StatelessWidget {
  const SocialButtonsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        SocialButton(
          imageUrl: 'images/github_icon.png',
          title: 'Github',
          onTap: () {},
        ),
        SocialButton(
          imageUrl: 'images/gitlab_icon.png',
          title: 'Gitlab',
          onTap: () {},
        ),
      ],
    );
  }
}

class SocialButton extends StatelessWidget {
  final String imageUrl;
  final String title;
  final void Function() onTap;

  const SocialButton({
    super.key,
    required this.imageUrl,
    required this.title,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(
          vertical: 14,
          horizontal: 40,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: AppColors.secondary,
            width: 1,
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              imageUrl,
              height: 20,
              width: 20,
              fit: BoxFit.cover,
            ),
            const SizedBox(width: 10),
            Text(
              title,
              style: const TextStyle(
                fontSize: 16,
                color: Colors.black,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

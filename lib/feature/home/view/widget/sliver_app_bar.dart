import 'package:ai_gemini_chat_app/gen/assets.gen.dart';
import 'package:ai_gemini_chat_app/product/constant/text_constants.dart';
import 'package:ai_gemini_chat_app/product/extension/context_extension.dart';
import 'package:flutter/material.dart';

class CustomSliverAppBar extends StatelessWidget {
  const CustomSliverAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      floating: true,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            AppString.appName,
            style: context.textTheme.headlineMedium,
          ),
          Icon(
            Icons.image_outlined,
            color: context.colorScheme.surface,
          )
        ],
      ),
      flexibleSpace: FlexibleSpaceBar(
        background: Assets.image.sky.image(fit: BoxFit.cover),
      ),
    );
  }
}

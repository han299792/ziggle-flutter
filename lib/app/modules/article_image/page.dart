import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ziggle/app/core/values/colors.dart';
import 'package:ziggle/app/modules/article/page_spinner.dart';
import 'package:ziggle/app/modules/article_image/controller.dart';

class ArticleImagePage extends GetView<ArticleImageController> {
  const ArticleImagePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        leading: CloseButton(
          onPressed: () => Get.back(result: controller.page.value),
        ),
        backgroundColor: Palette.black,
        foregroundColor: Palette.white,
      ),
      backgroundColor: Palette.black,
      body: Stack(
        children: [
          PageView.builder(
            controller: controller.pageController,
            itemCount: controller.images.length,
            itemBuilder: (context, index) => Hero(
              tag: index,
              child: Image.network(
                controller.images[index],
                fit: BoxFit.contain,
              ),
            ),
          ),
          Align(
            alignment: const Alignment(0, 0.6),
            child: Obx(
              () => PageSpinner(
                isLight: false,
                currentPage: controller.page.value,
                maxPage: controller.images.length,
                onPageChanged: controller.onPageChanged,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
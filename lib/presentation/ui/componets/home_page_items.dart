import 'package:app_p_10/core/costants/app_colors.dart';
import 'package:app_p_10/core/costants/app_images.dart';
import 'package:app_p_10/presentation/ui/componets/app_text.dart';
import 'package:app_p_10/providers/home_page_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePageItems extends StatelessWidget {
  const HomePageItems({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height / 1.9,
      width: 414,
      decoration: const BoxDecoration(
        color: containerTextColor,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30),
          topRight: Radius.circular(30),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.only(left: 16, right: 16, top: 12),
        child: Column(
          children: [
            Row(
              children: [
                HomePageContainer(
                  initialImage: quizImage,
                  alternateImage: quizImageActivate,
                  title: "Quiz",
                  titletwo: 'on the level of awareness in loans',
                  onTap: () {
                    Navigator.pushNamed(context, 'quiz_page');
                  },
                ),
                const SizedBox(
                  width: 14,
                ),
                HomePageContainer(
                  initialImage: calculatorImage,
                  alternateImage: calculatorImageActivate,
                  title: "Calculator",
                  titletwo: 'calculate interest on the loan',
                  onTap: () {
                    Navigator.pushNamed(context, 'calculator_screen');
                  },
                ),
              ],
            ),
            const SizedBox(
              height: 14,
            ),
            Row(
              children: [
                HomePageContainer(
                  initialImage: testImage,
                  alternateImage: testImageActivate,
                  title: "Test",
                  titletwo: 'probability of obtaining a loan',
                  onTap: () {
                    Navigator.pushNamed(context, 'test_page');
                  },
                ),
                const SizedBox(
                  width: 14,
                ),
                HomePageContainer(
                  initialImage: faqImage,
                  alternateImage: imageFaqActivate,
                  title: "FAQ",
                  titletwo: 'basic questions and answers',
                  onTap: () {
                    Navigator.pushNamed(context, 'faq_screen');
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class HomePageContainer extends StatelessWidget {
  const HomePageContainer({
    Key? key,
    required this.initialImage,
    required this.alternateImage,
    required this.title,
    required this.titletwo,
    required this.onTap,
    this.colorText,
  }) : super(key: key);

  final String initialImage;
  final String alternateImage;
  final String title;
  final String titletwo;
  final Color? colorText;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<HomePageProvider>(
      create: (_) => HomePageProvider(
        initialImage: initialImage,
        alternateImage: alternateImage,
        colorText: colorText,
      ),
      child: Consumer<HomePageProvider>(
        builder: (context, state, _) {
          return GestureDetector(
            onTap: () {
              state.changeImage();
              Future.delayed(const Duration(milliseconds: 250), () {
                onTap();
                state.changeImage();
              });
            },
            child: Container(
              height: 189,
              width: MediaQuery.of(context).size.width / 2.28,
              decoration:
                  BoxDecoration(borderRadius: BorderRadius.circular(18)),
              child: Stack(
                children: [
                  Image.asset(state.currentImage, fit: BoxFit.cover),
                  Positioned(
                    top: 90,
                    left: 22,
                    right: 22,
                    child: AppTexts(
                      title: title,
                      fontSize: 22,
                      fontWeight: FontWeight.w400,
                      color: state.textColor,
                    ),
                  ),
                  Positioned(
                    top: 120,
                    left: 10,
                    right: 20,
                    child: AppTexts(
                      title: titletwo,
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      color: state.textColor,
                    ),
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

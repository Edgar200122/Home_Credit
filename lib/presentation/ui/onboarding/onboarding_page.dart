import 'package:app_p_10/core/costants/app_colors.dart';
import 'package:app_p_10/core/costants/app_images.dart';
import 'package:app_p_10/presentation/ui/componets/app_button.dart';
import 'package:app_p_10/presentation/ui/componets/app_text.dart';
import 'package:app_p_10/presentation/ui/componets/onboardin_list_screens.dart';
import 'package:app_p_10/providers/onboarding_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class OnboardingPage extends StatelessWidget {
  const OnboardingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // ignore: no_leading_underscores_for_local_identifiers
    Future<bool> _onWillPop() async {
      return false;
    }

    return Consumer<OnboardingProvider>(
      builder: (context, onboardingProvider, _) {
        return WillPopScope(
          onWillPop: _onWillPop,
          child: Scaffold(
            body: SafeArea(
              child: Column(
                children: [
                  Expanded(
                    child: PageView.builder(
                      controller: onboardingProvider.pageController,
                      itemCount: onboardingPages.length,
                      onPageChanged: onboardingProvider.setCurrentPage,
                      physics: const BouncingScrollPhysics(),
                      itemBuilder: (BuildContext context, int index) {
                        return Column(
                          children: [
                            const SizedBox(
                              height: 60,
                            ),
                            Image.asset(
                              onboardingPages[index].image,
                              height: 400,
                            ),
                            const SizedBox(height: 19),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: List.generate(
                                onboardingPages.length,
                                (index) => _buildIndicator(
                                    index, onboardingProvider.currentPage),
                              ),
                            ),
                            const Spacer(),
                            AppTexts(
                              title: onboardingPages[index].title,
                              fontSize: 25,
                              fontWeight: FontWeight.w700,
                            ),
                            const SizedBox(height: 13),
                            AppTexts(
                              title: onboardingPages[index].description,
                              fontSize: 22,
                              fontWeight: FontWeight.w400,
                            ),
                            const Spacer(),
                          ],
                        );
                      },
                    ),
                  ),
                  AppButton(
                    widget: Image.asset(arrowRightIcon),
                    width: 102,
                    ontap: () => onboardingProvider.nextPage(context),
                  ),
                  const SizedBox(height: 40),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _buildIndicator(int index, int currentPage) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 150),
      height: 14,
      width: 14,
      margin: const EdgeInsets.symmetric(horizontal: 5),
      decoration: BoxDecoration(
        color: currentPage == index
            ? activeIndicatorColor
            : inactiveIndicatorColor,
        borderRadius: BorderRadius.circular(25),
      ),
    );
  }
}

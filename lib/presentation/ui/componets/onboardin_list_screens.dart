import 'package:app_p_10/core/costants/app_images.dart';

class OnboardingPage {
  final String image;
  final String title;
  final String description;

  OnboardingPage(
      {required this.image, required this.title, required this.description});
}

List<OnboardingPage> onboardingPages = [
  OnboardingPage(
    image: testIcon,
    title: "Answer the question",
    description: "And find out the probability\nof getting a loan",
  ),
  OnboardingPage(
    image: calculatortIcon,
    title: "Use calculator",
    description:
        "Simply and quickly calculate\nthe interest and monthly\npayment of your loan",
  ),
  OnboardingPage(
    image: quizIcon,
    title: "Take the test",
    description: "Find out how much you\nunderstand about loans",
  ),
];

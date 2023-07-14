import 'package:app_p_10/core/costants/app_colors.dart';
import 'package:app_p_10/core/costants/app_images.dart';
import 'package:app_p_10/presentation/ui/componets/app_bar.dart';
import 'package:app_p_10/presentation/ui/componets/offerwall_row.dart';
import 'package:flutter/material.dart';

class OfferwallPage extends StatelessWidget {
  const OfferwallPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: containerTextColor,
        automaticallyImplyLeading: false,
        title: CustomAppBar(
          ontap: () {
            Navigator.pop(context, "home_page");
          },
          title: "Offerwall",
          widgetOne: Image.asset(
            arrowBack,
            height: 16,
          ),
        ),
      ),
      body: const SafeArea(
          child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          children: [
            SizedBox(
              height: 30,
            ),
            OfferwallRow(
              image: eastWestBankPersonalLoanIcon,
              title: 'EastWest Bank Personal Loan',
              percent: '17.88%',
            ),
            SizedBox(
              height: 30,
            ),
            OfferwallRow(
              image: cIMBBankPersonalLoanIcon,
              title: 'CIMB Bank Personal Loan',
              percent: '13.47%',
            ),
            SizedBox(
              height: 30,
            ),
            OfferwallRow(
              image: citiPersonalLoanIcon,
              title: 'Citi Personal Loan',
              percent: '26.90%',
            ),
            SizedBox(
              height: 30,
            ),
            OfferwallRow(
              image: financingBusinessLoanIcon,
              title: 'Esquire Financing Business\nLoan',
              percent: '17.88%',
            ),
            SizedBox(
              height: 30,
            ),
            OfferwallRow(
              image: bPIPersonalLoanIcon,
              title: 'BPI Personal Loan',
              percent: '14.40%',
            ),
            SizedBox(
              height: 30,
            ),
            OfferwallRow(
              image: maybankEnablePersonalLoanIcon,
              title: 'Maybank Enable Personal\nLoan',
              percent: '15.60%',
            ),
            SizedBox(
              height: 30,
            ),
            OfferwallRow(
              image: sBFinanceCar4CashIcon,
              title: 'SB Finance Car4Cash',
              percent: '15.00%',
            ),
          ],
        ),
      )),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:nio_data/constants/colors.dart';
import 'package:nio_data/widgets/app_bar.dart';
import 'package:nio_data/widgets/custom_btn.dart';
import 'package:nio_data/widgets/custom_card.dart';
import 'package:nio_data/widgets/custom_title.dart';
import 'package:nio_data/widgets/result_card.dart';

import 'los_page.dart';

class MortalityPage extends StatelessWidget {
  const MortalityPage({Key? key})
      : super(
          key: key,
        );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        title: 'HOME',
        icon: 'home.png',
      ),
      backgroundColor: AppColors.backgroundColor,
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(15),
          child: _body(context),
        ),
      ),
    );
  }

  Widget _body(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            margin: const EdgeInsets.only(left: 10.0),
            child: const CustomTitle(
              title: 'Explanation Interface (Mortality Prediction)',
            ),
          ),
          const SizedBox(
            height: 10.0,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            mainAxisSize: MainAxisSize.max,
            children: [
              Expanded(
                flex: 3,
                child: card(
                  'feature_importance_classification.png',
                  450.0,
                  'Feature Based XAI',
                  350,
                ),
              ),
              const SizedBox(
                width: 10.0,
              ),
              Expanded(
                flex: 3,
                child: card(
                  'desicision_tree_classification.png',
                  450.0,
                  'Decision Tree Based XAI',
                  350,
                ),
              ),
              const SizedBox(
                width: 10.0,
              ),
              // Expanded(
              //   flex: 3,
              //   child: card(
              //     'rules.png',
              //     450.0,
              //     'Rule Based XAI',
              //     350,
              //   ),
              // ),
            ],
          ),
          const SizedBox(
            height: 10.0,
          ),
          Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                flex: 7,
                child: card(
                  'force_plot_classification_2.PNG',
                  200.0,
                  'Features\' impact on decision',
                  150,
                ),
              ),
              const SizedBox(
                width: 10.0,
              ),
              const Expanded(
                flex: 3,
                child: ResultCard(
                  title: 'Mortality Rate',
                  value: 75.4,
                  color: Colors.red,
                  hasTitleInside: true,
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 10.0,
          ),
          Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                flex: 5,
                child: card(
                  'waterfall_dead_1.png',
                  450.0,
                  'Decision for survival',
                  350,
                ),
              ),
              const SizedBox(
                width: 10.0,
              ),
              Expanded(
                flex: 5,
                child: card(
                  'waterfall_dead_2.png',
                  450.0,
                  'Decision for mortality',
                  350,
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          customBtn(
              'Get Explanation for LOS',
              () => {
                    Navigator.of(context).push(_createRoute()),
                  })
        ],
      ),
    );
  }

  Route _createRoute() {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => const LosPage(),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        // const begin = Offset(0.0, 1.0);
        // const end = Offset.zero;
        // final tween = Tween(begin: begin, end: end);
        // final offsetAnimation = animation.drive(tween);

        // return SlideTransition(
        //   position: offsetAnimation,
        //   child: child,
        // );
        return child;
      },
    );
  }
}

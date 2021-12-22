import 'package:flutter/material.dart';
import 'package:nio_data/constants/colors.dart';
import 'package:nio_data/widgets/app_bar.dart';
import 'package:nio_data/widgets/custom_card.dart';
import 'package:nio_data/widgets/custom_title.dart';
import 'package:nio_data/widgets/result_card.dart';

class LosPage extends StatelessWidget {
  const LosPage({Key? key})
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
      margin: const EdgeInsets.all(10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            margin: const EdgeInsets.only(left: 10.0),
            child: const CustomTitle(
              title: 'Explanation Interface (Length of Stay) ',
            ),
          ),
          const SizedBox(
            height: 10.0,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                flex: 5,
                child: card(
                  'feature_importance_regression.png',
                  450.0,
                  'Feature Based XAI',
                  350,
                ),
              ),
              const SizedBox(
                width: 10.0,
              ),
              Expanded(
                flex: 5,
                child: card(
                  'waterfall_dead_3.png',
                  450.0,
                  'Waterfall (Explains how each feature has impact on decision)',
                  350,
                ),
              ),
            ],
          ),
          Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                flex: 7,
                child: card(
                  'force_plot_regression_2.PNG',
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
                  title: 'Expected Length of Stay (days)',
                  value: 86.89,
                  color: Colors.red,
                  hasPercentageSign: false,
                  hasTitleInside: true,
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 10.0,
          ),
          SizedBox(
            width: double.infinity,
            child: card(
              'desicision_tree_regression.png',
              400.0,
              'Decision Tree Based XAI',
              300,
            ),
          ),
        ],
      ),
    );
  }
}

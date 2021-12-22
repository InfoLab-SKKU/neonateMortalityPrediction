import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/widgets.dart';
import 'package:nio_data/constants/colors.dart';
import 'package:nio_data/widgets/app_bar.dart';
import 'package:nio_data/widgets/custom_btn.dart';
import 'package:nio_data/widgets/custom_input.dart';
import 'package:nio_data/widgets/custom_texts.dart';
import 'package:nio_data/widgets/custom_title.dart';
import 'package:nio_data/widgets/input_bar.dart';
import 'package:nio_data/widgets/result_card.dart';

import 'mortality_page.dart';

class MainPage extends StatefulWidget {
  const MainPage({
    Key? key,
  }) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  late bool show = false;
  late bool showProgress = true;
  List<double> respRate =  [22.9, 25.33, 25.33, 26.33, 26.33, 26.33, 26.33, 26.33, 26.33, 26.33, 26.33, 26.33, 26.33, 26.33, 26.33, 26.33, 26.33, 26.33, 26.63, 27.66, 27.83, 27.96, 28.93]; 
  List<double> sao2 =  [85.83, 93.83, 93.83, 93.83, 93.83, 93.83, 93.83, 93.83, 93.83, 93.83, 93.83, 93.83, 93.83, 93.83, 93.83, 93.83, 93.83, 93.83, 99.83]; 
  List<double> skinT =  [ 36.69, 36.69, 36.69, 36.69, 36.69, 36.69, 36.69, 36.69, 36.69, 36.69, 36.69, 36.69, 36.69, 36.69, 36.69, 36.69, 36.69, 36.69, 36.69, 36.69, 37.39]; 
  List<double> bps =  [24.97, 48.97, 55.67, 57.67, 57.67, 57.67, 57.67, 57.67, 57.67, 57.67, 57.67, 57.67, 57.67, 57.67, 57.67, 57.97, 59.67, 96.47]; 


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: 'Dashboard'),
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
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const SizedBox(
          height: 10,
        ),
        _title(),
        const SizedBox(
          height: 10,
        ),
        _cartBody(),
        const SizedBox(
          height: 10,
        ),
        if (show) _result(),
        const SizedBox(
          height: 10,
        ),
        // if (showProgress) const CircularProgressIndicator(),
        if (show)
          customBtn(
              'GET EXPLANATION',
              () => {
                    Navigator.of(context).push(_createRoute()),
                  })
      ],
    );
  }

  Route _createRoute() {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) =>
          const MortalityPage(),
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

  Widget _title() => Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.start,
        children: const [
          Expanded(
            flex: 3,
            child: CustomTitle(title: 'Patient\'s Profile'),
          ),
          Expanded(
            flex: 7,
            child: CustomTitle(title: 'Domain Expert\'s input'),
          ),
        ],
      );

  Widget _cartBody() => Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            flex: 3,
            child: Column(
              children: [
                _profile(),
                Container(
                  width: double.infinity,
                  margin: const EdgeInsets.all(5.0),
                  child: customBtn('GET RESULT', () async {
                    if (showProgress) {
                      showDialog(
                          context: context,
                          barrierDismissible: false,
                          builder: (BuildContext context) => AlertDialog(
                                content: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  mainAxisSize: MainAxisSize.min,
                                  children: const [
                                    SizedBox(
                                      width: 150,
                                      height: 150,
                                      child: CircularProgressIndicator(),
                                    ),
                                  ],
                                ),
                              ));
                    }
                    await Future.delayed(const Duration(seconds: 3));
                    setState(() {
                      show = true;
                      respRate = respRate; 
                      sao2 = sao2; 
                      skinT = skinT; 
                      bps = bps; 
                      Navigator.of(context, rootNavigator: true).pop('dialog');
                    });
                    // setState(() {
                    //   showProgress = true;
                    // }),
                  }),
                ),
              ],
            ),
          ),
          Expanded(
            flex: 7,
            child: _inputBody(),
          ),
        ],
      );

  Widget _profile() => Card(
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 35),
          height: 610.0,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const SizedBox(
                height: 10.0,
              ),
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.end,
                children: const [
                  Icon(
                    Icons.edit,
                    color: AppColors.mainColor,
                    size: 30.0,
                  )
                ],
              ),
              Image.asset('neonate2.png'),
              const SizedBox(
                height: 10.0,
              ),
              const Text(
                'Admission ID: 1005',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20.0,
                ),
              ),
              const SizedBox(
                height: 10.0,
              ),
              const Divider(
                height: 0.75,
                color: Colors.black,
              ),
              const SizedBox(
                height: 15.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                mainAxisSize: MainAxisSize.max,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      CustomTexts(
                        option: 'Gender',
                        name: 'Male',
                      ),
                      SizedBox(
                        height: 15.0,
                      ),
                      CustomTexts(
                        option: 'Admission Location',
                        name: 'NICU',
                      ),
                      SizedBox(
                        height: 15.0,
                      ),
                      CustomTexts(
                        option: 'Insurance',
                        name: 'Private',
                      ),
                      SizedBox(
                        height: 15.0,
                      ),
                      CustomTexts(
                        option: 'Gestation Age',
                        name: '29 weeks',
                      ),
                      SizedBox(
                        height: 15.0,
                      ),
                      CustomTexts(
                        option: 'Birth Weight',
                        name: '0.72 kg',
                      ),
                      SizedBox(
                        height: 15.0,
                      ),
                      CustomTexts(
                        option: 'Head Circumference',
                        name: '23 cm',
                      ),
                      SizedBox(
                        height: 15.0,
                      ),
                    ],
                  ),
                ],
              )
            ],
          ),
        ),
      );

  Widget _inputBody() => Card(
        child: Container(
            padding: const EdgeInsets.symmetric(
              vertical: 10,
              horizontal: 15,
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  flex: 5,
                  child: Column(
                    children: [
                      Card(
                        color: AppColors.backgroundColor,
                        child: Column(
                          children: [
                            InputBar(
                              title: 'Heart Rate',
                              icon: 'heart.png',
                              maxVal: 24,
                              currVal: 24,
                              meanVal: 155.17,
                              stdVal: 11.43,
                              inputVal: 0,
                              valList: [],
                            ),
                            const Divider(
                              thickness: 0.5,
                              indent: 10.0,
                              endIndent: 10.0,
                              color: AppColors.mainColor,
                            ),
                            InputBar(
                              title: 'Respiratory Rate',
                              maxVal: 24,
                              currVal: 23,
                              meanVal: 26.33,
                              stdVal: 1.15,
                              inputVal: 0,
                              valList: respRate,
                            ),
                            const Divider(
                              thickness: 0.5,
                              indent: 10.0,
                              endIndent: 10.0,
                              color: AppColors.mainColor,
                            ),
                            InputBar(
                              title: 'SaO2',
                              maxVal: 24,
                              currVal: 20,
                              meanVal: 93.83,
                              stdVal: 2.33,
                              inputVal: 0,
                              valList: sao2,
                            ),
                            const Divider(
                              thickness: 0.5,
                              indent: 10.0,
                              endIndent: 10.0,
                              color: AppColors.mainColor,
                            ),
                            // InputBar(
                            //   title: 'Heart Rate Alarm Low',
                            //   maxVal: 24,
                            //   currVal: 19,
                            //   meanVal: 80.0,
                            //   stdVal: 0.00,
                            //   inputVal: 0,
                            //   valList: [],
                            // ),
                            CustomInput(
                            title: 'Heart Rate Alarm Low (Max)',
                            inputVal: 100,
                          ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 5.0,
                      ),
                      Card(
                        color: AppColors.backgroundColor,
                        child: Column(children: [
                          InputBar(
                            title: 'Temperature',
                            icon: 'temperature.png',
                            maxVal: 24,
                            currVal: 22,
                            meanVal: 36.70,
                            stdVal: 0.31,
                            inputVal: 0,
                            valList: [],
                          ),
                          const Divider(
                            thickness: 0.5,
                            indent: 10.0,
                            endIndent: 10.0,
                            color: AppColors.mainColor,
                          ),
                          InputBar(
                            title: 'Skin Temperature',
                            maxVal: 24,
                            currVal: 22,
                            meanVal: 36.69,
                            stdVal: 0.22,
                            inputVal: 0,
                            valList: skinT,
                          ),
                        ]),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  width: 10.0,
                ),
                Expanded(
                  flex: 5,
                  child: Column(
                    children: [
                      Card(
                        color: AppColors.backgroundColor,
                        child: Column(children: [
                          InputBar(
                            title: 'Blood Pressure Diastolic',
                            icon: 'heart_rate.png',
                            maxVal: 24,
                            currVal: 19,
                            meanVal: 29.92,
                            stdVal: 8.18,
                            inputVal: 0,
                            valList: [],
                          ),
                          const Divider(
                            thickness: 0.5,
                            indent: 10.0,
                            endIndent: 10.0,
                            color: AppColors.mainColor,
                          ),
                          InputBar(
                            title: 'Blood Pressure Mean',
                            maxVal: 24,
                            currVal: 19,
                            meanVal: 41.21,
                            stdVal: 6.72,
                            inputVal: 0,
                            valList: [],
                          ),
                          const Divider(
                            thickness: 0.5,
                            indent: 10.0,
                            endIndent: 10.0,
                            color: AppColors.mainColor,
                          ),
                          InputBar(
                            title: 'Blood Pressure Systolic',
                            maxVal: 24,
                            currVal: 19,
                            meanVal: 57.67,
                            stdVal: 12.17,
                            inputVal: 0,
                            valList: bps,
                          ),
                        ]),
                      ),
                      const SizedBox(
                        height: 7.0,
                      ),
                      Card(
                        color: AppColors.backgroundColor,
                        child: Column(children: [
                          InputBar(
                            title: 'D10W Amount ',
                            icon: 'stat.png',
                            maxVal: 24,
                            currVal: 49,
                            meanVal:  0.89,
                            stdVal: 0.14,
                            inputVal: 0,
                            valList: [],
                          ),
                          // InputBar(
                          //   title: 'D10W Amount ',
                          //   maxVal: 24,
                          //   currVal: 13,
                          //   meanVal: 143.9,
                          //   stdVal: 1.9,
                          //   inputVal: 148,
                          //   valList: [],
                          // ),
                          const Divider(
                            thickness: 0.5,
                            indent: 10.0,
                            endIndent: 10.0,
                            color: AppColors.mainColor,
                          ),
                          CustomInput(
                            title: 'Prescriptions Count',
                            inputVal: 17,
                          ),
                          CustomInput(
                            title: 'Date Events Count',
                            inputVal: 18,
                          ),
                          CustomInput(
                            title: 'White Blood Count',
                            inputVal: 7,
                          ),
                          CustomInput(
                            title: 'Platelet',
                            inputVal: 201,
                          ),
                        ]),
                      ),
                    ],
                  ),
                ),
              ],
            )),
      );

  Widget _result() => Row(
        mainAxisSize: MainAxisSize.max,
        children: const [
          Expanded(
            flex: 3,
            child: ResultCard(
              title: 'Survival Rate',
              value: 24.6,
              color: Colors.green,
            ),
          ),
          Expanded(
            flex: 3,
            child: ResultCard(
              title: 'Mortality Rate',
              value: 75.4,
              color: Colors.red,
            ),
          ),
          Expanded(
            flex: 3,
            child: ResultCard(
              title: 'Expected Length of Stay (days)',
              value: 86.89,
              hasPercentageSign: false,
              color: Colors.red,
            ),
          ),
          Expanded(
            flex: 3,
            child: ResultCard(
              title: 'LoS prediction confidence',
              value: 73.8,
              color: Colors.green,
            ),
          ),
        ],
      );
}

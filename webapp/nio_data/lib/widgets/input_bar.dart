import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:nio_data/constants/colors.dart';
import 'package:stats/stats.dart';

class InputBar extends StatefulWidget {
  late final controller = TextEditingController();
  final int maxVal;
  int currVal;
  double meanVal;
  double stdVal;
  final String title;
  final int inputVal;
  List<double> valList;
  final String? icon;

  InputBar({
    Key? key,
    required this.title,
    this.icon,
    required this.maxVal,
    required this.currVal,
    required this.meanVal,
    required this.stdVal,
    required this.inputVal,
    required this.valList,
  }) : super(key: key) {
    controller.text = inputVal.toString();
    if (valList.isNotEmpty) {
      currVal = valList.length;
      final stats = Stats.fromData(valList);
      meanVal = getAvg(valList);
      stdVal = stats.withPrecision(3).standardDeviation.toDouble();
    }
  }

  @override
  State<InputBar> createState() => _InputBarState();
}

class _InputBarState extends State<InputBar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10.0),
      child: Stack(
        children: [
          if (widget.icon != null) Image.asset(widget.icon!),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                widget.title,
                style: const TextStyle(fontSize: 16.0),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    padding: const EdgeInsets.all(10.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(
                          '${widget.currVal}/${widget.maxVal}',
                          style: const TextStyle(
                            color: Colors.green,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(
                          width: 5.0,
                        ),
                        const Text('Mean: '),
                        Text(
                          widget.meanVal.toStringAsFixed(2),
                          style: const TextStyle(
                            color: Colors.green,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(
                          width: 5.0,
                        ),
                        const Text('Std: '),
                        Text(
                          '${widget.stdVal}',
                          style: const TextStyle(
                            color: Colors.green,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.all(
                        Radius.circular(5.0),
                      ),
                      border: Border.all(),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 10.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          width: 70.0,
                          height: 35.0,
                          child: TextField(
                            textAlign: TextAlign.center,
                            controller: widget.controller,
                            decoration: const InputDecoration(
                              border: OutlineInputBorder(),
                            ),
                          ),
                          decoration: BoxDecoration(
                            borderRadius: const BorderRadius.all(
                              Radius.circular(5.0),
                            ),
                            border: Border.all(),
                          ),
                        ),
                        const SizedBox(
                          width: 10.0,
                        ),
                        TextButton(
                          onPressed: () {
                            setState(() {
                              if (widget.valList.length < widget.maxVal &&
                                  widget.controller.text != '') {
                                widget.valList
                                    .add(double.parse(widget.controller.text));
                                    
                                final stats = Stats.fromData(widget.valList);
                                widget.meanVal = getAvg(widget.valList);
                                    // stats.withPrecision(3).average.toDouble();
                                widget.stdVal = stats
                                    .withPrecision(3)
                                    .standardDeviation
                                    .toDouble();
                                widget.currVal = widget.valList.length;
                                widget.controller.text = '0'; 
                              }
                            });
                          },
                          child: const Text(
                            '+',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                              fontSize: 16.0,
                            ),
                          ),
                          style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.all(AppColors.mainColor),
                            padding: MaterialStateProperty.all(
                                const EdgeInsets.symmetric(vertical: 17.0)),
                          ),
                        ),
                        const SizedBox(
                          width: 10.0,
                        ),
                        TextButton(
                          onPressed: () {
                            setState(() {
                              if (widget.valList.isNotEmpty) {
                                widget.valList.removeLast();
                                final stats = Stats.fromData(widget.valList);
                                // widget.meanVal =
                                //     stats.withPrecision(3).average.toDouble();
                                widget.meanVal = getAvg(widget.valList);
                                widget.stdVal = stats
                                    .withPrecision(3)
                                    .standardDeviation
                                    .toDouble();
                                widget.currVal = widget.valList.length;
                                widget.controller.text = '0'; 
                              } else {
                                widget.meanVal = 0;
                                widget.stdVal = 0;
                                widget.currVal = 0;
                              }
                            });
                          },
                          child: const Text(
                            '-',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                              fontSize: 16.0,
                            ),
                          ),
                          style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.all(AppColors.mainColor),
                            padding: MaterialStateProperty.all(
                                const EdgeInsets.symmetric(vertical: 17.0)),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}

double getAvg(List<double> vals){
    double avg = 0;
    for(double val in vals){
      avg += val;
    }
    return avg/vals.length;
  }


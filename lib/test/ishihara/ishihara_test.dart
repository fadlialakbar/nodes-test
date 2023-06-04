import 'package:eye_diagnose/model/result.dart';
import 'package:eye_diagnose/test/ishihara/detail_hasil.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../../components/calculator_component.dart';

class IshiharaTest extends StatefulWidget {
  const IshiharaTest({super.key});

  @override
  State<IshiharaTest> createState() => _IshiharaTestState();
}

class _IshiharaTestState extends State<IshiharaTest> {
  int _currentImageIndex = 0;

  final List<String> _imageList = [
    'assets/1.png',
    'assets/2.png',
    'assets/3.png',
    'assets/4.png',
    'assets/5.png',
    'assets/6.png',
    'assets/7.png',
    'assets/8.png',
    'assets/9.png',
    'assets/10.png',
    'assets/11.png',
    'assets/12.png',
    'assets/13.png',
    'assets/14.png',
    'assets/15.png',
    'assets/16.png',
    'assets/17.png',
  ];

  int _answer = 0;
  final List<int> _userAnswers = [];
  final List<int> _correctAnswerList = [
    12,
    8,
    29,
    5,
    3,
    15,
    74,
    6,
    45,
    5,
    7,
    16,
    73,
    0,
    0,
    26,
    42,
  ];
  bool _showResult = false;

  void _addNumberToAnswer(int number) {
    setState(() {
      _answer = (_answer * 10) + number;
    });
  }

  void _clearAnswer() {
    setState(() {
      _answer = 0;
    });
  }

  void _saveAnswer() {
    setState(() {
      if (_currentImageIndex == 16) {
        setState(() {
          _userAnswers.add(_answer);
          _showResult = true;
        });
      }

      if (_currentImageIndex < _imageList.length - 1) {
        _userAnswers.add(_answer);
        _showNextImage();
      }
    });
  }

  void _showNextImage() {
    _answer = 0;
    setState(() {
      _currentImageIndex++;
    });
    print(_currentImageIndex);
    print(_userAnswers.length);
  }

  void _skipImage() {
    if (_currentImageIndex == 16) {
      setState(() {
        _userAnswers.add(0);
        _showResult = true;
      });
    }

    if (_currentImageIndex < _imageList.length - 1) {
      _userAnswers.add(0);
      _showNextImage();
    }
  }

  // void _resetTest() {
  //   setState(() {
  //     _currentImageIndex = 0;
  //     _answer = 0;
  //     _userAnswers.clear();
  //     _showResult = false;
  //   });
  // }

  Widget _buildResultButton() {
    int totalCorrectAnswers = 0;
    for (int i = 0; i < _userAnswers.length; i++) {
      if (_userAnswers[i] == _correctAnswerList[i]) {
        totalCorrectAnswers++;
      }
    }

    final double correctPercentage =
        totalCorrectAnswers / _imageList.length * 100;

    final List<ResultData> chartData = [
      ResultData('Correct', totalCorrectAnswers),
      ResultData('Incorrect', _imageList.length - totalCorrectAnswers),
    ];

    return Column(
      children: [
        Container(
          width: 400,
          height: 400,
          child: SfCircularChart(
            annotations: <CircularChartAnnotation>[
              CircularChartAnnotation(
                widget: Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        '${correctPercentage.toStringAsFixed(2)}%',
                        style: const TextStyle(
                          fontSize: 35,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const Text('Benar'),
                    ],
                  ),
                ),
              ),
            ],
            series: <CircularSeries>[
              DoughnutSeries<ResultData, String>(
                dataSource: chartData,
                xValueMapper: (ResultData data, _) => data.label,
                yValueMapper: (ResultData data, _) => data.value,
                pointColorMapper: (ResultData data, _) =>
                    data.label == 'Correct' ? Colors.green : Colors.red,
                explode: true,
                explodeIndex: 0,
                dataLabelSettings: const DataLabelSettings(
                  isVisible: true,
                  labelPosition: ChartDataLabelPosition.outside,
                  textStyle: TextStyle(fontSize: 18),
                ),
                innerRadius: '60%',
              ),
            ],
          ),
        ),
        FilledButton(
          onPressed: () {
            print(
                'imagelist: ${_imageList.length}, userAnswersList: ${_userAnswers.length}, correctAnswer: ${_correctAnswerList.length}');

            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ResultDetailPage(
                  totalCorrectAnswers: totalCorrectAnswers,
                  imageList: _imageList,
                  userAnswers: _userAnswers,
                  correctAnswerList: _correctAnswerList,
                ),
              ),
            );
          },
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
            child: const Text(
              'Lihat Detail Hasil',
              style: TextStyle(
                fontSize: 18,
              ),
            ),
          ),
        ),
      ],
    );
  }

  @override
  void initState() {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    super.initState();
  }

  @override
  void dispose() {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Ishihara Test'),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(
                flex: 1,
                child: Center(
                  child: _showResult ? _buildResultButton() : _buildImage(),
                ),
              ),
              if (!_showResult) ...[
                _buildCalculator(),
                Row(
                  children: [
                    Expanded(
                      child: CalculatorButton(
                        onPressed: _clearAnswer,
                        icon: Icons.close,
                      ),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: CalculatorButton(
                        onPressed: _skipImage,
                        text: "skip",
                      ),
                    ),
                    Expanded(
                      child: CalculatorButton(
                        onPressed: _saveAnswer,
                        icon: Icons.check,
                      ),
                    ),
                    const SizedBox(width: 16),
                  ],
                )
              ],
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildImage() {
    return Image.asset(
      _imageList[_currentImageIndex],
      fit: BoxFit.cover,
      height: 300,
      width: 300,
    );
  }

  Widget _buildCalculator() {
    return Expanded(
      child: Column(
        children: [
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
                color: Theme.of(context)
                    .colorScheme
                    .secondaryContainer
                    .withOpacity(0.5),
                borderRadius: BorderRadius.circular(30)),
            child: Center(
              child: Text(
                _answer.toString(),
                style: TextStyle(
                    fontSize: 25, color: Theme.of(context).colorScheme.primary),
              ),
            ),
          ),
          const SizedBox(height: 8),
          Expanded(
            child: GridView.builder(
              itemCount: 9,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                childAspectRatio: 1.5,
                mainAxisSpacing: 8,
                crossAxisSpacing: 4,
              ),
              itemBuilder: (context, index) {
                final number = index + 1;
                return CalculatorButton(
                  onPressed: () => _addNumberToAnswer(number),
                  text: number.toString(),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

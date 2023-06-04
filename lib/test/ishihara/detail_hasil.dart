import 'package:eye_diagnose/test/quisoner/test_soal.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../../model/result.dart';

class ResultDetailPage extends StatelessWidget {
  final int totalCorrectAnswers;
  final List<String> imageList;
  final List<int> userAnswers;
  final List<int> correctAnswerList;

  const ResultDetailPage({
    super.key,
    required this.totalCorrectAnswers,
    required this.imageList,
    required this.userAnswers,
    required this.correctAnswerList,
  });

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);

    final List<ResultData> chartData = [
      ResultData('Correct', totalCorrectAnswers),
      ResultData('Incorrect', imageList.length - totalCorrectAnswers),
    ];

    var persen = totalCorrectAnswers / imageList.length * 100;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Detail Hasil'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ContainerTest(
              judul: 'Hasil Diagnosa',
              desc: Column(
                children: [
                  SizedBox(
                    width: 400,
                    height: 400,
                    child: SfCircularChart(
                      annotations: <CircularChartAnnotation>[
                        CircularChartAnnotation(
                          widget: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                '${persen.toStringAsFixed(2)} %',
                                style: const TextStyle(
                                  fontSize: 35,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const Text('Benar'),
                            ],
                          ),
                        ),
                      ],
                      series: <CircularSeries>[
                        DoughnutSeries<ResultData, String>(
                          dataSource: chartData,
                          xValueMapper: (ResultData data, _) => data.label,
                          yValueMapper: (ResultData data, _) => data.value,
                          pointColorMapper: (ResultData data, _) =>
                              data.label == 'Correct'
                                  ? Colors.green
                                  : Colors.red,
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
                ],
              ),
            ),
            const SizedBox(height: 16),
            for (int i = 0; i < imageList.length; i++) _buildResultRow(i),
          ],
        ),
      ),
    );
  }

  Widget _buildResultRow(int plateNumber) {
    int normalViewIndex = correctAnswerList[plateNumber];
    dynamic deficiencyViewIndex = [
      'Everyone should see number 12.',
      3,
      5,
      70,
      35,
      2,
      5,
      17,
      2,
      "tidak melihat apa-apa atau melihat sesuatu yang salah.",
      "tidak melihat apa-apa atau melihat sesuatu yang salah.",
      "tidak melihat apa-apa atau melihat sesuatu yang salah.",
      "tidak melihat apa-apa atau melihat sesuatu yang salah.",
      "tidak melihat apa-apa atau melihat sesuatu yang salah.",
      "tidak melihat apa-apa atau melihat sesuatu yang salah.",
      "tidak melihat apa-apa atau melihat sesuatu yang salah.",
      "tidak melihat apa-apa atau melihat sesuatu yang salah.",
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ContainerTest(
            judul: 'Plate ${plateNumber + 1}',
            desc: SizedBox(
              width: double.infinity,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    imageList[plateNumber],
                    fit: BoxFit.cover,
                    height: 200,
                    width: 200,
                  ),
                  Text(
                    'Normal view/Jawaban Anda: $normalViewIndex/${userAnswers[plateNumber]}',
                    style: const TextStyle(
                      fontSize: 16,
                    ),
                  ),
                  SizedBox(
                    width: 250,
                    child: Text(
                      'Red-green deficiency: ${deficiencyViewIndex[plateNumber]}',
                      style: const TextStyle(
                        fontSize: 16,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              ),
            )),
        const SizedBox(height: 16),
      ],
    );
  }
}

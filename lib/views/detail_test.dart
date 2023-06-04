import 'package:eye_diagnose/test/ishihara/ishihara_test.dart';
import 'package:eye_diagnose/test/lapang_pandang/view_lp.dart';
import 'package:eye_diagnose/test/ptosis/ptosis_view.dart';
import 'package:eye_diagnose/test/quisoner/test_soal.dart';
import 'package:eye_diagnose/test/refleks_pupil/refleks_pupil_view.dart';
import 'package:eye_diagnose/test/vision/vision_test.dart';
import 'package:eye_diagnose/views/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../model/data.dart';
import '../test/9arah/9arah_test.dart';

class DetailsView extends StatefulWidget {
  final TestInfo? testInfo;
  const DetailsView({super.key, this.testInfo});

  @override
  State<DetailsView> createState() => _DetailsViewState();
}

class _DetailsViewState extends State<DetailsView> {
  double _heroImageOpacity = 1.0;
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    _scrollController.addListener(() {
      setState(() {
        _heroImageOpacity = 1.0 - _scrollController.offset / 300;
        _heroImageOpacity = _heroImageOpacity.clamp(0.0, 1.0);
      });
    });
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
      body: SafeArea(
          child: Stack(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(left: 20.0, right: 20, top: 32),
            child: SingleChildScrollView(
              controller: _scrollController,
              physics: const BouncingScrollPhysics(),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 250,
                  ),
                  Text(
                    widget.testInfo!.name.toString(),
                    style: TextStyle(
                        fontSize: 40,
                        fontFamily: 'Avenir',
                        color: Theme.of(context).colorScheme.primary,
                        fontWeight: FontWeight.w900),
                    textAlign: TextAlign.left,
                  ),
                  Text(
                    "Test Mata",
                    style: TextStyle(
                        fontSize: 25,
                        fontFamily: 'Avenir',
                        color: Theme.of(context).colorScheme.primary,
                        fontWeight: FontWeight.w300),
                    textAlign: TextAlign.left,
                  ),
                  const Divider(
                    color: Colors.black38,
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Text(
                    widget.testInfo!.description.toString(),
                    style: TextStyle(
                        fontSize: 18,
                        overflow: TextOverflow.ellipsis,
                        fontFamily: 'Avenir',
                        color: contentTextColor,
                        fontWeight: FontWeight.w400),
                    textAlign: TextAlign.justify,
                    maxLines: 60,
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  SizedBox(
                    width: double.infinity,
                    child: Align(
                      alignment: Alignment.center,
                      child: FilledButton(
                        onPressed: () {
                          if (widget.testInfo!.position == 1) {
                            Navigator.push(context,
                                MaterialPageRoute(builder: (context) {
                              return const IshiharaTest();
                            }));
                          }
                          if (widget.testInfo!.position == 2) {
                            Navigator.push(context,
                                MaterialPageRoute(builder: (context) {
                              return VisualAcuityTest();
                            }));
                          }
                          if (widget.testInfo!.position == 3) {
                            Navigator.push(context,
                                MaterialPageRoute(builder: (context) {
                              return const PhotoScreen();
                            }));
                          }
                          if (widget.testInfo!.position == 4) {
                            Navigator.push(context,
                                MaterialPageRoute(builder: (context) {
                              return const LapangPandang();
                            }));
                          }
                          if (widget.testInfo!.position == 5) {
                            Navigator.push(context,
                                MaterialPageRoute(builder: (context) {
                              return const PtosisView();
                            }));
                          }
                          if (widget.testInfo!.position == 6) {
                            Navigator.push(context,
                                MaterialPageRoute(builder: (context) {
                              return const RefleksPupil();
                            }));
                          }
                          if (widget.testInfo!.position == 7) {
                            Navigator.push(context,
                                MaterialPageRoute(builder: (context) {
                              return const MainTestPage();
                            }));
                          }
                        },
                        style: ElevatedButton.styleFrom(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 50, vertical: 10),
                        ),
                        child: Text(
                          widget.testInfo!.position == 1 ||
                                  widget.testInfo!.position == 2 ||
                                  widget.testInfo!.position == 3 ||
                                  widget.testInfo!.position == 7
                              ? "Mulai Test"
                              : "Lihat Gambar",
                          style: TextStyle(fontSize: 20),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            right: -70,
            child: Hero(
              tag: widget.testInfo!.number,
              child: AnimatedOpacity(
                opacity: _heroImageOpacity,
                duration: const Duration(milliseconds: 200),
                child: Image.asset(
                  widget.testInfo!.iconImage.toString(),
                  width: 300,
                  height: 300,
                ),
              ),
            ),
          ),
          Positioned(
            top: 60,
            left: 32,
            child: AnimatedOpacity(
              opacity: _heroImageOpacity,
              duration: const Duration(milliseconds: 300),
              child: Text(
                widget.testInfo!.position.toString(),
                style: TextStyle(
                    fontWeight: FontWeight.w900,
                    fontSize: 247,
                    color: Colors.grey.withOpacity(0.2)),
              ),
            ),
          ),
          IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(Icons.arrow_back_ios_new))
        ],
      )),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_swiper_plus/flutter_swiper_plus.dart';
import '../model/data.dart';
import 'detail_test.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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
      backgroundColor: Theme.of(context).colorScheme.secondaryContainer,
      body: SafeArea(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.all(32),
            child: Column(
              children: <Widget>[
                Row(
                  children: [
                    Text(
                      'Nodes',
                      style: TextStyle(
                          fontFamily: 'Avenir',
                          fontSize: 40,
                          color: Theme.of(context).colorScheme.primary,
                          fontWeight: FontWeight.w900),
                      textAlign: TextAlign.left,
                    ),
                  ],
                ),
                Row(
                  children: [
                    Text(
                      'Aplikasi Test Mata',
                      style: TextStyle(
                          fontFamily: 'Avenir',
                          fontSize: 24,
                          color: Theme.of(context).colorScheme.primary,
                          fontWeight: FontWeight.w500),
                      textAlign: TextAlign.left,
                    ),
                  ],
                ),
              ],
            ),
          ),
          SizedBox(
            height: 500,
            child: Padding(
              padding: const EdgeInsets.only(left: 32.0),
              child: Swiper(
                itemCount: test.length,
                fade: 0.3,
                itemWidth: MediaQuery.of(context).size.width - 2 * 64,
                layout: SwiperLayout.STACK,
                pagination: SwiperPagination(
                    builder: DotSwiperPaginationBuilder(
                        activeSize: 15,
                        activeColor: Theme.of(context).colorScheme.primary,
                        space: 5,
                        color: Theme.of(context)
                            .colorScheme
                            .primary
                            .withOpacity(0.5))),
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          PageRouteBuilder(
                            opaque: false,
                            pageBuilder: (context, a, b) => DetailsView(
                              testInfo: test[index],
                            ),
                            transitionsBuilder: (BuildContext context,
                                Animation<double> animation,
                                Animation<double> secondaryAnimation,
                                Widget child) {
                              return FadeTransition(
                                opacity: animation,
                                child: child,
                              );
                            },
                          ));
                    },
                    child: Stack(
                      children: <Widget>[
                        Column(
                          children: <Widget>[
                            const SizedBox(
                              height: 100,
                            ),
                            Card(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(32)),
                              elevation: 9,
                              color: Colors.white,
                              child: Padding(
                                padding: const EdgeInsets.all(32.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    const SizedBox(
                                      height: 130,
                                    ),
                                    Text(
                                      test[index].name.toString(),
                                      style: TextStyle(
                                          fontSize: 25,
                                          fontFamily: 'Avenir',
                                          color: Theme.of(context)
                                              .colorScheme
                                              .primary,
                                          fontWeight: FontWeight.w900),
                                      textAlign: TextAlign.left,
                                    ),
                                    Text(
                                      "Test Mata",
                                      style: TextStyle(
                                          fontSize: 18,
                                          fontFamily: 'Avenir',
                                          color: Theme.of(context)
                                              .colorScheme
                                              .primary,
                                          fontWeight: FontWeight.w400),
                                      textAlign: TextAlign.left,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(top: 32.0),
                                      child: Row(
                                        children: [
                                          Text(
                                            "Selengkapnya",
                                            style: TextStyle(
                                                fontSize: 16,
                                                fontFamily: 'Avenir',
                                                color: Theme.of(context)
                                                    .colorScheme
                                                    .onPrimaryContainer,
                                                fontWeight: FontWeight.w400),
                                            textAlign: TextAlign.left,
                                          ),
                                          Icon(
                                            Icons.arrow_forward_rounded,
                                            color: Theme.of(context)
                                                .colorScheme
                                                .onPrimaryContainer,
                                            size: 18,
                                          ),
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            )
                          ],
                        ),
                        Hero(
                            tag: test[index].number,
                            child:
                                Image.asset(test[index].iconImage.toString()))
                      ],
                    ),
                  );
                },
              ),
            ),
          )
        ],
      )),
    );
  }
}

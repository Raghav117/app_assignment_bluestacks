import 'dart:ui';

import 'package:app_assignment_bluestacks/controllers/home_controller.dart';
import 'package:app_assignment_bluestacks/modals/global_variables.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final HomeController _homeController = Get.put(HomeController());
  String url =
      "http://tournaments-dot-game-tv-prod.uc.r.appspot.com/tournament/api/tournaments_list_v2?limit=10&status=all";
  @override
  void initState() {
    super.initState();
    _homeController.getAllTournaments(url);
    _scrollController.addListener(() {
      listenScrollController();
    });
  }

  listenScrollController() async {
    if (_scrollController.position.pixels ==
            _scrollController.position.maxScrollExtent &&
        _homeController.loading.value == false) {
      String tempUrl = url + '&cursor=${_homeController.cursor}';
      await _homeController.getAllTournaments(tempUrl);
    }
  }

  final ScrollController _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: ListView(
          controller: _scrollController,
          children: [
            Row(
              children: [
                InkWell(
                  child: const Icon(Icons.menu),
                  onTap: () {
                    Get.defaultDialog(
                        title: "language".tr,
                        middleText: "",
                        actions: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Text("japan".tr),
                              Checkbox(
                                  value: japan,
                                  onChanged: (v) {
                                    japan = !japan;
                                    Locale locale;
                                    if (japan == true) {
                                      locale = const Locale('ja', 'JP');
                                    } else {
                                      locale = const Locale('en', 'US');
                                    }
                                    Get.updateLocale(locale);
                                    Navigator.pop(context);
                                  }),
                            ],
                          )
                        ]);
                  },
                ),
                const Spacer(),
                Text("FlyingWolf".tr,
                    style: const TextStyle(fontWeight: FontWeight.bold)),
                const Spacer(),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              children: [
                Container(
                  height: 80,
                  width: 80,
                  decoration: const BoxDecoration(shape: BoxShape.circle),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(50),
                    child: Image.network(
                      "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTcoAVuyjWSHpeDtXGqzgfm_IyZ23lubSC-hg&usqp=CAU",
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                const SizedBox(
                  width: 20,
                ),
                SizedBox(
                  height: 80,
                  child: Column(
                    children: [
                      Text("simon".tr,
                          style: const TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold)),
                      const Spacer(),
                      Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            border: Border.all(color: Colors.blue)),
                        padding: const EdgeInsets.all(5),
                        child: Row(
                          children: [
                            const Text("2250",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.blue,
                                    fontSize: 20)),
                            const SizedBox(
                              width: 10,
                            ),
                            Text("elo".tr,
                                style: const TextStyle(fontSize: 12)),
                            const SizedBox(
                              width: 10,
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              children: [
                const Spacer(),
                Container(
                  height: 80,
                  width: MediaQuery.of(context).size.width * 0.3,
                  decoration: BoxDecoration(
                      borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(20),
                          bottomLeft: Radius.circular(20)),
                      gradient: LinearGradient(
                          begin: Alignment.bottomLeft,
                          end: Alignment.topRight,
                          colors: [
                            Colors.orange,
                            Colors.orange.withOpacity(0.5)
                          ])),
                  child: Column(
                    children: [
                      const Spacer(),
                      const Text("34",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.white)),
                      Text("tp".tr,
                          textAlign: TextAlign.center,
                          style: const TextStyle(color: Colors.white)),
                      const Spacer(),
                    ],
                  ),
                ),
                const SizedBox(
                  width: 1,
                ),
                Container(
                  height: 80,
                  width: MediaQuery.of(context).size.width * 0.3,
                  decoration: BoxDecoration(
                      gradient: LinearGradient(
                          begin: Alignment.bottomLeft,
                          end: Alignment.topRight,
                          colors: [
                        Colors.purple,
                        Colors.purple.withOpacity(0.8)
                      ])),
                  child: Column(
                    children: [
                      const Spacer(),
                      const Text("09",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.white)),
                      Text("tw".tr,
                          textAlign: TextAlign.center,
                          style: const TextStyle(color: Colors.white)),
                      const Spacer(),
                    ],
                  ),
                ),
                const SizedBox(
                  width: 1,
                ),
                Container(
                  height: 80,
                  width: MediaQuery.of(context).size.width * 0.3,
                  decoration: BoxDecoration(
                      borderRadius: const BorderRadius.only(
                          topRight: Radius.circular(20),
                          bottomRight: Radius.circular(20)),
                      gradient: LinearGradient(
                          begin: Alignment.bottomLeft,
                          end: Alignment.topRight,
                          colors: [Colors.red, Colors.red.withOpacity(0.7)])),
                  child: Column(
                    children: [
                      const Spacer(),
                      const Text("24%",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.white)),
                      Text("wp".tr,
                          textAlign: TextAlign.center,
                          style: const TextStyle(color: Colors.white)),
                      const Spacer(),
                    ],
                  ),
                ),
                const Spacer(),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Text("recommandation".tr,
                style:
                    const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            Obx(() {
              return _homeController.loading.value == true &&
                      _homeController.tournaments.isEmpty
                  ? SizedBox(
                      height: MediaQuery.of(context).size.width,
                      child: const Center(
                        child: CircularProgressIndicator(),
                      ),
                    )
                  : Column(
                      children: [
                        ..._homeController.tournaments.map((e) {
                          return Card(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20)),
                            elevation: 10,
                            shadowColor: Colors.white,
                            child: Container(
                              height: MediaQuery.of(context).size.height * 0.2,
                              width: double.infinity,
                              decoration: BoxDecoration(
                                  color: Colors.transparent,
                                  borderRadius: BorderRadius.circular(20)),
                              child: Column(
                                children: [
                                  Expanded(
                                    child: SizedBox(
                                      width: double.infinity,
                                      child: ClipRRect(
                                        borderRadius: const BorderRadius.only(
                                            topLeft: Radius.circular(20),
                                            topRight: Radius.circular(20)),
                                        child: Image.network(
                                          e.gameIconUrl!,
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    child: Container(
                                      padding: const EdgeInsets.all(8),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        children: [
                                          Text(
                                            e.gameName!,
                                            style: const TextStyle(
                                                overflow: TextOverflow.ellipsis,
                                                fontWeight: FontWeight.bold),
                                          ),
                                          Row(
                                            children: [
                                              SizedBox(
                                                width: MediaQuery.of(context)
                                                        .size
                                                        .width *
                                                    0.7,
                                                child: Text(
                                                  e.name!,
                                                  style: const TextStyle(
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                  ),
                                                ),
                                              ),
                                              const Spacer(),
                                              const Icon(
                                                  Icons
                                                      .arrow_forward_ios_outlined,
                                                  size: 15)
                                            ],
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        }),
                        _homeController.loading.value == true
                            ? const SizedBox(
                                height: 50,
                                child: Center(
                                  child: CircularProgressIndicator(),
                                ))
                            : const SizedBox()
                      ],
                    );
            }),
          ],
        ),
      )),
    );
  }
}

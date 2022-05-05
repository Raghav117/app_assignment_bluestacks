import 'package:app_assignment_bluestacks/api_client/api.dart';
import 'package:app_assignment_bluestacks/modals/tournaments.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  RxList<Tournaments> tournaments = <Tournaments>[].obs;
  RxBool loading = true.obs;
  String cursor = "";
  getAllTournaments(String url) async {
    loading.value = true;
    var response = await Api().getRequest(url);
    HomeData homeData = HomeData.fromJson(response);
    cursor = homeData.data!.cursor!;
    tournaments.addAll(homeData.data!.tournaments!);
    loading.value = false;
  }
}

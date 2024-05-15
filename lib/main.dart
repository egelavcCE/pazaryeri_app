import 'package:Pazaryeri/product/init/main_init.dart';
import 'package:Pazaryeri/product/navigator/navigator_manager.dart';
import 'package:Pazaryeri/product/navigator/navigator_route_items.dart';
import 'package:Pazaryeri/product/theme/project_theme.dart';
import 'package:Pazaryeri/screen/unknown_page/view/unknown_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';

void main() {
  MainInit().mainInit();
  runApp(Main());
}

class Main extends StatelessWidget {
  final navigatorController = NavigatorController.instance;
  Main({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: ProjectTheme(context).theme,
      initialRoute: NavigatorRoutes.init,
      debugShowCheckedModeBanner: false,
      getPages: NavigatorRoutes().routes,
      unknownRoute: GetPage(
        name: NavigateRoutesItems.unknown.withSlash,
        page: () => const UnknownView(),
      ),
    );
  }
}

//todo:GeneralSearch kxısmını her ekrana uygulamadım fonksiyonellikleri, sadece homepage de aktif!

//todo: total 3 bug, birincisi yukarıdaki karanlık yer, ikincisi cardın height kısmı!

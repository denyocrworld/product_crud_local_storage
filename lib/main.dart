import 'package:flutter/foundation.dart';
import 'package:hive/hive.dart';
import 'package:hyper_ui/core.dart';
import 'package:flutter/material.dart';
import 'package:hyper_ui/debug.dart';
import 'package:hyper_ui/service/product_service/product_service.dart';
import 'package:path_provider/path_provider.dart';

//CRUD Product
//Create
//READ
//Update
//Delete

//LocalStorage

// List products = []; CUD => LocalStorage
// LocalStorage => List products

void main() async {
  await initialize();

  if (!kIsWeb) {
    var path = await getTemporaryDirectory();
    Hive.init(path.path);
  }
  mainStorage = await Hive.openBox('mainStorage');
  ProductService.loadFromLocalStorage();

  Get.mainTheme.value = getDarkTheme();
  runMainApp();
}

runMainApp() async {
  return runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: Get.mainTheme,
      builder: (context, value, child) {
        return MaterialApp(
          title: 'Capek Ngoding',
          navigatorKey: Get.navigatorKey,
          debugShowCheckedModeBanner: false,
          theme: value,
          home: const MainNavigationView(),
          builder: (context, child) => debugView(
            context: context,
            child: child,
            visible: true,
          ),
        );
      },
    );
  }
}

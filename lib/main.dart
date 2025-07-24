import 'package:flutter/material.dart';
import 'package:flutter_getx_clean_architecture/core/presentation/bindings/app_binding.dart';
import 'package:flutter_getx_clean_architecture/core/presentation/controllers/base_getx_controller.dart';
import 'package:flutter_getx_clean_architecture/core/presentation/widgets/base_get_page.dart';
import 'package:get/get.dart';

void main() async {
  await AppBinding().dependencies();
  // Get.lazyPut<CounterController>(
  //   CounterController.new,
  //   fenix: false,
  // );
  // Get.put<CounterController>(
  //   CounterController(),
  //   permanent: true,
  // );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Fenix Demo',
      initialRoute: '/',
      getPages: [
        GetPage(name: '/', page: () => HomePage()),
        GetPage(
          name: '/counter/:id',
          page: () => CounterPage(),
          // binding: BindingsBuilder(
          //   () {
          //     final isRegistered = Get.isRegistered<CounterController>();
          //     debugPrint(
          //       '[CounterController] isRegistered: $isRegistered',
          //     );

          //   },
          // ),
        ),
      ],
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    debugPrint('[HomePage] build');
    return Scaffold(
      appBar: AppBar(title: Text('Home Page')),
      body: Center(
        child: ElevatedButton(
          child: Text('Go to Counter Page'),
          onPressed: () => Get.toNamed('/counter/0'),
        ),
      ),
    );
  }
}

class CounterController extends BaseGetxController {
  final count = 0.obs;

  CounterController() {
    debugPrint('[CounterController] Constructor called');
  }

  void increment() => count.value++;

  @override
  void onClose() {
    debugPrint('[CounterController] onClose called');
    super.onClose();
  }
}

class CounterPage extends BaseGetPage<CounterController> {
  CounterPage({super.key});

  @override
  Widget buildPage(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Counter Page')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Obx(
              () => Text(
                'Counter: ${controller.count.value}',
                style: TextStyle(fontSize: 24),
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Get.toNamed('/counter/${controller.count.value + 1}');
              },
              child: Text('Goto Counter Page again'),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: controller.increment,
        child: const Icon(Icons.add),
      ),
    );
  }
}

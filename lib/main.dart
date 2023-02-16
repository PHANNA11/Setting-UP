import 'package:app1/detail.dart';
import 'package:app1/font_controller.dart';
import 'package:app1/pic_model.dart';
import 'package:app1/them_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await GetStorage.init();
  runApp(const MyApp());
}

ThemeModeController themeModeController = Get.put(ThemeModeController());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SimpleBuilder(builder: (context) {
      return GetMaterialApp(
        title: 'Flutter Demo',
        theme: themeModeController.theme,
        home: const MyHomePage(title: 'Flutter Demo Home Page'),
      );
    });
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  ThemeModeController themeModeController = Get.put(ThemeModeController());
  FontController fontController = Get.put(FontController());
  @override
  Widget build(BuildContext context) {
    return GetBuilder<FontController>(builder: (context) {
      return Scaffold(
          drawer: Drawer(
            backgroundColor: Colors.blueAccent,
            child: SafeArea(child: SimpleBuilder(builder: (context) {
              return Column(
                children: [
                  Card(
                    // color: Colors.blueAccent,
                    child: ListTile(
                      leading: Text('Dark/Light',
                          style: TextStyle(
                              fontSize: 20,
                              fontFamily: fontController.fontTheme.toString())),
                      title: Switch(
                          value: themeModeController.isDark,
                          onChanged: themeModeController.changeTheme),
                    ),
                  ),
                  Card(
                      child: ExpansionTile(
                    initiallyExpanded: true,
                    title: Text(
                      'Change Font',
                      style: TextStyle(
                          fontSize: 20,
                          fontFamily: fontController.fontTheme.toString()),
                    ),
                    children: List.generate(
                        fontController.listFont.length,
                        (index) => Card(
                              color: fontController.fontTheme.toString() ==
                                      fontController.listFont[index]
                                  ? const Color.fromARGB(255, 203, 157, 157)
                                  : Colors.white10,
                              child: ListTile(
                                onTap: () {
                                  fontController.changeFontThem(
                                      fontController.listFont[index].obs);
                                },
                                title: Text(fontController.listFont[index]),
                                trailing: fontController.fontTheme.toString() ==
                                        fontController.listFont[index]
                                    ? const Icon(
                                        Icons.done,
                                        color: Colors.red,
                                      )
                                    : const SizedBox(),
                              ),
                            )),
                  )),
                ],
              );
            })),
          ),
          appBar: AppBar(
            title: Text(widget.title,
                style: TextStyle(
                    fontSize: 20,
                    fontFamily: fontController.fontTheme.toString())),
          ),
          body: ListView.builder(
            itemCount: listPic.length,
            itemBuilder: (context, index) {
              return Card(
                child: ListTile(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => DetailPic(pic: listPic[index]),
                        ));
                  },
                  leading: Image(
                      image: NetworkImage(listPic[index].image.toString())),
                  title: Text(listPic[index].name.toString(),
                      style: TextStyle(
                          fontSize: 20,
                          fontFamily: fontController.fontTheme.toString())),
                ),
              );
            },
          ));
    });
  }
}

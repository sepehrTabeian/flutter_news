import 'package:flutter_news_app/domain/entity/news_model_entity.dart';
import 'package:flutter_news_app/injection.dart';
import 'package:hive/hive.dart';

// var box = injection.get<Box<HiveNewsModel>>();

// Future<void> storeData(List<HiveNewsModel> hiveNewsModel) async {
//   var box = injection.get<Box<HiveNewsModel>>();
//   await box.clear();

//   final receivePort = ReceivePort();
//   await Isolate.spawn(_saveDataInHive, receivePort.sendPort);

//   final sendPort = await receivePort.first as SendPort;
//   final response = ReceivePort();
//   sendPort
//       .send([hiveNewsModel, response.sendPort, AppConstant.hiveDataBaseName]);
//   await response.first;

//   print('Data stored successfully');
// }

// Future<void> _saveDataInHive(SendPort sendPort) async {
//   final port = ReceivePort();
//   sendPort.send(port.sendPort);

//   await for (final message in port) {
//     final List<HiveNewsModel> data = message[0] as List<HiveNewsModel>;
//     final SendPort replyPort = message[1] as SendPort;
//     final String boxName = message[2] as String;

//     // Initialize Hive in the new isolate
//     WidgetsFlutterBinding.ensureInitialized();
//     final appDocDir = await getApplicationDocumentsDirectory();
//     Hive.init(appDocDir.path);
//     var box = await Hive.openBox<HiveNewsModel>(boxName);

//     for (var element in data) {
//       await box.add(element);
//     }

//     await box.close(); // Close the box after operation

//     replyPort.send('Data stored');
//   }
// }

storeData(List<NewsModelEntity> hiveNewsModel) async {
  final box = injection.get<Box<NewsModelEntity>>();

  if (box.values.isNotEmpty) {
    await box.clear();
  }

  for (var element in hiveNewsModel) {
    await box.add(element);
  }
}

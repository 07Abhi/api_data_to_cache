import 'dart:convert' as Json;
import 'package:http/http.dart' as http;
import 'package:path_provider/path_provider.dart';
import 'dart:io';

/*Set the file name according to your convinence*/
class Networking {
  Future getApiData(String url) async {
    String filename = 'apidata.json';
    //it will give the path of the file
    var dirPath = await getTemporaryDirectory();
    print('$dirPath');
    File file = new File(dirPath.path + "/" + filename);
    if (file.existsSync()) {
      print('getting data from cache');
      var jsonData = file.readAsStringSync();
      var data = Json.jsonDecode(jsonData);
      return data['data'];
    }
    http.Response response = await http.get(url);
    if (response.statusCode == 200) {
      print('getting data from api');
      var data = Json.jsonDecode(response.body);
      file.writeAsStringSync(response.body, flush: true, mode: FileMode.write);
      return data['data'];
    }
  }
}

import 'package:cachedata/model/userdata.dart';
import 'networkmanagement.dart';

Networking apiData = Networking();

class ApiDataManager {
  Future getUserData(String url) async {
    List<UserData> datalist = [];
    var data = await apiData.getApiData(url);
    if (data != null) {
      data.forEach(
        (value) {
          datalist.add(
            UserData(
              firstName: value['first_name'],
              lastName: value['last_name'],
              email: value['email'],
              avatar: value['avatar'],
            ),
          );
        },
      );
    }
    return datalist;
  }
}

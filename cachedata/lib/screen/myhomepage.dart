import 'package:flutter/material.dart';
import 'package:cachedata/model/userdata.dart';
import 'package:cachedata/networking/apidatafetch.dart';

/*Your api here*/
String url = 'https://reqres.in/api/users';

class MyHomePage extends StatelessWidget {
  List<UserData> userdata = [];
  ApiDataManager apidata = ApiDataManager();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Data caching flutter'),
        backgroundColor: Colors.pink,
      ),
      /*make Changes in widgets according to your requirement*/
      body: FutureBuilder(
        future: apidata.getUserData(url),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          userdata = snapshot.data;
          return ListView.builder(
            itemBuilder: (context, index) {
              return ListTile(
                leading: CircleAvatar(
                  radius: 30.0,
                  backgroundImage: NetworkImage(userdata[index].avatar),
                ),
                title: Text(
                  '${userdata[index].firstName} ${userdata[index].lastName}',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                subtitle: Text(userdata[index].email),
              );
            },
            itemCount: userdata.length,
            shrinkWrap: true,
          );
        },
      ),
    );
  }
}

import 'package:api/api/api_manger.dart';
import 'package:api/home/sources_tabs.dart';
import 'package:api/model/sources_response.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  static const String routName = 'homescrren';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Route Vews App'),
      ),
      body: Column(
        children: [
          FutureBuilder<SourcesResponse>(
            future: ApiManger.getNewsSources(),
            builder: (buildContext, snapshot) {
              if (snapshot.hasError) {
                return Text('${snapshot.error.toString()}');
              } else if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(child: CircularProgressIndicator());
              }
              var data = snapshot.data;
              if ('erorr' == data?.status) {
                return Center(child: Text({'${data?.message}'} as String));
              }
              var sources = data?.sources;
              return SourcesTabs(sources!);
            },
          )
        ],
      ),
    );
  }
}

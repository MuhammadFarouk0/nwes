import 'package:api/api/api_manger.dart';
import 'package:api/model/news_response.dart';
import 'package:api/model/sources_response.dart';
import 'package:flutter/material.dart';

import 'news_widget.dart';

class NewsList extends StatelessWidget {
  Source source;
  NewsList(this.source);
  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 5,
      child: Column(
        children: [
          FutureBuilder<NewsResponse>(
            future: ApiManger.getNewLBySourceId(String, source.id),
            builder: (_, snapshot) {
              if (snapshot.hasError) {
                return Text('${snapshot.error.toString()}');
              } else if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(child: CircularProgressIndicator());
              }
              var data = snapshot.data;
              if ('erorr' == data?.status) {
                return Center(child: Text({'${data?.message}'} as String));
              }
              return Expanded(
                child: ListView.builder(
                  itemBuilder: (_, index) {
                    return NewsWidget((data?.newsList![index])!);
                  },
                  itemCount: data?.newsList?.length ?? 0,
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}

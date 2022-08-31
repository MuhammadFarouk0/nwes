import 'package:api/home/news_list.dart';
import 'package:api/home/source_tabe.dart';
import 'package:api/model/sources_response.dart';
import 'package:flutter/material.dart';

class SourcesTabs extends StatefulWidget {
  List<Source> sources;
  SourcesTabs(this.sources);

  @override
  State<SourcesTabs> createState() => _SourcesTabsState();
}

class _SourcesTabsState extends State<SourcesTabs> {
  int selectedTab = 0;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: DefaultTabController(
        
        length: widget.sources.length,
        child: Column(
          children: [
            TabBar(
                onTap: (index) {
                  selectedTab = index;
                  setState(() {});
                },
                indicatorColor: Colors.transparent,
                isScrollable: true,
                tabs: widget.sources.map((source) {
                  var isSelected = widget.sources.indexOf(source) == selectedTab;
                  return SourceTab(source, isSelected);
                }).toList()),
            NewsList(widget.sources[selectedTab]),
          ],
        ),
      ),
    );
  }
}

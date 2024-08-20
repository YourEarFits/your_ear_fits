import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:your_ear_fits/Earbuds/earbuds_list_view_model.dart';
import 'package:your_ear_fits/Earbuds/earbuds_widget.dart';

class EarbudsListView extends StatelessWidget {
  /// 이어폰 목록 화면
  const EarbudsListView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('이어폰 목록'),
      ),
      body: Consumer<EarbudsListViewModel>(
        builder: (context, value, child) {
          return ListView.builder(
            itemCount: value.earbudsList.length,
            itemBuilder: (context, index) {
              return EarbudsWidget(earbudsModel: value.earbudsList[index]);
            },
          );
        },
      ),
    );
  }
}

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class EarbudsListScreen extends StatelessWidget {
  const EarbudsListScreen({super.key});

  Future<List<QueryDocumentSnapshot<Map<String, dynamic>>>>
      _getEarbudsList() async {
    final earbudsSnapshot =
        await FirebaseFirestore.instance.collection('Earbuds').get();

    // 데이터 확인을 위한 코드
    // for (final doc in earbudsSnapshot.docs) {
    //   final name = doc.data()['name'];
    //   print(name);
    // }
    return earbudsSnapshot.docs;
  }

  @override
  Widget build(BuildContext context) {
    _getEarbudsList();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text('이어폰 목록'),
      ),
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FutureBuilder(
              future: _getEarbudsList(),
              builder: (context, snapshot) {
                if (!snapshot.hasData) {
                  return const CircularProgressIndicator();
                } else {
                  final earbudsList = snapshot.data
                      as List<QueryDocumentSnapshot<Map<String, dynamic>>>;
                  return Expanded(
                    child: ListView.builder(
                      itemCount: earbudsList.length,
                      itemBuilder: (context, index) {
                        final earbuds = earbudsList[index];
                        return ListTile(
                          title: Text(earbuds.data()['name']),
                          subtitle: Text(earbuds.data()['specs']),
                        );
                      },
                    ),
                  );
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}

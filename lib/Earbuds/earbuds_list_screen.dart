import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class EarbudsListScreen extends StatelessWidget {
  const EarbudsListScreen({super.key});

  Future<List<Object>> _getEarbudsList() async {
    // Get a reference your Supabase client
    final supabase = Supabase.instance.client;
    final data = await supabase.from('products').select();

    return data;
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
                if (snapshot.hasData) {
                  return Expanded(
                    child: ListView.builder(
                      itemCount: snapshot.data!.length,
                      itemBuilder: (context, index) {
                        final product =
                            snapshot.data![index] as Map<String, dynamic>;
                        return ListTile(
                          // 이미지
                          leading: Image.network(product['image_src']),
                          // 제목
                          title: Text(product['name']),
                          // 부제목
                          subtitle: Text(product['specs']),
                        );
                      },
                    ),
                  );
                } else {
                  return const CircularProgressIndicator();
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}

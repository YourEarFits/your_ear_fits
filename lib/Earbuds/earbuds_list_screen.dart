import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:your_ear_fits/Earbuds/product_item_widget.dart';

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
                        return ProductItemWidget(product: product);
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

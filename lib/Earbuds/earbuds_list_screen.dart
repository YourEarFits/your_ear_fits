import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:your_ear_fits/Earbuds/earbuds_list_widget.dart';

class EarbudsListScreen extends StatelessWidget {
  const EarbudsListScreen({super.key});

  Future<List<Map<String, dynamic>>> _getEarbudsList() async {
    final supabase = Supabase.instance.client;
    final data = await supabase.from('products').select();

    return data;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text('이어폰 목록'),
      ),
      backgroundColor: Colors.white,
      body: Column(
        children: [
          EarbudsListWidget(searchResults: _getEarbudsList()),
        ],
      ),
    );
  }
}

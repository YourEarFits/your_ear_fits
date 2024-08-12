import 'package:flutter/material.dart';

class Event {
  final String title;
  final String description;
  final String imageUrl;

  Event({
    required this.title,
    required this.description,
    required this.imageUrl,
  });
}

class EventPageScreen extends StatelessWidget {
  const EventPageScreen({super.key});

  // 이벤트 리스트
  List<Event> getEvents() {
    return [
      Event(
        title: "이벤트 1",
        description: "이벤트 1의 상세 내용입니다.",
        imageUrl: "https://cdn.discordapp.com/attachments/1242032785812750346/1272361007330885753/Pngtreeblack_friday_event_banner_background_1238994.jpg?ex=66bab207&is=66b96087&hm=0c158eb2831eec052c1907f869b868ce8405a72947ff9c367e6c3482926ce57f&",
      ),
      Event(
        title: "이벤트 2",
        description: "이벤트 2의 상세 내용입니다.",
        imageUrl: "https://via.placeholder.com/150",
      ),
      Event(
        title: "이벤트 3",
        description: "이벤트 3의 상세 내용입니다.",
        imageUrl: "https://via.placeholder.com/150",
      ),
    ];
  }

  void _showEventDialog(BuildContext context, Event event) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(event.title),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Image.network(event.imageUrl),
              const SizedBox(height: 10),
              Text(event.description),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text("닫기"),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final events = getEvents();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text('이벤트'),
      ),
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            for (var event in events)
              GestureDetector(
                onTap: () => _showEventDialog(context, event),
                child: Container(
                  width: double.infinity,
                  height: 260, // 배너 높이 조정
                  margin: const EdgeInsets.symmetric(vertical: 10),
                  decoration: BoxDecoration(
                    color: Colors.blue, // 배너의 배경색
                    borderRadius: BorderRadius.circular(10),
                    image: DecorationImage(
                      image: NetworkImage(event.imageUrl),
                      fit: BoxFit.cover,
                      colorFilter: ColorFilter.mode(
                        Colors.black.withOpacity(0.6),
                        BlendMode.darken,
                      ),
                    ),
                  ),
                  child: Center(
                    child: Text(
                      event.title,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ),
            const Spacer(),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
              child: Text("이벤트가 없습니다."),
            ),
          ],
        ),
      ),
    );
  }
}

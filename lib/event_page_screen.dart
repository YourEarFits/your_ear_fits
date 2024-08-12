import 'package:flutter/material.dart';

class Event {
  final String date;
  final String description;
  final String imageUrl;

  Event({
    required this.date,
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
        date: "2024-08-12 ~ 2024-08-30",
        description: "블랙 프라이데이 슈퍼 세일 이벤트",
        imageUrl: "https://cdn.discordapp.com/attachments/1242032785812750346/1272361007330885753/Pngtreeblack_friday_event_banner_background_1238994.jpg?ex=66bab207&is=66b96087&hm=0c158eb2831eec052c1907f869b868ce8405a72947ff9c367e6c3482926ce57f&",
      ),
      Event(
        date: "2024-08-01 ~ 2024-08-30",
        description: "3주년 기념 이벤트!",
        imageUrl: "https://media.discordapp.net/attachments/1242032785812750346/1272368857176080414/Pngtreecelebration_3rd_anniversary_banner_1598181.png?ex=66bab957&is=66b967d7&hm=02b498d991cdb57a898ad6f7c9cb8d450fd89cdd4cd7c914d507b9b9aac5ae7c&=&format=webp&quality=lossless&width=960&height=450",
      ),
    ];
  }

  void _showEventDialog(BuildContext context, Event event) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(event.date),
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
            if (events.isEmpty)
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                child: Text("이벤트가 없습니다."),
              ),
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
                    ),
                  ),
                  child: Align(
                    alignment: Alignment.bottomRight, // 우측 하단 정렬
                    child: Padding(
                      padding: const EdgeInsets.all(10), // 여백 추가
                      child: Text(
                        event.date,
                        style: const TextStyle(
                          backgroundColor: Colors.black,
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.right,
                      ),
                    ),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}

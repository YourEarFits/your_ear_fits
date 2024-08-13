import 'package:flutter/material.dart';

class Event {
  final String date;
  final String eventTitle;
  final String description;
  final String imageUrl;

  Event({
    required this.date,
    required this.eventTitle,
    required this.description,
    required this.imageUrl,
  });
}

class EventPageScreen extends StatelessWidget {
  const EventPageScreen({super.key});

  // 이벤트 리스트
  // Event(date:이벤트 날짜 20xx-xx-xx ~ 20xx-xx-xx, eventTitle: "이벤트 제목 입력" description: "이벤트 배너에서 볼 수 있는 내용 입력", imageUrl: 이지미 주소 입력)
  // 이벤트가 하나도 없을 시 "이벤트가 없습니다."라는 텍스트가 표시됩니다.

  List<Event> getEvents() {
    return [
      Event(
        date: "2024-08-12 ~ 2024-08-30",
        eventTitle:"블랙 프라이데이 슈퍼 세일 이벤트",
        description: "블랙 프라이데이 슈퍼 세일 이벤트에 대한 상세 내용들",
        imageUrl: "https://cdn.discordapp.com/attachments/1242032785812750346/1272361007330885753/Pngtreeblack_friday_event_banner_background_1238994.jpg?ex=66bb5ac7&is=66ba0947&hm=402689964fded8c7b3050fb814424b1457a33efb9cdfb99ef5327c27f0963497&",
      ),
      Event(
        date: "2024-08-01 ~ 2024-08-30",
        eventTitle:"3주년 기념 이벤트!!",
        description: "3주년 기념 이벤트에 대한 상세 내용들",
        imageUrl: "https://media.discordapp.net/attachments/1242032785812750346/1272368857176080414/Pngtreecelebration_3rd_anniversary_banner_1598181.png?ex=66bab957&is=66b967d7&hm=02b498d991cdb57a898ad6f7c9cb8d450fd89cdd4cd7c914d507b9b9aac5ae7c&=&format=webp&quality=lossless&width=960&height=450",
      ),
    ];
  }

  // 이벤트 배너 내부
  void _showEventDialog(BuildContext context, Event event) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(event.eventTitle),
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

  // 이벤트 페이지
  @override
  Widget build(BuildContext context) {
    final events = getEvents();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text('이벤트'),
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,

            // 이벤트 여부
            children: [
              if (events.isEmpty)
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                  child: Text("이벤트가 없습니다."),
                ),

              // 이벤트 표시
              for (var event in events)
                GestureDetector(
                  onTap: () => _showEventDialog(context, event),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: double.infinity,
                        margin: const EdgeInsets.symmetric(vertical: 10),
                        decoration: BoxDecoration(
                          color: Colors.blue,
                          borderRadius: BorderRadius.circular(30),
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(30),
                          child: Image.network(
                            event.imageUrl,
                            fit: BoxFit.contain,
                          ),
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        event.eventTitle,
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        event.date,
                        style: const TextStyle(
                          color: Colors.grey,
                          fontSize: 16,
                        ),
                      ),
                      const SizedBox(height: 20),
                    ],
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
import 'package:chatter/app.dart';
import 'package:chatter/theme.dart';
import 'package:flutter/material.dart';
import 'package:stream_chat_flutter_core/stream_chat_flutter_core.dart';

void main() async {
  // WidgetsFlutterBinding.ensureInitialized();
  // await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  final client = StreamChatClient(streamKey);

  await client.connectUser(User(id: 'tutorial-flutter'));
  final channel = client.channel('messaging', id: 'flutterdevs');
  channel.watch();
  runApp(
    MyApp(
      client: client,
      channel: channel,
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({
    Key? key,
    required this.client}) : super(key: key);
    final StreamChatClient client;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: AppTheme.light(),
      darkTheme: AppTheme.dark(),
      themeMode: ThemeMode.dark,
      title: 'Chatter',
      builder: (context, child){
        return StreamChatCore(
          client: client,
          child: child!,
        );
      },
      home: HomeScreen(),
    );
  }
}

class ChannelPage extends StatelessWidget {
  const ChannelPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children:[
          Expanded(child: MessageListView(),)
        ]
      ),
      MessageInput(),
    );
  }
}
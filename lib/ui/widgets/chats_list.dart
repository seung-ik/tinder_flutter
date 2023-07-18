import 'package:flutter/material.dart';
import 'package:tinder_new/data/model/chat_with_user.dart';
import 'package:tinder_new/data/model/chats_observer.dart';
import 'package:tinder_new/ui/widgets/chat_list_tile.dart';

class ChatsList extends StatefulWidget {
  final List<ChatWithUser> chatWithUserList;
  final Function(ChatWithUser) onChatWithUserTap;
  final String myUserId;

  const ChatsList({super.key, required this.chatWithUserList, required this.onChatWithUserTap, required this.myUserId});

  @override
  ChatsListState createState() => ChatsListState();
}

class ChatsListState extends State<ChatsList> {
  late ChatsObserver _chatsObserver;

  @override
  void initState() {
    super.initState();
    _chatsObserver = ChatsObserver(widget.chatWithUserList);
    _chatsObserver.startObservers(chatUpdated);
  }

  @override
  @mustCallSuper
  @protected
  void dispose() {
    _chatsObserver.removeObservers();
    super.dispose();
  }

  void chatUpdated() {
    setState(() {});
  }

  bool changeMessageSeen(int index) {
    return widget.chatWithUserList[index].chat.lastMessage!.seen == false &&
        widget.chatWithUserList[index].chat.lastMessage!.senderId != widget.myUserId;
  }

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      separatorBuilder: (BuildContext context, int index) => const Divider(color: Colors.grey),
      itemCount: widget.chatWithUserList.length,
      itemBuilder: (BuildContext _, int index) => ChatListTile(
        chatWithUser: widget.chatWithUserList[index],
        onTap: () {
          if (widget.chatWithUserList[index].chat.lastMessage != null && changeMessageSeen(index)) {
            widget.chatWithUserList[index].chat.lastMessage!.seen = true;
            chatUpdated();
          }
          widget.onChatWithUserTap(widget.chatWithUserList[index]);
        },
        onLongPress: () { },
        myUserId: widget.myUserId,
      ),
    );
  }
}

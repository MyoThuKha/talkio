enum ChatStatus {seen,unseen}

class ChatModel{
  String message;
  String sender;
  //for reply
  int? reference;
  String date;
  List<Reaction> reactions;
  List<ChatStatusModel> state;

  ChatModel({required this.message, required this.sender, required this.date, this.reference, required this.reactions, required this.state});
}



class Reaction {
  String reactor;
  String reaction;
  Reaction({required this.reaction, required this.reactor});
}




class ChatStatusModel {
  String byUser;
  ChatStatus status;

  
  ChatStatusModel({required this.byUser, required this.status});
}
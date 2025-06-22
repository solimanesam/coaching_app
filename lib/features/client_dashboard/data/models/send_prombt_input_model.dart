class SendPrombtInputModel {
  const SendPrombtInputModel({required this.prombt});

  final String prombt;

  Map<String, dynamic> toJson(){
    return {
      "prombt": prombt
    };
  }
}

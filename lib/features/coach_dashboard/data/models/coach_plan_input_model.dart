class CoachPlanInputModel{
  const CoachPlanInputModel({
    required this.price,
    required this.durationInDays,
    required this.details
  });
  
  final String price, durationInDays, details;

  Map<String, String> toJson(){
    return {
      "price": price,
      "durationInDays": durationInDays,
      "details": details
    };
  }
}
import 'dart:convert';

Internship getJobResFromJson(String str) =>
    Internship.fromJson(json.decode(str));

String getJobResToJson(Internship data) => json.encode(data.toJson());

class Internship {
  Internship({
    required this.id,
    required this.title,
    required this.location,
    required this.company,
    required this.salary,
    required this.period,
    required this.contract,
    required this.requirements,
    required this.imageUrl,
    required this.agentId,
    required this.updatedAt,
  });

  final String id;
  final String title;
  final String location;
  final String company;
  final String salary;
  final String period;
  final String contract;
  final List<String> requirements;
  final String imageUrl;
  final String agentId;
  final DateTime updatedAt;

  factory Internship.fromJson(Map<String, dynamic> json) => Internship(
        id: json["_id"],
        title: json["title"],
        location: json["location"],
        company: json["company"],
        salary: json["salary"],
        period: json["period"],
        contract: json["contract"],
        requirements: List<String>.from(json["requirements"].map((x) => x)),
        imageUrl: json["imageUrl"],
        agentId: json["agentId"],
        updatedAt: DateTime.parse(json["updatedAt"]),
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "title": title,
        "location": location,
        "company": company,
        "salary": salary,
        "period": period,
        "contract": contract,
        "requirements": List<dynamic>.from(requirements.map((x) => x)),
        "imageUrl": imageUrl,
        "agentId": agentId,
        "updatedAt": updatedAt.toIso8601String(),
      };
}

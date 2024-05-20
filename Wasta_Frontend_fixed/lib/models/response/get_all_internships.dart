class Internships {
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
  final String createdAt;
  final String updatedAt;
  final int v;

  Internships({
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
    required this.createdAt,
    required this.updatedAt,
    required this.v,
  });

  factory Internships.fromJson(Map<String, dynamic> json) {
    return Internships(
      id: json['_id'],
      title: json['title'],
      location: json['location'],
      company: json['company'],
      salary: json['salary'],
      period: json['period'],
      contract: json['contract'],
      requirements: List<String>.from(json['requirements'].map((x) => x)),
      imageUrl: json['imageUrl'],
      agentId: json['agentId'],
      createdAt: json['createdAt'],
      updatedAt: json['updatedAt'],
      v: json['__v'],
    );
  }
}

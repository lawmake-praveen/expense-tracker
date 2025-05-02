class ExpanseCategoryModal {
  final int id;
  final String name;

  ExpanseCategoryModal({required this.id, required this.name});

  factory ExpanseCategoryModal.fromJson(Map<String, dynamic> json) {
    return ExpanseCategoryModal(id: json['id'], name: json['name']);
  }

  Map<String, dynamic> toJson() {
    return {'id': id, 'name': name};
  }
}

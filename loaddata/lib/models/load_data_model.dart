class LoadData {
  final String username;
  final String email;

  LoadData(this.username, this.email);

  factory LoadData.fromJson(Map<String, dynamic> json) {
    return LoadData(
      json['username'] as String,
      json['email'] as String,
    );
  }
}

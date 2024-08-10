class ModelAuthUser {
  String? userName;
  String? password;

  ModelAuthUser({this.userName, this.password});

  void setEmail(String? value) => userName = value;
  void setPass(String? value) => password = value;

  @override
  String toString() => 'ModelAuthUser(email: $userName, password: $password)';
}

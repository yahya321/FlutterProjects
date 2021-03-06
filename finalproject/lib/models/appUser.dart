class AppUser {
  static String? id;
  String name;
  String email;
  String password;
  static List<String> favorites = [];
  static List<String> recently = [];

  AppUser({required this.name, required this.email, required this.password});
  toMap() {
    return {
      'name': name,
      "email": email,
      "password": password,
    };
  }

  setName(String name) {
    this.name = name;
  }

  setEmail(String email) {
    this.email = email;
  }

  setPassword(String password) {
    this.password = password;
  }

  String getName() {
    return this.name;
  }

  String getEmail() {
    return this.email;
  }

  String getPassword() {
    return this.password;
  }
}

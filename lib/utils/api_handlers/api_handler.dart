abstract class Api {
  Future<dynamic> register({
    required String? email,
  });

  Future<dynamic> getApiToken({
    required String? email,
    required String password,
  });

  Future<dynamic> getUserProfile();

  Future<dynamic> updateUserProfile({
    required String firstName,
    required String lastName,
    required String country,
  });
}

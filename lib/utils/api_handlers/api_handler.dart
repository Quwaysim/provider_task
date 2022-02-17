abstract class Api {
  Future<dynamic> register({
    required String? email,
  });

  Future<dynamic> getApiToken({
    required String? email,
    required String token,
  });

  Future<dynamic> getUserProfile({required String token});

  Future<dynamic> updateUserProfile({
    required String firstName,
    required String lastName,
    required String country,
    required String token,
  });
}

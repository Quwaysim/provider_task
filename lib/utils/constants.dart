///registration endpoint, takes ''email'' only as reqBody - POST.
const String registrationEndpoint = 'accounts/otp/email/';

///Endpoint get the user token - POST.
const String getTokenEndpoint = 'accounts/otp/token/';

///Endpoint to get the user profile - GET.
const String userProfileEndpoint = 'accounts/user/';

///Endpoint to update user details - PUT.
const String updateUserProfileEndpoint =
    'accounts/name-and-country-of-residence/update';

//SharedPreferences Keys
const String emailKey = 'email';
const authTokenKey = 'authToken';

class EndPoints {
  static const String baseUrL = 'https://faciliator.digit-tips.com/api/';
  // * Authantication
  static const String login = 'auth/user/login';
  static const String register = 'auth/user/register';
  // * Verify Email
  static const String verify = 'varifyEmail/checkEmail';
  static const String resendCode = 'varifyEmail/resendCode';
  // * Change Password
  static const String verifyEmail = 'forgetPassword/verify';
  static const String forgetPassword = 'forgetPassword/forgetPass';
  static const String changePassword = 'forgetPassword/changePassword';
  // * User
  static const String updateUser = 'users/update';
  static const String getUserById = 'users/byId';
  // * Bannar
  static const String bannar = 'bannar/all';
  // * Services
  static const String services = 'services/all';
  // * Partners
  static const String partners = 'partner/all';
  // * Setting
  static const String aboutUs = 'aboutUs/all';
  static const String setting = 'setting/all';
  static const String termsAndConditions = 'tearms/all';
  static const String blog = 'blog/all';
  // * Contact Us
  static const String contact = 'contactUs/create';
  // * Project Type
  static const String projectType = 'projectsType/all';
  // * Duration
  static const String duration = 'durations/all';
  // * Appointment
  static const String projectOneTime = 'oneTimeProject/add';
  static const String kitchen = 'kitchen/add';
}

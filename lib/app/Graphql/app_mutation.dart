class AppMutations {
  static const registerAsUser =
  r'''mutation {
  registerAsUser(input:{
    name: $name
    email: $email
    password: $password
    gender: $gender
    phone: $phone
    country: $country
  }) {
    data{
      id
      name
    }
    code
    success
    message
  }
}
 '''  ;
  static const sendEmail =
      r'''mutation SendEmailVerificationCode {
    sendEmailVerificationCode(input: {email: $email, useCase: $useCase}) {
        data
        success
        code
        message
    }
}
      ''';
  static const emailAndPasswordLogin =
  r'''mutation EmailAndPasswordLogin {
    emailAndPasswordLogin(input: {email: $email, password: $password}) {
        success
        code
        message
        data {
            id
            token
        }
    }
}
  ''';
  static const verifyUserByEmail =
  r'''mutation VerifyUserByEmail {
    verifyUserByEmail(input: {email: $email, code: $code}) {
        data {
            id
            name
            token
        }
        success
        code
        message
    }
}
  ''';
  static const resetPasswordByEmail =
  r'''mutation ResetPasswordByEmail {
    resetPasswordByEmail(input: {email: $email, code: $code, newPassword: $newPassword}) {
        success
        code
        message
        data {
            id
            token
        }
    }
    }
  ''';
}


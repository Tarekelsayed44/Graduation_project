class AppMutations {

  static const registerAsUser = r'''
  mutation registerAsUser($input: RegisterAsUserInput!){
  registerAsUser(input: $input) {
    data{
      id
      name
    }
    code
    success
    message
  }
}
 ''';
  static const sendCode = r'''
  mutation sendEmailVerificationCode($input: SendEmailVerificationCodeInput!){
  sendEmailVerificationCode(input: $input){
    data
    success
    code
    message
  }
}
''';
  static const emailAndPasswordLogin = r'''
  mutation emailAndPasswordLogin($input: EmailAndPasswordLoginInput!){
    emailAndPasswordLogin(input:$input) {
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
  static const verifyUserByEmail = r'''
  mutation verifyUserByEmail($input: VerifyUserByEmailInput!) {
    verifyUserByEmail(input: $input) {
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
  static const resetPasswordByEmail = r'''
  mutation resetPasswordByEmail($input: ResetPasswordByEmailInput!){
    resetPasswordByEmail(input: $input) {
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
  static const createVehicle = r'''
  mutation createVehicle($input: CreateVehicleInput!) {
    createVehicle(input:$input) {
        success
        code
        message
        data {
            id
            userId
            description
            country
            vehicleType
        }
    }
  }
''';
  static const deleteVehicle=r'''
  mutation deleteVehicle($vehicleId:UUID!){
    deleteVehicle(vehicleId: $vehicleId) {
        data
        success
        code
        message
    }
  }
 ''';
}
  // registerAsUser(input:{
//     name: $name
//     email: $email
//     password: $password
//     gender: $gender
//     phone: $phone
//     country: $country
//   }) {
//     data{
//       id
//       name
//     }
//     code
//     success
//     message
//   }
// }
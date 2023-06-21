class AppMutations {

  static const registerAsUser = r'''
  mutation registerAsUser($input: RegisterAsUserInput!){
  registerAsUser(input: $input) {
    data{
      id
      name
      token
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
  static const paymobPayment=r'''
  mutation preparePaymobPayment ($parkingSpaceId: UUID!) {
    preparePaymobPayment(parkingSpaceId: $parkingSpaceId) {
      data
      success
      code
      message
    }
  }
 ''';
  static const changePass= r'''
 mutation ChangePassword($input: ChangePasswordInput!) {
  changePassword(input: $input) {
    data {
      name
      id
    }
    success
    code
    message
  }
}
 ''';
  static const createTag= r'''
  mutation CreateTag($input: CreateTagInput!) {
  createTag(input: $input) {
    data {
      userId
      tagUID
    }
    success
    code
    message
  }
 }
 ''';
  static const deleteTag= r'''
 mutation DeleteTag($tagId: UUID!) {
  deleteTag(tagId: $tagId) {
    data
    success
    code
    message
  }
}
 ''';
  static const updateProfile= r'''
mutation UpdateUserProfile($input: UpdateUserProfileInput!) {
  updateUserProfile(input: $input) {
    data {
      name
      id
    }
    success
    code
    message
  }
}
 ''';
  static const updateVehicle= r'''
mutation UpdateVehicle($input: UpdateVehicleInput!) {
  updateVehicle(input: $input) {
    data {
      id
    }
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
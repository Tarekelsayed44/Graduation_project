class AppMutations {
  static const registerAsUser =
  r'''mutation RegisterAsUser {
    registerAsUser(input: {name: $name, email: $email, gender: $gender, password: $password, phone: $phone, country: $country}) {
         data{
      id
      name
    }
        success
        code
        message
    }
}
 '''  ;
}


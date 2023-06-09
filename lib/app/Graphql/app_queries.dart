class AppQueries {
static const vehicleQuery = r''' query MyVehicles {
myVehicles {
success
code
message
data {
id
userId
description
country
vehicleType
plateDigits
plateLetters
isPrimary
isBlocked
createdAt
updatedAt
user {
id
name
slug
verifiedEmail
phone
gender
role
avatar
country
birthDate
isAdmin
isActive
isBlocked
token
createdAt
updatedAt
}
}
}
}
''';
static const userQuery = r''' query {
  user (userId: $id) {
    data {
      id
      name
      verifiedEmail
    }
    code
    message
  }
}


''';
static const myTag = r'''query MyTags {
    myTags {
        success
        code
        message
        data {
            id
            userId
            tagUID
            isActive
            createdAt
            updatedAt
        }
    }
}
''';
static const me = r'''
query Me {
    me {
        success
        code
        message
        data {
            id
            name
            slug
            verifiedEmail
            phone
            gender
            role
            avatar
            country
            birthDate
            isAdmin
            isActive
            isBlocked
            token
            createdAt
            updatedAt
        }
    }
}
''';
}
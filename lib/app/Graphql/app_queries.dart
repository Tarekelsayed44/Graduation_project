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
  user (userId: "d7b3209c-1841-412b-beeb-f2f379680aaf") {
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
}
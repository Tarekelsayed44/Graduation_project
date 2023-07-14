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
static const searchquery= r'''
query ParkingSpaces($filter: ParkingSpacesFilter, $paginate: PaginateInput) {
  parkingSpaces(filter: $filter, paginate: $paginate) {
    code
    data {
      items {
        id
        userId
        name
        slug
        email
        type
        zipCode
        long
        lat
        price
        address
        details
        images
        isActive
        isBlocked
        token
        createdAt
        updatedAt
      }
      pageInfo {
        page
        totalPages
        totalCount
        limit
        hasNext
        hasBefore
      }
    }
    message
    success
  }
}
''';
static const floorquery=
r'''
query Query($input: parkingFloorMapPerDurationInput) {
parkingFloorMapPerDuration(input: $input)
}
''';
}
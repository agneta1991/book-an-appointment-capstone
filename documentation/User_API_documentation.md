# API Documentation

## Users

### List all users

**Endpoint:**
`GET /api/v1/users`

**Description:**
Get a list of all users.

**Parameters:**
None

**Response:**
#### Status Code
200 OK

#### Body
```json
[
  {
    "id": 1,
    "name": "Agneta",
    "email": "agneta@agneta.com",
    "admin": true
  },
  {
    "id": 2,
    "name": "Arnold",
    "email": "arnold@arnold.com",
    "admin": false
  }
]
```

## List Individual Users

**Endpoint:**
`GET /api/v1/users/:id`

**Description:**
Get details of a specific user.

**Parameters:**
- `id` (User ID)

**Response:**
#### Status Code
200 OK

#### Body
```json
[
  {
    "id": 1,
    "name": "Agneta",
    "email": "agneta@agneta.com",
    "admin": true
  }
]

```

## Create Users

**Endpoint:**
`GET /api/v1/users/:id`

**Description:**
Create a user.

**Parameters:**
Not sure

**Response:**
#### Status Code
201 Created

#### Body
```json
[
  {
    "id": 3,
    "name": "Bhekisile",
    "email": "bhekisile@bhekisile.com",
    "admin": true
  }
]
```

## Update Users

**Endpoint:**
`GET /api/v1/users/:id`

**Description:**
Update existing user.

**Parameters:**
- Details how you would like to update the user
- User id
- JSON object containing updated user details.

**Response:**
#### Status Code
200 OK

#### Body
```json
[
  {
    "id": 3,
    "name": "Bhekisile Jozi",
    "email": "bhekisile@bhekisile.com",
    "admin": true
  }
]

```

## Delete Users

**Endpoint:**
`GET /api/v1/users/:id`

**Description:**
Delete existing user.

**Parameters:**
- User id

**Response:**
#### Status Code
204 No Content

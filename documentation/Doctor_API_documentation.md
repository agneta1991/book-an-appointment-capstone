# API Documentation

## Doctors

### List all doctors

**Endpoint:**
`GET /api/v1/doctors`

**Description:**
Get a list of all doctors.

**Parameters:**
None

**Response:**
#### Status Code
200 OK

#### Body
```json
[
  {
    "id": 2,
    "name": "Robert Jameson",
    "specialization": "Family Medicine",
    "years_of_experience": 12,
    "price_per_appointment": "200.0",
    "user_id": 1,
  },
  {
    "id": 3,
    "name": "Gabriel Lloyd",
    "specialization": "Pediatrics",
    "years_of_experience": 14,
    "price_per_appointment": "180.0",
    "user_id": 2,
  },
]

```

## List Individual Doctor

**Endpoint:**
`GET /api/v1/doctors/:id`

**Description:**
Get details of a specific doctor.

**Parameters:**
- `id` (Doctor ID)

**Response:**
#### Status Code
200 OK

#### Body
```json
[
  {
    "id": 2,
    "name": "Robert Jameson",
    "specialization": "Family Medicine",
    "years_of_experience": 12,
    "price_per_appointment": "200.0",
    "user_id": 1,
  }
]

```

## Create Doctor

**Endpoint:**
`GET /api/v1/doctors/:id`

**Description:**
Create a doctor.

**Parameters:**
# NOT SURE  

**Response:**
#### Status Code
201 Created

#### Body
```json
[
  {
    "id": 1,
    "name": "Rob Grey",
    "specialization": "Orthopedics",
    "years_of_experience": 17,
    "price_per_appointment": "230.0",
    "user_id": 1,
  },
]
```

## Update Users

**Endpoint:**
`GET /api/v1/doctors/:id`

**Description:**
Update existing doctor.

**Parameters:**
- Details how you would like to update the doctor
- Doctor id
- JSON object containing updated user details.

**Response:**
#### Status Code
200 OK

#### Body
```json
[
{
    "id": 1,
    "name": "Rob Grey",
    "specialization": "Orthopedics",
    "years_of_experience": 7,
    "price_per_appointment": "130.0",
    "user_id": 1,
  },
]

```

## Delete Doctor

**Endpoint:**
`GET /api/v1/doctors/:id`

**Description:**
Delete existing user.

**Parameters:**
- Doctor id

**Response:**
#### Status Code
204 No Content

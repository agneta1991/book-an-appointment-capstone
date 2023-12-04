# API Documentation

## Reservations

### List all reservations

**Endpoint:**
`GET /api/v1/reservations`

**Description:**
Get a list of all reservations that belong to a current user.

**Parameters:**
# not sure

**Response:**
#### Status Code
200 OK

#### Body
```json
 [ 
    {
    "id": 6,
    "time": "16:20",
    "date":  "01/01/2024",
    "user_id": 2,
    "doctor_id": 2,
    "description": "Description for the reservation 6"
    },

    {
    "id": 7,
    "time": "17:20",
    "date":  "01/01/2024",
    "user_id": 2,
    "doctor_id": 1,
    "description": "Description for the reservation 7"
    },
]


```

## List Individual Reservation

**Endpoint:**
`GET /api/v1/reservations/:id`

**Description:**
Get details of a specific reservation.

**Parameters:**
- `id` (Reservation ID)

**Response:**
#### Status Code
200 OK

#### Body
```json
[
  {
    "id": 7,
    "time": "17:20",
    "date":  "01/01/2024",
    "user_id": 2,
    "doctor_id": 1,
    "description": "Description for the reservation 7"
    },
]

```

## Create Reservation

**Endpoint:**
`GET /api/v1/reservations/:id`

**Description:**
Create a reservation.

**Parameters:**
# NOT SURE  

**Response:**
#### Status Code
201 Created

#### Body
```json
[
  {
    "id": 8,
    "time": "17:20",
    "date":  "02/01/2024",
    "user_id": 2,
    "doctor_id": 1,
    "description": "Description for the reservation 8"
    },,
]
```

## Update Reservation

**Endpoint:**
`GET /api/v1/reservations/:id`

**Description:**
Update existing reservation.

**Parameters:**
- Details how you would like to update the doctor
- Reservation id
- JSON object containing updated user details.

**Response:**
#### Status Code
200 OK

#### Body
```json
[
{
    "id": 8,
    "time": "17:20",
    "date":  "02/02/2024",
    "user_id": 2,
    "doctor_id": 1,
    "description": "Description for the reservation 8"
    },
]

```

## Delete Doctor

**Endpoint:**
`GET /api/v1/reservations/:id`

**Description:**
Delete existing reservation.

**Parameters:**
- Reservation id

**Response:**
#### Status Code
204 No Content

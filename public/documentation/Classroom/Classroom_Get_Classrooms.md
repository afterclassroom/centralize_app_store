#Classrooms

----------
Get a specific classroom info


**URL:** http://gotoclassroom.com/api/v1/classrooms/{{id}}.json

**Method:**  GET

**Parameter**

----------
 `id`: Id of classroom.


**Response**

---------

    "classroom": {
    "id": 110,
    "user_id": 63,
    "name": "lop 110",
    "image": {
      "medium": "http://s3.amazonaws.com/gotoclassroom_staging_imgs/avatar_classes/110/smoke_medium.jpg?1413858638",
      "thumb": "http://s3.amazonaws.com/gotoclassroom_staging_imgs/avatar_classes/110/smoke_thumb.jpg?1413858638"
    },
    "description": "gdfgdf gdfg dfgfdg ",
    "student_code": "P2hPbAE",
    "parent_code": "PE7R-2M",
    "is_active": true,
    "static": {
      "students": 3,
      "parents": 2
    },
    "domain": null,
    "sub_domain": "danny-tran-bfc7a59a-50e0-493e-9fd0-6b6522561077",
    "user": {
      "id": 63,
      "name": "Danny Tran",
      "email": "tc@tc.com",
      "avatar": {
        "medium": "http://s3.amazonaws.com/gotoclassroom_staging_imgs/avatars/63/1214768089222_medium.jpg?1415241733",
        "thumb": "http://s3.amazonaws.com/gotoclassroom_staging_imgs/avatars/63/1214768089222_thumb.jpg?1415241733"
      },
      "role": "teacher",
      "created_at": "2014-08-06T17:02:06.000+07:00"
    }





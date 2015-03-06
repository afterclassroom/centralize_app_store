#users/my_yearbooks

----------
To return all yearbooks those belong to either teacher or student.

**URL:** http://gotoclassroom.com/api/v1/users/my_yearbooks

**Method:**  GET


**Response**

---------

    "classrooms": [
      {
        "id": 560,
        "user_id": 63,
        "name": "04-12-2014 11-30-35 AM.png",
        "image": {
          "medium": "http://s3.amazonaws.com/gotoclassroom_staging_imgs/avatar_classes/560/0911w-healthy-foods-l.png_medium.jpg?1417667608",
          "thumb": "http://s3.amazonaws.com/gotoclassroom_staging_imgs/avatar_classes/560/0911w-healthy-foods-l.png_thumb.jpg?1417667608"
        },
        "description": "04-12-2014 11-30-35 AM.png",
        "student_code": "ysrVW4A",
        "parent_code": "oltKZKA",
        "is_active": true,
        "static": {
          "students": 0,
          "parents": 0
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
      },
      {
        "id": 461,
        "user_id": 63,
        "name": "Math Class",
        "image": {
          "medium": "http://s3.amazonaws.com/gotoclassroom_staging_imgs/avatar_classes/461/1_200906270537473ilO8_medium.jpg?1416217312",
          "thumb": "http://s3.amazonaws.com/gotoclassroom_staging_imgs/avatar_classes/461/1_200906270537473ilO8_thumb.jpg?1416217312"
        },
        "description": "dfhgdfg",
        "student_code": "XZevc_4",
        "parent_code": "0AC7KYc",
        "is_active": true,
        "static": {
          "students": 0,
          "parents": 0
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
      }
    ]

#users/me.json

----------
To return detail information from particular user.

**URL:** http://gotoclassroom.com/api/users/me

**Method:**  GET


**Response**

---------

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
    },
    "profile": {
      "first_name": "Danny",
      "last_name": "Tran",
      "email": "tc@tc.com",
      "phone": "123456789",
      "address": "address",
      "bio": "bio",
      "facebook": "facebook",
      "twitter": "twitter",
      "google_plus": "google_plus",
      "pinteres": "pinteres",
      "linkedin": "linkedin",
      "sub_domain": "danny-tran-bfc7a59a-50e0-493e-9fd0-6b6522561077",
      "domain": null,
      "time_zone": "7",
      "language": "EN"
    },
    "settings_email_notifications": {
      "new_member_connected": true,
      "member_leave_your_class": true,
      "new_message": true,
      "comment_on_my_post": true,
      "post_i_commented": true,
      "student_submit_drop_off": true,
      "student_submit_quiz": true,
      "new_post": true,
      "new_parent_connect": true
    }
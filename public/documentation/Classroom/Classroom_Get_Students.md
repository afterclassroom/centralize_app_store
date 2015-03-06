#classrooms/{id}/students

----------
Return all the students who belong to a specific classroom.

**URL:** http://gotoclassroom.com/api/v1/classrooms/{id}/students.json

**Method:**  GET

**Parameter**

----------
 `id`: Id of classroom.
`page`: (optional) the current page. It's helpful for paging.
`per_page`: (optional) the number of records in a page



**Response**

---------

    "pagination_info": {
      "per_page": 10,
      "current_page": 1,
      "total_page": 1
    },
    "students": [
      {
        "locked": false,
        "user": {
          "id": 64,
          "name": "student student1",
          "email": "st@st.com",
          "avatar": {
            "medium": "http://gotoclassroom.com/assets/bg/user.png",
            "thumb": "http://gotoclassroom.com/assets/bg/user.png"
          },
          "role": "student",
          "created_at": "2014-08-06T17:06:58.000+07:00"
        }
      },
      {
        "locked": false,
        "user": {
          "id": 91,
          "name": "student Hanh",
          "email": "dumplings.f25@gmail.com",
          "avatar": {
            "medium": "http://gotoclassroom.com/assets/bg/user.png",
            "thumb": "http://gotoclassroom.com/assets/bg/user.png"
          },
          "role": "student",
          "created_at": "2014-10-20T17:04:59.000+07:00"
        }
      },
      {
        "locked": false,
        "user": {
          "id": 30,
          "name": "Danny Tran",
          "email": "st2@st.com",
          "avatar": {
            "medium": "http://gotoclassroom.com/assets/bg/user.png",
            "thumb": "http://gotoclassroom.com/assets/bg/user.png"
          },
          "role": "student",
          "created_at": "2014-07-03T15:41:03.000+07:00"
        }
      },
      {
        "locked": true,
        "user": {
          "id": 29,
          "name": "Student Dumplings24",
          "email": "dumplings.f24@gmail.com",
          "avatar": {
            "medium": "http://s3.amazonaws.com/gotoclassroom_staging_imgs/avatars/29/spa-treatments_422_82328_medium.jpg?1417487620",
            "thumb": "http://s3.amazonaws.com/gotoclassroom_staging_imgs/avatars/29/spa-treatments_422_82328_thumb.jpg?1417487620"
          },
          "role": "student",
          "created_at": "2014-07-03T12:00:19.000+07:00"
        }
      }
    ]
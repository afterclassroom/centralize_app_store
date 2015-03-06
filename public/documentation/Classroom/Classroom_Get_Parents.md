#classrooms/{id}/parents

----------
Return all the parents who have connected to a specific classroom.

**URL:** http://gotoclassroom.com/api/v1/classrooms/{id}/parents.json

**Method:**  GET

**Parameter**

----------
 `id`: Id of classroom.
`page`: (optional) the current page. It's helpful for paging.
`per_page`: (optional) the number of records in a page



**Response**

---------

    "pagination_info": {
      "per_page": 2,
      "current_page": 1,
      "total_page": 1
    },
    "parents": [
      {
        "locked": false,
        "user": {
          "id": 32,
          "name": "I'm parent Tran",
          "email": "dumplings28@yahoo.com",
          "avatar": {
            "medium": "http://gotoclassroom.com/assets/bg/user.png",
            "thumb": "http://gotoclassroom.com/assets/bg/user.png"
          },
          "role": "parent",
          "created_at": "2014-07-04T10:43:04.000+07:00"
        }
      },
      {
        "locked": false,
        "user": {
          "id": 19,
          "name": "pr1@pr.com",
          "email": "pr1@pr.com",
          "avatar": {
            "medium": "http://gotoclassroom.com/assets/bg/user.png",
            "thumb": "http://gotoclassroom.com/assets/bg/user.png"
          },
          "role": "parent",
          "created_at": "2014-06-28T11:22:44.000+07:00"
        }
      }
    ]
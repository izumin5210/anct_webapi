## GET /api/v1/lectures/:id
Returns lecture json.

### Example

#### Request
```
GET /api/v1/lectures/1 HTTP/1.1
Accept: text/xml,application/xml,application/xhtml+xml,text/html;q=0.9,text/plain;q=0.8,image/png,*/*;q=0.5
Content-Length: 0
Content-Type: application/x-www-form-urlencoded
Host: www.example.com
```

#### Response
```
HTTP/1.1 200
Cache-Control: max-age=0, private, must-revalidate
Content-Length: 1692
Content-Type: application/json; charset=utf-8
ETag: "9e372e82865d1eb688cafea967bca3fd"
Set-Cookie: request_method=GET; path=/
X-Content-Type-Options: nosniff
X-Frame-Options: SAMEORIGIN
X-Request-Id: d1ee0ed8-7c7d-4040-8798-89876f8535e0
X-Runtime: 0.050843
X-UA-Compatible: chrome=1
X-XSS-Protection: 1; mode=block

{
  "lecture": {
    "id": 1,
    "title": "est",
    "required_selective": "必修",
    "divide": "一般",
    "term": "前期",
    "credit": 1,
    "category": "recusandae",
    "abstract": "Delectus enim pariatur ea illum officiis. Placeat molestiae impedit in quidem. Ut eum delectus a quia cumque sapiente quis.",
    "failure_absence": "Atque id inventore. Consequuntur aut eveniet dolores. Laudantium voluptas eos dolor nemo veniam. Rerum eius placeat eveniet. Recusandae facilis qui repellat aut.",
    "evaluation": "Repellat est illum vel nihil reprehenderit. Quisquam et et explicabo est. Sed repellendus voluptatem. Aut deserunt quia reiciendis consequuntur.",
    "textbooks": "Omnis vel quod magni eaque qui molestias. Nostrum architecto vero ipsam et consectetur. Quod ut corrupti. Eveniet cupiditate reprehenderit illo maiores. Vitae ad qui.",
    "grade": 8,
    "department": {
      "id": 1,
      "name": "saepe",
      "abbr": "tempore"
    },
    "course": {
      "id": 1,
      "name": "aut",
      "abbr": "quia"
    },
    "timetables": [
      {
        "id": 1,
        "year": 2014,
        "term": "前期",
        "wday": 3,
        "period": 9,
        "location": {
          "id": 1,
          "name": "District Branding Consultant"
        }
      },
      {
        "id": 2,
        "year": 2014,
        "term": "前期",
        "wday": 3,
        "period": 6,
        "location": {
          "id": 2,
          "name": "Lead Response Liason"
        }
      }
    ],
    "lecturers": [
      {
        "id": 1,
        "name": "Izaiah Green I"
      },
      {
        "id": 2,
        "name": "Grace McLaughlin"
      }
    ],
    "contacts": [
      {
        "id": 1,
        "email": "nadia_padberg@johnson.info"
      },
      {
        "id": 2,
        "email": "hobart_towne@hermann.name"
      }
    ],
    "plans": [
      {
        "id": 1,
        "number": 4,
        "title": "Eveniet et architecto laboriosam rerum minus saepe natus.",
        "detail": "Dicta et beatae sapiente vel et rerum. Ipsa nostrum quae suscipit. Qui reiciendis aliquid aperiam ex nihil."
      },
      {
        "id": 2,
        "number": 3,
        "title": "Quo est excepturi quam.",
        "detail": "Suscipit earum aliquid. Perferendis ut ut. Veniam labore omnis dolorem nulla beatae."
      }
    ]
  }
}
```

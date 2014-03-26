## GET #show
Returns lecture json.

### Example

#### Request
```
GET /api/v1/lectures/1 HTTP/1.1
Accept: application/json
Content-Length: 0
Host: test.host
User-Agent: Rails Testing
```

#### Response
```
HTTP/1.1 200
Content-Type: application/json; charset=utf-8
Set-Cookie: request_method=GET; path=/
X-Content-Type-Options: nosniff
X-Frame-Options: SAMEORIGIN
X-UA-Compatible: chrome=1
X-XSS-Protection: 1; mode=block

{
  "lecture": {
    "id": 1,
    "title": "tenetur",
    "required_selective": "必修",
    "divide": "一般",
    "term": "前期",
    "credit": 1,
    "category": "et",
    "abstract": "Enim voluptates ut labore hic. Ratione sunt architecto velit dolores assumenda. Doloremque omnis est consequuntur voluptatem nobis.",
    "failure_absence": "Nihil voluptatem magni odit. Officiis labore minus. Omnis laboriosam molestiae corporis veritatis. Harum alias libero necessitatibus unde occaecati incidunt. Voluptates quos nihil sit ea in iure molestias.",
    "evaluation": "Ipsum unde tempora quae in est voluptatem. Est voluptates commodi magnam ea eius et. Aut voluptatem ipsum nostrum ipsam minus et quos. Incidunt perferendis dolores et quae eveniet reprehenderit nulla.",
    "textbooks": "Ipsam quam libero. Corporis doloremque fuga assumenda. Hic nesciunt praesentium assumenda. Natus ducimus aut perspiciatis.",
    "grade": 3,
    "department": {
      "id": 1,
      "name": "nobis",
      "abbr": "cum"
    },
    "course": {
      "id": 1,
      "name": "voluptas",
      "abbr": "dolor"
    },
    "timetables": [
      {
        "id": 1,
        "year": 2014,
        "term": "前期",
        "wday": 4,
        "period": 3,
        "location": {
          "id": 1,
          "name": "National Markets Producer"
        }
      },
      {
        "id": 2,
        "year": 2014,
        "term": "前期",
        "wday": 4,
        "period": 6,
        "location": {
          "id": 2,
          "name": "Dynamic Communications Designer"
        }
      }
    ],
    "lecturers": [
      {
        "id": 1,
        "name": "Cletus Schmeler"
      },
      {
        "id": 2,
        "name": "Dr. Evans Parisian"
      }
    ],
    "contacts": [
      {
        "id": 1,
        "email": "ahmed@koch.net"
      },
      {
        "id": 2,
        "email": "cordelia@wiza.name"
      }
    ],
    "plans": [
      {
        "id": 1,
        "number": 7,
        "title": "Eos aut ipsam nobis et vero incidunt quia.",
        "detail": "Odio velit neque voluptatem quasi. Dolores ratione deleniti distinctio. Occaecati adipisci accusantium ea unde a qui. Autem voluptatum sit soluta."
      },
      {
        "id": 2,
        "number": 6,
        "title": "Laudantium itaque ut rerum et quidem magni laborum sunt.",
        "detail": "Aut animi adipisci unde similique magnam sed alias. Quasi iusto molestias pariatur. Deleniti quidem illo ut provident voluptatum dolores commodi. Deserunt fugit suscipit sint eos in voluptas."
      }
    ]
  }
}
```

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
Content-Length: 1755
Content-Type: application/json; charset=utf-8
ETag: "8bf04880cc155b4f9ccb64665468afb7"
Set-Cookie: request_method=GET; path=/
X-Content-Type-Options: nosniff
X-Frame-Options: SAMEORIGIN
X-Request-Id: 35939a38-ae76-405c-87fb-a2b39a4cf1df
X-Runtime: 0.027699
X-UA-Compatible: chrome=1
X-XSS-Protection: 1; mode=block

{
  "lecture": {
    "id": 1,
    "title": "ipsam",
    "required_selective": "必修",
    "divide": "一般",
    "term": "前期",
    "credit": 1,
    "category": "eos",
    "abstract": "Voluptatem non voluptatem. Quo qui excepturi. Voluptates in expedita a quia. Est deleniti quo et sequi. Et voluptas architecto.",
    "failure_absence": "A at sequi non. Aut rerum eum. Maxime optio est.",
    "evaluation": "Ut autem velit. Dolorem voluptatem voluptatum consequuntur ut. Quo enim sed occaecati ut asperiores. Incidunt iste omnis.",
    "textbooks": "Ea voluptatem consequuntur quam ut pariatur vitae. Sed deleniti placeat voluptatibus totam aut dolore. Ad aliquid quae soluta. Nihil sint hic autem ea molestiae expedita assumenda. Dolorem delectus libero.",
    "grade": 8,
    "department": {
      "id": 1,
      "name": "ex",
      "abbr": "qui"
    },
    "course": {
      "id": 1,
      "name": "ea",
      "abbr": "praesentium"
    },
    "timetables": [
      {
        "id": 1,
        "year": 2014,
        "term": "前期",
        "wday": 5,
        "period": 6,
        "location": {
          "id": 1,
          "name": "Product Quality Assistant"
        }
      },
      {
        "id": 2,
        "year": 2014,
        "term": "前期",
        "wday": 5,
        "period": 4,
        "location": {
          "id": 2,
          "name": "Direct Creative Facilitator"
        }
      }
    ],
    "lecturers": [
      {
        "id": 1,
        "name": "Gregory Simonis Sr."
      },
      {
        "id": 2,
        "name": "Joelle Ward"
      }
    ],
    "contacts": [
      {
        "id": 1,
        "email": "edward@schamberger.org"
      },
      {
        "id": 2,
        "email": "tiana_koch@jerdebauch.com"
      }
    ],
    "plans": [
      {
        "id": 1,
        "number": 6,
        "title": "Praesentium eos amet dolores debitis ducimus dolorem aut.",
        "detail": "In reprehenderit in cupiditate saepe nam. Cum voluptas amet voluptate. Quos ut autem perspiciatis nulla laudantium maiores."
      },
      {
        "id": 2,
        "number": 8,
        "title": "Ut dignissimos suscipit earum eum labore eos.",
        "detail": "Eum voluptates culpa sunt nisi. Rem temporibus reprehenderit sed culpa. Non id enim modi possimus ad minima in. Ut vero vitae soluta libero qui voluptate. Eos quam ut ullam praesentium nostrum incidunt nihil."
      }
    ]
  }
}
```

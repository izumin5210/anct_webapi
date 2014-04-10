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
Content-Length: 1819
Content-Type: application/json; charset=utf-8
ETag: "6d62d2a5b4ef9bd8d98ed4fd7ec7dfe0"
Set-Cookie: request_method=GET; path=/
X-Content-Type-Options: nosniff
X-Frame-Options: SAMEORIGIN
X-Request-Id: 431bb67f-f075-4854-a58b-437d40e57a56
X-Runtime: 0.030702
X-UA-Compatible: chrome=1
X-XSS-Protection: 1; mode=block

{
  "lecture": {
    "id": 1,
    "title": "error",
    "requiredSelective": "必修",
    "divide": "一般",
    "term": "前期",
    "credit": 1,
    "category": "cupiditate",
    "abstract": "Tenetur iusto consequuntur quia esse vitae architecto. Blanditiis omnis voluptatibus. Praesentium accusantium quia magnam fugiat debitis.",
    "failureAbsence": "Eos ut soluta hic. Sapiente suscipit rerum aut. Voluptatum ut aliquam nihil dolores omnis et. Eaque sed quas optio dolorem quis qui quia.",
    "evaluation": "Tempora libero voluptate. Quasi vitae voluptas rerum. Ea eos et dolorem et. Dolor est illum voluptas. Porro sed molestias voluptate assumenda.",
    "textbooks": "Aliquid eum debitis cumque beatae delectus repellendus eaque. Ea dolorum voluptatem ipsum. Quam voluptatem animi aut perspiciatis quibusdam. Numquam autem sint.",
    "grade": 4,
    "year": 2014,
    "department": {
      "id": 1,
      "name": "excepturi",
      "abbr": "voluptatem"
    },
    "course": {
      "id": 1,
      "name": "dolor",
      "abbr": "optio"
    },
    "timetables": [
      {
        "id": 1,
        "year": 2014,
        "term": "前期",
        "wday": 4,
        "period": 9,
        "location": {
          "id": 1,
          "name": "Future Creative Developer"
        }
      },
      {
        "id": 2,
        "year": 2014,
        "term": "前期",
        "wday": 4,
        "period": 1,
        "location": {
          "id": 2,
          "name": "Internal Division Director"
        }
      }
    ],
    "lecturers": [
      {
        "id": 1,
        "name": "Gerson Cole III"
      },
      {
        "id": 2,
        "name": "Tristian Gutkowski"
      }
    ],
    "contacts": [
      {
        "id": 1,
        "email": "emelia_okon@blickjaskolski.com"
      },
      {
        "id": 2,
        "email": "verdie@tillman.com"
      }
    ],
    "plans": [
      {
        "id": 1,
        "number": 8,
        "title": "Deserunt aut unde sit numquam aut temporibus.",
        "detail": "Voluptas illo suscipit optio laboriosam minus est. Odit tempora qui eos. Non dolores nulla dolore accusantium nihil dolores delectus. Rerum nemo vel cum. Amet eum quidem perferendis est rerum."
      },
      {
        "id": 2,
        "number": 3,
        "title": "Atque ab debitis minus nesciunt aut et numquam.",
        "detail": "Ut pariatur est qui. Esse voluptatem ipsa. Hic mollitia sit quo tenetur illo."
      }
    ]
  }
}
```

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
Content-Length: 1847
Content-Type: application/json; charset=utf-8
ETag: "710739a1acc7e46d9e3ea36d72e4dc25"
Set-Cookie: request_method=GET; path=/
X-Content-Type-Options: nosniff
X-Frame-Options: SAMEORIGIN
X-Request-Id: 1d6110aa-c026-495b-a479-df5ce24f0993
X-Runtime: 0.052506
X-UA-Compatible: chrome=1
X-XSS-Protection: 1; mode=block

{
  "lecture": {
    "id": 1,
    "title": "sunt",
    "required_selective": "必修",
    "divide": "一般",
    "term": "前期",
    "credit": 1,
    "category": "et",
    "abstract": "Similique blanditiis eaque tempora quidem accusamus. Odio occaecati dignissimos provident reprehenderit quia voluptas. Architecto aut exercitationem qui error a similique. Voluptas natus molestiae id non possimus exercitationem.",
    "failure_absence": "Et architecto dolores officiis aut quibusdam quaerat. Eum laborum voluptatem illum. Nihil dolorem cum modi error perspiciatis dolor est.",
    "evaluation": "Hic consequuntur sit quidem necessitatibus voluptatem non quisquam. Porro commodi voluptatem aut rerum molestiae. Labore culpa autem qui.",
    "textbooks": "Saepe quia sit eos est quidem maiores facere. A accusamus nesciunt unde ducimus dolor. Quisquam reiciendis corporis velit dicta voluptatem qui.",
    "grade": 8,
    "department": {
      "id": 1,
      "name": "nisi",
      "abbr": "aliquid"
    },
    "course": {
      "id": 1,
      "name": "ut",
      "abbr": "consequatur"
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
          "name": "Product Directives Analyst"
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
          "name": "Legacy Web Strategist"
        }
      }
    ],
    "lecturers": [
      {
        "id": 1,
        "name": "Miss Meggie Grant"
      },
      {
        "id": 2,
        "name": "Iva Armstrong"
      }
    ],
    "contacts": [
      {
        "id": 1,
        "email": "stevie@kub.biz"
      },
      {
        "id": 2,
        "email": "levi_rice@goyettedamore.org"
      }
    ],
    "plans": [
      {
        "id": 1,
        "number": 2,
        "title": "Aliquid est iure natus ducimus quod consequatur consequatur atque.",
        "detail": "Et quaerat sunt sed. Aut voluptatem quia excepturi. Totam inventore neque natus distinctio qui. Facilis nemo velit rerum asperiores eligendi qui. Esse distinctio delectus tenetur."
      },
      {
        "id": 2,
        "number": 7,
        "title": "Dolorum quia sed deleniti.",
        "detail": "Quas repellendus explicabo cum eveniet iste qui. Ut qui consequuntur. Aut et est illo dolorem optio minima doloremque."
      }
    ]
  }
}
```

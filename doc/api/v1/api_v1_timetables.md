## GET /api/v1/timetables/:id
Returns timetable json.

### Example

#### Request
```
GET /api/v1/timetables/1 HTTP/1.1
Accept: text/xml,application/xml,application/xhtml+xml,text/html;q=0.9,text/plain;q=0.8,image/png,*/*;q=0.5
Content-Length: 0
Content-Type: application/x-www-form-urlencoded
Host: www.example.com
```

#### Response
```
HTTP/1.1 200
Cache-Control: max-age=0, private, must-revalidate
Content-Length: 143
Content-Type: application/json; charset=utf-8
ETag: "ffa7fee82ffd07c2738daf2480ae0106"
Set-Cookie: request_method=GET; path=/
X-Content-Type-Options: nosniff
X-Frame-Options: SAMEORIGIN
X-Request-Id: 962ca3c9-7395-4c67-b922-5270aaaeba82
X-Runtime: 0.011706
X-UA-Compatible: chrome=1
X-XSS-Protection: 1; mode=block

{
  "timetable": {
    "id": 1,
    "lectureId": 1,
    "year": 2014,
    "term": "前期",
    "wday": 3,
    "period": 9,
    "location": {
      "id": 1,
      "name": "International Web Coordinator"
    }
  }
}
```

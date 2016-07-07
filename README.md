# Cue Coding challenge has been accepted

### Prerequisites
> - Ruby 2.3 +
> - Rails 4.1.5

#### **Execute following commands to start server:**

```sh
$ bundle install
$ rails s
```

#### **Execute following commands to run rspe suite:**
```sh
$ rake spec
```

# API documentation
**Get Restaurants List**
```sh
URL: GET [http://] /restaurants.json 
```
**Response:**
```sh
[
  {
    "name": "Madras Cafe",
    "review_count": 405,
    "avg_rating": 4,
    "address": {
      "latitude": 37.37375,
      "longitude": -122.0556339,
      "city": "Sunnyvale",
      "state": "CA",
      "zipcode": "94087"
    }
  },
  {
    "name": "Turmeric Restaurant",
    "review_count": 422,
    "avg_rating": 3.5,
    "address": {
      "latitude": 37.3769252,
      "longitude": -122.030283,
      "city": "Sunnyvale",
      "state": "CA",
      "zipcode": "94086"
    }
  },
  ...
  {
    "name": "Tasty Subs & Pizza",
    "review_count": 221,
    "avg_rating": 4,
    "address": {
      "latitude": 37.382874,
      "longitude": -121.995084,
      "city": "Sunnyvale",
      "state": "CA",
      "zipcode": "94085"
    }
  }
]  
```
<center> <h2>Koroibos</h2> </center>

### Introduction
This is an api that was made in under 48 hours as a challenge. It takes [olympic data](https://github.com/turingschool/backend-curriculum-site/blob/gh-pages/module4/projects/take_home_challenge/prompts/olympic_data_2016.csv) from the 2016 summer games as a csv file and serves endpoints for seeing all events, olympians, and medalists. I focused on reducing loading times by both eager loading, and utilizing a rake task to create easily loadable associations.

### Tech Stack
- [Ruby on Rails](https://guides.rubyonrails.org/)
- [Postgresql](https://www.postgresql.org/docs/)
- [Active Model Serializers](https://github.com/rails-api/active_model_serializers)
- [Factory Bot](https://github.com/thoughtbot/factory_bot)

### Production
https://sheltered-mesa-39586.herokuapp.com
### Setup
1. Clone repo
```
cd koroibos
bundle install
rails db:{create,migrate,seed}
bundle exec rake import:csv
rails server
```
2. Navigate to http://localhost:3000
## Endpoints

### GET /api/v1/olympians
*Returns all olympians*

**Headers:**
```
Content-Type: application/json
Accept: application/json
```

**Optional Params:**
- `age=youngest`
- `age=oldest`

**Response:**
```json
{
  "olympians":
    [
      {
        "name": "Maha Abdalsalam",
        "team": "Egypt",
        "age": 18,
        "sport": "Diving",
        "total_medals_won": 0
      },
      {
        "name": "Ahmad Abughaush",
        "team": "Jordan",
        "age": 20,
        "sport": "Taekwondo",
        "total_medals_won": 1
      },
      {...}
    ]
}
```

### GET /api/v1/olympian_stats
*Returns statistics for all olympians*

**Headers:**
```
Content-Type: application/json
Accept: application/json
```

**Response:**
```json
{
  "olympian_stats": {
    "total_competing_olympians": 3120,
    "average_weight": {
      "unit": "kg",
      "male_olympians": 75.4,
      "female_olympians": 70.2
    },
    "average_age": 26.2
  }
}
```

### GET /api/v1/events
*Returns a list of events for each sport*

**Headers:**
```
Content-Type: application/json
Accept: application/json
```

**Response:**
```json
{
  "events":
    [
      {
        "sport": "Archery",
        "events": [
          "Archery Men's Individual",
          "Archery Men's Team",
          "Archery Women's Individual",
          "Archery Women's Team"
        ]
      },
      {
        "sport": "Badminton",
        "events": [
          "Badminton Men's Doubles",
          "Badminton Men's Singles",
          "Badminton Women's Doubles",
          "Badminton Women's Singles",
          "Badminton Mixed Doubles"
        ]
      },
      {...}
    ]
}
```

### GET /api/v1/events/:event_id/medalists
*Returns a list of medalists for an event*

**Headers:**
```
Content-Type: application/json
Accept: application/json
```

**Response:**
```json
{
  "event": "Badminton Mixed Doubles",
  "medalists": [
      {
        "name": "Tontowi Ahmad",
        "team": "Indonesia-1",
        "age": 29,
        "medal": "Gold"
      },
      {
        "name": "Chan Peng Soon",
        "team": "Malaysia",
        "age": 28,
        "medal": "Silver"
      }
    ]
}
```
### Issues
The sample data used is incomplete and does not include all medals for events
### Testing
- RSpec
- Shoulda-Matchers

**Models:**
```
bundle exec rspec spec/models
```
**Requests:**
```
bundle exec rspec spec/requests
```
### How to Contribute
1. Fork
2. Make Changes
3. Make Descriptive Pull Request
### Core Contributors
- [Vince Carollo](https://github.com/vincecarollo)
### Schema
![Schema](/app/assets/images/schema_img.png)

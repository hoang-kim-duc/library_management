module Api::RatingsControllerDocument
  extend Apipie::DSL::Concern

  api :POST, "/ratings", "create rating"
  param "Authorization", String, desc: "In header. Authorization token", required: true
  param "rating", Hash, desc: "User login information", require: true do
    param "book_id", Integer, desc: "Book", require: true
    param "score", Integer, desc: "Score", require: true
  end
  example <<-EXAM
  {
    "id": 4,
    "score": 3,
    "user_id": 1,
    "book_id": 1
  }
  EXAM
  def create; end

  api :GET, "/ratings", "list rating"
  param "Authorization", String, desc: "In header. Authorization token", required: true
  param "q", Hash, desc: "User login information", require: true do
    param "book_id_eq", Integer, desc: "Search with book id"
    param "user_id_eq", Integer, desc: "Search with user id"
  end
  example <<-EXAM
  [
    {
        "id": 1,
        "score": 4,
        "user_id": 2,
        "book_id": 1
    },
    {
        "id": 2,
        "score": 4,
        "user_id": 2,
        "book_id": 1
    },
    {
        "id": 3,
        "score": 3,
        "user_id": 2,
        "book_id": 1
    }
  ]
  EXAM
  def index; end

end

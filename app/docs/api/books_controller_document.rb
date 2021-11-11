module Api::BooksControllerDocument
  extend Apipie::DSL::Concern

  api :POST, "/books/", "Create book"
  param "Authorization", String, desc: "In header. Authorization token", required: true
  param "book", Hash, desc: "Book information", require: true do
    param "name", String, desc: "Book's name", require: true
    param "description", String, desc: "Book's description", require: true
    param "data", ActionDispatch::Http::UploadedFile, require: true
    param "category_id", Integer, require: true
  end
  example <<-EXAM
  {
    "id": 1,
    "name": "Sach SWD",
    "cover_url": "http://localhost:3000/rails/active_storage/blobs/redirect/eyJfcmFpbHMiOnsibWVzc2FnZSI6IkJBaHBKQT09IiwiZXhwIjpudWxsLCJwdXIiOiJibG9iX2lkIn19--c183e113044cfe3585e2162bc4006066f50261b8/Screenshot%20from%202021-06-05%2014-23-38.png?disposition=attachment",
    "description": "Sach hay vai ",
    "category_id": 1,
    "data_url": "http://localhost:3000/rails/active_storage/blobs/redirect/eyJfcmFpbHMiOnsibWVzc2FnZSI6IkJBaHBKQT09IiwiZXhwIjpudWxsLCJwdXIiOiJibG9iX2lkIn19--c183e113044cfe3585e2162bc4006066f50261b8/Screenshot%20from%202021-06-05%2014-23-38.png?disposition=attachment",
    "user_id": 1,
    "avg_rating": 3.7
  }
  EXAM

  def create; end

  api :GET, "/books", "List books"
  param "Authorization", String, desc: "In header. Authorization token", required: true
  param "q", Hash, desc: "Query information", require: false do
    param "name_or_description_cont", String, desc: "Find books with name or description"
    param "user_id_eq", Integer, desc: "Find books uploaded by user"
    param "category_id_eq", Integer, desc: "Find books by category id"
  end
  example <<-EXAM
  http://localhost:3000/api/books/?q[name_or_description_cont]=kim duc
  [
    {
      "id": 37,
      "name": "Sach SWD",
      "cover_url": "http://localhost:3000/rails/active_storage/blobs/redirect/eyJfcmFpbHMiOnsibWVzc2FnZSI6IkJBaHBJZz09IiwiZXhwIjpudWxsLCJwdXIiOiJibG9iX2lkIn19--c2895a3f6329b89eb3c2dce8bcc24c6dd75093a1/Screenshot%20from%202021-06-05%2014-23-38.png?disposition=attachment",
      "description": "Hoang Kim Duc",
      "data_url": "http://localhost:3000/rails/active_storage/blobs/redirect/eyJfcmFpbHMiOnsibWVzc2FnZSI6IkJBaHBJUT09IiwiZXhwIjpudWxsLCJwdXIiOiJibG9iX2lkIn19--0a9d3d4c609463c7c9f254eeb6cbddb55774d21c/Screenshot%20from%202021-06-04%2022-01-24.png?disposition=attachment",
      "user_id": 1,
      "avg_rating": 3.7
    },
    {
      "id": 38,
      "name": "Hoang Kim Duc",
      "cover_url": "http://localhost:3000/rails/active_storage/blobs/redirect/eyJfcmFpbHMiOnsibWVzc2FnZSI6IkJBaHBKQT09IiwiZXhwIjpudWxsLCJwdXIiOiJibG9iX2lkIn19--c183e113044cfe3585e2162bc4006066f50261b8/Screenshot%20from%202021-06-05%2014-23-38.png?disposition=attachment",
      "description": "ffasdadsa",
      "data_url": "http://localhost:3000/rails/active_storage/blobs/redirect/eyJfcmFpbHMiOnsibWVzc2FnZSI6IkJBaHBJdz09IiwiZXhwIjpudWxsLCJwdXIiOiJibG9iX2lkIn19--28e46767efd8ee389149f02dbb09fed90b1f1ef8/Screenshot%20from%202021-06-04%2022-01-24.png?disposition=attachment",
      "user_id": 1,
      "avg_rating": 3.7
    }
  ]
  EXAM
  def index; end

  api :GET, "/books/:id", "Show book"
  param "Authorization", String, desc: "In header. Authorization token", required: true
  example <<-EXAM
  {
    "id": 38,
    "name": "Hoang Kim Duc",
    "cover_url": "http://localhost:3000/rails/active_storage/blobs/redirect/eyJfcmFpbHMiOnsibWVzc2FnZSI6IkJBaHBKQT09IiwiZXhwIjpudWxsLCJwdXIiOiJibG9iX2lkIn19--c183e113044cfe3585e2162bc4006066f50261b8/Screenshot%20from%202021-06-05%2014-23-38.png?disposition=attachment",
    "description": "ffasdadsa",
    "data_url": "http://localhost:3000/rails/active_storage/blobs/redirect/eyJfcmFpbHMiOnsibWVzc2FnZSI6IkJBaHBJdz09IiwiZXhwIjpudWxsLCJwdXIiOiJibG9iX2lkIn19--28e46767efd8ee389149f02dbb09fed90b1f1ef8/Screenshot%20from%202021-06-04%2022-01-24.png?disposition=attachment",
    "user_id": 1,
    "avg_rating": 3.7
  }
  EXAM
  def show; end

  api :DELETE, "/books/:id", "Delete book"
  param "Authorization", String, desc: "In header. Authorization token", required: true
  example <<-EXAM
  {
    "messages": "Delete successfully!",
    "is_success": true
  }
  EXAM
  def destroy; end


  api :PATCH, "/books/:id", "Update book"
  param "Authorization", String, desc: "In header. Authorization token", required: true
  param "book", Hash, desc: "Book information", require: true do
    param "name", String, desc: "Book's name"
    param "description", String, desc: "Book's description"
    param "data", ActionDispatch::Http::UploadedFile
    param "category_id", Integer
  end
  example <<-EXAM
  {
    "id": 38,
    "name": "Hoang Kim Duc",
    "cover_url": "http://localhost:3000/rails/active_storage/blobs/redirect/eyJfcmFpbHMiOnsibWVzc2FnZSI6IkJBaHBKQT09IiwiZXhwIjpudWxsLCJwdXIiOiJibG9iX2lkIn19--c183e113044cfe3585e2162bc4006066f50261b8/Screenshot%20from%202021-06-05%2014-23-38.png?disposition=attachment",
    "description": "ffasdadsa",
    "data_url": "http://localhost:3000/rails/active_storage/blobs/redirect/eyJfcmFpbHMiOnsibWVzc2FnZSI6IkJBaHBJdz09IiwiZXhwIjpudWxsLCJwdXIiOiJibG9iX2lkIn19--28e46767efd8ee389149f02dbb09fed90b1f1ef8/Screenshot%20from%202021-06-04%2022-01-24.png?disposition=attachment",
    "user_id": 1,
    "avg_rating": 3.7
  }
  EXAM

  def update; end
end

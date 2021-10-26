module Api::BooksControllerDocument
  extend Apipie::DSL::Concern

  api :POST, "/books/", "Create book"
  param "book", Hash, desc: "Book information", require: true do
    param "name", String, desc: "Book's name", require: true
    param "description", String, desc: "Book's description", require: true
    param "data", ActionDispatch::Http::UploadedFile, require: true
  end
  example <<-EXAM
  {
    "id": 27,
    "name": "Sach SWD",
    "description": "Sach hay vai ",
    "created_at": "2021-10-23T10:16:51.999Z",
    "updated_at": "2021-10-23T10:16:52.023Z",
    "data": "http://localhost:3000/rails/active_storage/blobs/redirect/eyJfcmFpbHMiOnsibWVzc2FnZSI6IkJBaHBFdz09IiwiZXhwIjpudWxsLCJwdXIiOiJibG9iX2lkIn19--94eff594156889e79d2fbc9731f69da89e94de82/Screenshot%20from%202021-06-04%2022-01-24.png?disposition=attachment"
  }
  EXAM

  def create; end

  api :GET, "/books", "List books"
  param "q", Hash, desc: "Query information", require: false do
    param "name_or_description_cont", String, desc: "Find books with name or description"
    param "user_id_eq", Integer, desc: "Find books uploaded by user"
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
      "user_id": 1
    },
    {
      "id": 38,
      "name": "Hoang Kim Duc",
      "cover_url": "http://localhost:3000/rails/active_storage/blobs/redirect/eyJfcmFpbHMiOnsibWVzc2FnZSI6IkJBaHBKQT09IiwiZXhwIjpudWxsLCJwdXIiOiJibG9iX2lkIn19--c183e113044cfe3585e2162bc4006066f50261b8/Screenshot%20from%202021-06-05%2014-23-38.png?disposition=attachment",
      "description": "ffasdadsa",
      "data_url": "http://localhost:3000/rails/active_storage/blobs/redirect/eyJfcmFpbHMiOnsibWVzc2FnZSI6IkJBaHBJdz09IiwiZXhwIjpudWxsLCJwdXIiOiJibG9iX2lkIn19--28e46767efd8ee389149f02dbb09fed90b1f1ef8/Screenshot%20from%202021-06-04%2022-01-24.png?disposition=attachment",
      "user_id": 1
    }
  ]
  EXAM
  def index; end

  api :GET, "/books/:id", "Show book"
  example <<-EXAM
  {
    "id": 4,
    "name": "Sach SWD",
    "description": "Sach hay vai ",
    "created_at": "2021-10-23T16:06:06.130Z",
    "updated_at": "2021-10-23T16:06:06.150Z",
    "data": "http://localhost:3000/rails/active_storage/blobs/redirect/eyJfcmFpbHMiOnsibWVzc2FnZSI6IkJBaHBDUT09IiwiZXhwIjpudWxsLCJwdXIiOiJibG9iX2lkIn19--9f914d96342c3e73153b4be1f1235e81918130f4/SWD391_ACT01_DucHK_SE1404.pdf?disposition=attachment"
  }
  EXAM
  def show; end

  api :DELETE, "/books/:id", "Delete book"
  example <<-EXAM
  {
    "messages": "Delete successfully!",
    "is_success": true
  }
  EXAM
  def destroy; end


  api :PATCH, "/books/:id", "Update book"
  param "book", Hash, desc: "Book information", require: true do
    param "name", String, desc: "Book's name", require: true
    param "description", String, desc: "Book's description", require: true
    param "data", ActionDispatch::Http::UploadedFile, require: true
  end
  example <<-EXAM
  {
    "name": "Sach SWD2",
    "description": "Sach hay lam",
    "id": 11,
    "created_at": "2021-10-23T16:20:39.995Z",
    "updated_at": "2021-10-23T16:21:43.393Z",
    "data": "http://localhost:3000/rails/active_storage/blobs/redirect/eyJfcmFpbHMiOnsibWVzc2FnZSI6IkJBaHBFUT09IiwiZXhwIjpudWxsLCJwdXIiOiJibG9iX2lkIn19--bf3695363d429aba945c7c4c4c975b9bc07db2b1/9NtGpP.jpg?disposition=attachment"
  }
  EXAM

  def update; end
end

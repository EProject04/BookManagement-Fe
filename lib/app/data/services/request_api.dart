class RequestApi {
  static const String BaseUrl = "https://aptechlearningproject.site";

  static const String API_AUTHORS_GET ="/api/authors/get-all-author";
  static const String API_AUTHORS_GET_ID ="/api/Authors?id=";
  static const String API_AUTHORS_PUT ="/api/Authors?id=";
  static const String API_AUTHORS_DELTETE ="/api/Authors?id=";
  static const String API_AUTHORS_SEARCH ="/api/Authors/search";

  static const String API_BOOK_GET ="/api/books/get-all-book";
  static const String API_BOOK_GET_ID ="/api/books/get-book-by-id/{id}";
  static const String API_BOOK_PUT_ID ="/api/Books?id=";
  static const String API_BOOK_DELTETE_ID ="/api/Books?id=";
  static const String API_BOOK_SEARCH ="/api/books/search";

  static const String API_CATEGORIES_GET ="/api/Categories";
  static const String API_CATEGORIES_GET_ID ="/api/Categories?id=";
  static const String API_CATEGORIES_PUT ="/api/Categories?id=";
  static const String API_CATEGORIES_DELETE ="/api/Categories?id=";
  static const String API_CATEGORIES_SEARCH ="/api/Categories/search";
  static const String API_CATEGORIES_POST ="/api/Categories";

  static const String API_LOGIN ="/api/users/login";
  static const String API_REGISTER ="/api/users/register";
  static const String API_LOGOUT ="/api/users/logout";
  static const String API_USERS_GET ="/api/users/get-all-user";
  static const String API_USERS_GET_ID ="/api/users/get-user-by-id/";

  static const String API_USERPROFILE_GET ="/api/user-profiles/get-all-userprofile";
  static const String API_USERPROFILE_PUT ="/api/user-profiles/update-userprofile/";
  static const String API_USERPROFILE_DELETE ="/api/user-profiles/delete-userprofile/";
  static const String API_USERPROFILE_SEARCH ="/api/user-profiles/search";
  static const String API_USERPROFILE_GET_ID ="/api/user-profiles/get-userprofile-by-id/";

}
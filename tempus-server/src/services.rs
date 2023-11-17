use actix_web::{get, web::Json, Responder};
use serde::Serialize;

#[derive(Debug, Serialize)]
struct User {
    id: i32,
    name: String,
    email: String,
}

#[get("/users")]
async fn get_users() -> impl Responder {
    let users = vec![
        User {
            id: 1,
            name: "John".to_string(),
            email: "<EMAIL>".to_string(),
        },
        User {
            id: 2,
            name: "Jane".to_string(),
            email: "<EMAIL>".to_string(),
        },
    ];

    Json(users)
}

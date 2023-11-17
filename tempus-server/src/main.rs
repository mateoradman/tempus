use actix_web::{App, HttpServer};
use dotenv::dotenv;

mod services;

#[actix_web::main]
async fn main() -> std::io::Result<()> {
    dotenv().ok();

    HttpServer::new(move || App::new().service(services::get_users))
        .bind("127.0.0.1:8080")?
        .run()
        .await
}

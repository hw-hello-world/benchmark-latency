use actix_web::{get, web, App, HttpServer};
use serde::Deserialize;

#[derive(Deserialize)]
struct Info {
    first_name: String,
    last_name: String,
}

#[get("/")]
async fn index(info: web::Query<Info>) -> String {
    format!("[Rust Actix] Hello {} {}!", info.first_name, info.last_name)
    // HttpResponse::Ok().body("Hello world!")
}

#[actix_web::main]
async fn main() -> std::io::Result<()> {
    HttpServer::new(|| {
        App::new()
            .service(index)
            // .service(echo)
            // .route("/hey", web::get().to(manual_hello))
    })
    .bind("127.0.0.1:9001")?
    .run()
    .await
}

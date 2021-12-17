#[macro_use] extern crate rocket;

#[get("/?<first_name>&<last_name>")]
fn index(first_name: &str, last_name: &str) -> String {
    let result = format!("[Rust] Hello {} {}", first_name, last_name);
    result
}

#[launch]
fn rocket() -> _ {
    rocket::build().mount("/", routes![index])
}

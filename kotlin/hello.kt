fun main(args: Array<String>) {
    val server = embeddedServer(Netty, port = 9001) {
        routing {
            get("/") {
                val fname = call.request.queryParameters["first_name"]
                val lname = call.request.queryParameters["last_name"]
                call.respondText("hello $fname $lname", ContextType.Text.Plain)
            }
        }
    }
    server.start(wait = true)
}

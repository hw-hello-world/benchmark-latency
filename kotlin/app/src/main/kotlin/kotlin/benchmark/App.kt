/*
 * This Kotlin source file was generated by the Gradle 'init' task.
 */
package hw.kotlin.benchmark

import io.ktor.features.*
import io.ktor.application.*
import io.ktor.http.*
import io.ktor.response.*
import io.ktor.routing.*
import io.ktor.server.engine.*
import io.ktor.server.netty.*
import io.ktor.client.*
import java.net.URL


suspend fun getData(): String {
    return URL("http://example.com/").readText();
}

fun main() {

    val server = embeddedServer(Netty, port = 9001) {
        install(StatusPages) {
            exception<Throwable> {
                cause ->
                    call.respond(HttpStatusCode.InternalServerError, "Internal Server Error")
                cause.printStackTrace()
                throw cause
            }
        }

        routing {
            get("/") {
                val fname = call.request.queryParameters["first_name"]
                val lname = call.request.queryParameters["last_name"]
                val xs: Array<String> = arrayOf();
                val helloMsg: String = "[Kotlin] hello $fname $lname"
                val anotherMsg = getData() + xs[1]
                call.respondText(helloMsg + anotherMsg, ContentType.Text.Plain)
            }
        }
    }
    server.start(wait = true)
}


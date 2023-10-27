import Fluent
import Vapor

func routes(_ app: Application) throws {

    app.get("health") { req async -> String in
        "OK"
    }
    app.logger.info("Register todo routes collection...")
    try app.register(collection: TodoController())
}

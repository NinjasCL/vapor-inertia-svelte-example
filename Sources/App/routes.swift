import Vapor

func routes(_ app: Application) throws {
    let index = IndexController()
    try app.register(collection: index)

    let hello = HelloController()
    try app.grouped("hello").register(collection: hello)
}

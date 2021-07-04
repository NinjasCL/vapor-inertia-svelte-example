import Vapor

struct HelloController: RouteCollection {
    func boot(routes: RoutesBuilder) throws {
        routes.get(use: index)
    }

    func index(_ req: Request) -> EventLoopFuture<Response> {
        return req.inertia.render("Home/Hello", [
            "welcome": "to the future"
        ], for:req)
    }
}
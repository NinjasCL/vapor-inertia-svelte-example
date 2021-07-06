import Vapor

struct HelloController: RouteCollection {
    func boot(routes: RoutesBuilder) throws {
        routes.get(use: index)
    }

    func index(_ req: Request) -> EventLoopFuture<Response> {
        return req.inertiaRender("Home/Hello", [
            "welcome": "to the future"
        ])
    }
}
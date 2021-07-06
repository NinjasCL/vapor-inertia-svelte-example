import Vapor

struct IndexController: RouteCollection {
    func boot(routes: RoutesBuilder) throws {
        routes.get(use: index)
    }

    func index(_ req: Request) -> EventLoopFuture<Response> {
        return req.inertiaRender(
            "Home/Index",
            [
                "hello": "world"
            ]
        )
    }
}
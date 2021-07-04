import Vapor
import VaporInertiaAdapter
import Leaf

// configures your application
public func configure(_ app: Application) throws {
    // uncomment to serve files from /Public folder
    // app.middleware.use(FileMiddleware(publicDirectory: app.directory.publicDirectory))
    app.http.server.configuration.hostname = "0.0.0.0"
    app.http.server.configuration.port = 8080

    app.views.use(.leaf)

    let file = FileMiddleware(publicDirectory: app.directory.publicDirectory)

    app.middleware.use(file)
    
    // Defined in mix.swift
    app.registerLaravelMix()

    // Defined in Application+Inertia.swift
    app.registerInertia(version:LaravelMixAssets.version, shared:[
        // probably you would need a better routes to dict converter method
        // this is used to generate the links to the different routes in svelte
        "routes": [
            "home": [
                "uri": "/",
                "methods": ["GET"]
            ],
            "hello": [
                "uri": "/hello",
                "methods": ["GET"]
            ]
        ],
        "flash": [
            "success": [], // Get session flash data
            "error": []
        ]
    ])

    // register routes
    try routes(app)
}

import Vapor

extension Request {
    
    private struct InertiaStorageKey: StorageKey {
        typealias Value = Inertia
    }
    
    public var inertia: Inertia {
        if (self.storage[InertiaStorageKey.self] == nil) {
            self.storage[InertiaStorageKey.self] = Inertia.instance()
        }
        
        return self.storage[InertiaStorageKey.self]!
    }
    
    public func isInertia() -> Bool {
        return self.headers.contains(name: "X-Inertia")
    }
    
    public func inertiaVersion() -> String {
        return self.headers.first(name: "X-Inertia-Version") ?? ""
    }
    
    public func inertiaExpired(version: String) -> Bool {
        return self.method == .GET
            && self.isInertia()
            && self.inertiaVersion() != version
    }

    public func inertiaRender(_ name: String, _ properties: [String:Any]) -> EventLoopFuture<Response> {
        return self.inertia.render(name, properties, for:self)
    }
}

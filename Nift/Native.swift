import struct Foundation.UUID

open class Native: Node {
    public typealias Create = (Any, [Any]) -> NativeComponent
    public typealias Component = NativeComponent

    public struct NoProperties {
        public init() {}
    }

    public let create: Create

    public init(
        create: @escaping Native.Create,
        key: String? = nil,
        properties: Any = NoProperties(),
        type: UUID,
        _ children: [Node] = []
    ) {
        self.create = create

        super.init(children: children, key: key, properties: properties, type: type)
    }
}

public protocol NativeComponent {
    init(properties: Any, children: [Any])

    func equal(a: Any, b: Any) -> Bool // swiftlint:disable:this identifier_name

    func update(properties: Any, operations: [Operation])

    func remove(_ mount: Any)

    func render() -> Any
}

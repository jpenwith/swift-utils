//
//  Array
//  swift-utils
//
//  Created by me on 24/05/2025.
//

extension Array {
    public func removingFirst(_ k: Int) -> Self {
        var copy = self
        
        copy.removeFirst(k)
        
        return copy
    }

    public func removingFirst() -> Self {
        var copy = self
        
        copy.removeFirst()
        
        return copy
    }
    
    public func removingLast(_ k: Int) -> Self {
        var copy = self

        copy.removeLast(k)

        return copy
    }

    public func removingLast() -> Self {
        var copy = self

        copy.removeLast()

        return copy
    }

    public func removing(at index: Int) -> Self {
        var copy = self

        copy.remove(at: index)

        return copy
    }
}

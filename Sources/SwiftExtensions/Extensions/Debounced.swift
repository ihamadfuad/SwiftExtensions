import Foundation

public func debounced(delay: TimeInterval,
                      queue: DispatchQueue = .main,
                      action: @escaping (() -> Void)) -> () -> Void {

    var workItem: DispatchWorkItem?

    return {
        workItem?.cancel()
        workItem = DispatchWorkItem(block: action)
        queue.asyncAfter(deadline: .now() + delay, execute: workItem!)
    }
}

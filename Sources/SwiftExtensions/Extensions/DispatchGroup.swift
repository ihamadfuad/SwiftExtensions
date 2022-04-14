import Foundation

public func dispatcher(enter: (VoidBlock) -> Void, _ main: @escaping VoidBlock) {

    let dispatchGroup = DispatchGroup()

    dispatchGroup.enter()

    enter({

        dispatchGroup.leave()
    })

    dispatchGroup.notify(queue: .main) {
        main()
    }
}

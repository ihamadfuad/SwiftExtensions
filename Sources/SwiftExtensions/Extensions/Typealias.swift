import Foundation

public typealias VoidBlock = () -> Void
public typealias SuccessBlock = (_ success: Bool) -> Void
public typealias FailureBlock = (_ error: Error) -> Void
public typealias ResultBlock = (_ success: Bool, _ error: Error) -> Void

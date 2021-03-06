import Combine
import XCTest

@testable import JamulusProtocol

final class JamulusProtocolTests: XCTestCase {
    func testExample() throws {
        
      let test = JamulusProtocol(
        open: Just(ConnectionState.init(rawValue: .ready))
          .setFailureType(to: JamulusError.self)
          .eraseToAnyPublisher(),
        receiveDataPublisher: PassthroughSubject<JamulusPacket, Never>()
          .eraseToAnyPublisher(),
        send: { _ in },
        sendAudio: { _, _ in }
      )
      XCTAssertNotNil(test)
    }
}

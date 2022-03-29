
import Foundation

public enum ApiConsts {
  static let sampleRate48kHz: UInt32 = 48000
  static let frameSamples64: UInt32 = 64
  static let defaultPort: UInt16 = 22124
  static let packetHeaderSize = 9
  static let packetHeaderSizeWithoutChecksum = 7
  static let packetDataStartOffset = packetHeaderSizeWithoutChecksum
  static let messageIdNoAckStart = 1000   // Don't ack messages above this
  static let messageIdAckStart = 9
}

public enum OpusCompressedSize: UInt32 {
  case monoLowQuality = 12
  case monoNormal = 22
  case monoHighQuality = 36
  case monoLowQualityDouble = 25
  case monoNormalDouble = 45
  case monoHighQualityDouble = 82
  
  case stereoLowQuality = 24
  case stereoNormal = 35
  case stereoHighQuality = 73
  case stereoLowQualityDouble = 47
  case stereoNormalDouble = 71
  case stereoHighQualityDouble = 165
}

public struct ChannelPan: Equatable {
  static let left: UInt16 = 0
  static let center: UInt16 = 16384
  static let right: UInt16 = 32768
  
  var pan: UInt16 = ChannelPan.center
}

public enum AudioCodec: UInt16 {
  case raw = 0
  case celt = 1
  case opus = 2
  case opus64 = 3
}

public enum AudioFrameFactor: UInt16 {
  case single = 1
  case normal = 2
  case safe = 4
  
  var frameSize: UInt16 {
    // 64 samples per frame minimum
    return UInt16(ApiConsts.frameSamples64) * rawValue
  }
}

public enum OsType: UInt8, CustomStringConvertible {
  public var description: String {
    switch self {
    case .windows: return "Windows"
    case .macOS: return "macOS"
    case .linux: return "Linux"
    case .android: return "Android"
    case .iOS: return "iOS"
    case .unix: return "UNIX"
    }
  }
  
  case windows = 0
  case macOS = 1
  case linux = 2
  case android = 3
  case iOS = 4
  case unix = 5
}

public enum RecorderState: UInt8 {
    case unknown = 0
    case notInitialized = 1
    case disabled = 2
    case recording = 3
};
//
//  URLError.swift
//  MovieX
//
//  Created by Raden Dimas on 10/12/22.
//

import Foundation

public enum URLError: LocalizedError {
  case invalidResponse
  case addressUnreachable(URL)

  public var errorDescription: String? {
    switch self {
    case .invalidResponse: return "The server responded with garbage."
    case .addressUnreachable(let url): return "\(url.absoluteString) is unreachable."
    }
  }
}

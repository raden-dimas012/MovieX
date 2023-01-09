//
//  DatabaseError.swift
//  MovieX
//
//  Created by Raden Dimas on 10/12/22.
//

import Foundation

public enum DatabaseError: LocalizedError {
  case invalidInstance
  case requestFailed

  public var errorDescription: String? {
    switch self {
    case .invalidInstance: return "Database can't instance."
    case .requestFailed: return "Your request failed."
    }
  }
}

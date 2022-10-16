//
//  Converter.swift
//  CocoaAsyncSocket
//
//  Created by Michael Avoyan on 22/05/2022.
//
//  Copyright 2022 Velocity Career Labs inc.
//  SPDX-License-Identifier: Apache-2.0

import Foundation

import VCLAuth

public func dictionaryToAuthConfig(
    _ authConfigDictionary: [String: Any]
) -> VCLAuthConfig {
    return VCLAuthConfig(
        title: authConfigDictionary["title"] as? String ?? ""
      )
}

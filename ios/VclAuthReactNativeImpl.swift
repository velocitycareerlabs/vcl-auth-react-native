//
//  VclAuthReactNative.swift
//  VclAuthReactNative
//
//  Created by Michael Avoyan on 26/08/2025.
//

import Foundation
import VCLAuth

@objc public class VclAuthReactNativeImpl: NSObject {
  
  @objc public static let shared = VclAuthReactNativeImpl()
  
  private let vclAuth = VclAuthProvider.instance()
  
//  @objc(isAuthenticationAvailable:withRejecter:)
  @objc public func isAuthenticationAvailable(
    resolve: @escaping RCTPromiseResolveBlock, reject: @escaping RCTPromiseRejectBlock
  ) {
    vclAuth.isAuthenticationAvailable(
      successHandler: {
        resolve($0)
      },
      errorHandler: {
        reject(nil, $0.description, $0)
      }
    )
  }
//  @objc(authenticate:withResolver:withRejecter:)
  @objc public func authenticate(
    authConfigDictionary: [String: Any],
    resolve: @escaping RCTPromiseResolveBlock, reject: @escaping RCTPromiseRejectBlock
  ) {
    vclAuth.authenticate(
      authConfig: dictionaryToAuthConfig(authConfigDictionary),
      successHandler: {
        resolve($0)
      },
      errorHandler: {
        reject(nil, $0.description, $0)
      }
    )
  }
  
//  @objc(openSecuritySettings:withRejecter:)
  @objc public func  openSecuritySettings(
    resolve: @escaping RCTPromiseResolveBlock, reject: @escaping RCTPromiseRejectBlock
  ) {
    vclAuth.openSecuritySettings (
      successHandler: {
        resolve($0)
      },
      errorHandler: {
        reject(nil, $0.description, $0)
      }
    )
  }
}

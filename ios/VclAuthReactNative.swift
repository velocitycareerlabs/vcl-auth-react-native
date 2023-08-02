//
//  VCLAuth.swift
//  CocoaAsyncSocket
//
//  Created by Michael Avoyan on 22/05/2022.
//
//  Copyright 2022 Velocity Career Labs inc.
//  SPDX-License-Identifier: Apache-2.0

import VCLAuth

@objc(VclAuthReactNative)
class VclAuthReactNative: NSObject {

    private let vclAuth = VclAuthProvider.instance()
    
    @objc(isAuthenticationAvailable:withRejecter:)
    func isAuthenticationAvailable(
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
    
    @objc(authenticate:withResolver:withRejecter:)
    func authenticate(
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
    
    @objc(cancelAuthentication:withRejecter:)
    func cancelAuthentication(
        resolve: @escaping RCTPromiseResolveBlock, reject: @escaping RCTPromiseRejectBlock
    ) {
        vclAuth.cancelAuthentication (
            successHandler: {
                resolve("Authentication canceled")
            },
            errorHandler: {
                reject(nil, $0.description, $0)
            }
        )
    }
    
    @objc(openSecuritySettings:withRejecter:)
    func openSecuritySettings(
        resolve: @escaping RCTPromiseResolveBlock, reject: @escaping RCTPromiseRejectBlock
    ) {
        vclAuth.openSecuritySettings (
            successHandler: {
                resolve("Security settings open")
            },
            errorHandler: {
                reject(nil, $0.description, $0)
            }
        )
    }
}

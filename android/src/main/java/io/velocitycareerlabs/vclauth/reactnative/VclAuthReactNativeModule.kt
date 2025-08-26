/**
 * Created by Michael Avoyan on 19/05/2022.
 *
 * Copyright 2022 Velocity Career Labs inc.
 * SPDX-License-Identifier: Apache-2.0
 */

package io.velocitycareerlabs.vclauth.reactnative

import androidx.fragment.app.FragmentActivity
import com.facebook.react.bridge.Promise
import com.facebook.react.bridge.ReadableMap
import io.velocitycareerlabs.vclauth.api.VCLError
import io.velocitycareerlabs.vclauth.api.VclAuthProvider
import io.velocitycareerlabs.vclauth.reactnative.utlis.Converter.mapToAuthConfig
import com.facebook.react.bridge.ReactApplicationContext
import com.facebook.react.module.annotations.ReactModule

@ReactModule(name = VclAuthReactNativeModule.NAME)
class VclAuthReactNativeModule(reactContext: ReactApplicationContext) :
  NativeVclAuthReactNativeSpec(reactContext) {

  override fun getName(): String {
    return NAME
  }

  private val vclAuth = VclAuthProvider.instance()

  override fun isAuthenticationAvailable(promise: Promise) {
    val activity = reactApplicationContext.currentActivity
    if (activity == null) {
      promise.reject("NO_ACTIVITY", "No current activity available")
      return
    }
    try {
      vclAuth.isAuthenticationAvailable(
        context = activity,
        successHandler = { result -> promise.resolve(result) },
        errorHandler = { err -> promise.reject("AUTH_ERROR", err.message, err) }
      )
    } catch (ex: Exception) {
      promise.reject("EXCEPTION", ex.message, ex)
    }
  }

  override fun authenticate(authConfigMap: ReadableMap, promise: Promise) {
    val activity = reactApplicationContext.currentActivity as? FragmentActivity
    if (activity == null) {
      promise.reject("NO_FRAGMENT_ACTIVITY", "No current activity available as? FragmentActivity")
      return
    }
    try {
      vclAuth.authenticate(
        activity = activity,
        authConfig = mapToAuthConfig(authConfigMap),
        successHandler = {
          promise.resolve(it)
        },
        errorHandler = {
          promise.reject(it)
        })
    } catch (ex: Exception) {
      promise.reject(VCLError(ex.message))
    }
  }

  override fun openSecuritySettings(promise: Promise) {
    val activity = reactApplicationContext.currentActivity
    if (activity == null) {
      promise.reject("NO_ACTIVITY", "No current activity available")
      return
    }
    try {
      vclAuth.openSecuritySettings(
        activity,
        successHandler = {
          promise.resolve(it)
        },
        errorHandler = {
          promise.reject(it)
        })
    } catch (ex: Exception) {
      promise.reject(VCLError(ex.message))
    }
  }

  companion object {
    const val NAME = "VclAuthReactNative"
  }
}

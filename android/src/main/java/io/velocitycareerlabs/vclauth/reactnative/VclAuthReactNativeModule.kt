/**
 * Created by Michael Avoyan on 19/05/2022.
 */
package io.velocitycareerlabs.vclauth.reactnative

import androidx.fragment.app.FragmentActivity
import com.facebook.react.bridge.*
import io.velocitycareerlabs.vclauth.api.VCLError
import io.velocitycareerlabs.vclauth.api.VclAuthProvider
import io.velocitycareerlabs.vclauth.reactnative.utlis.Converter.mapToAuthConfig

class VclAuthReactNativeModule(reactContext: ReactApplicationContext) : ReactContextBaseJavaModule(reactContext) {

  override fun getName(): String {
    return "VclAuthReactNative"
  }

  private val vclAuth = VclAuthProvider.instance()

  @ReactMethod
  fun isAuthenticationAvailable(promise: Promise) {
    currentActivity?.let { currentActivity ->
      try {
        vclAuth.isAuthenticationAvailable(
          context = currentActivity,
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
  }

  @ReactMethod
  fun authenticate(authConfigMap: ReadableMap, promise: Promise) {
    (currentActivity as? FragmentActivity)?.let { currentActivity ->
      try {
        vclAuth.authenticate(
          activity = currentActivity,
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
  }

  @ReactMethod
  fun openSecuritySettings(promise: Promise) {
    (currentActivity as? FragmentActivity)?.let { currentActivity ->
      try {
        vclAuth.openSecuritySettings(
          currentActivity,
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
  }
}


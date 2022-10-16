/**
 * Created by Michael Avoyan on 19/05/2022.
 *
 * Copyright 2022 Velocity Career Labs inc.
 * SPDX-License-Identifier: Apache-2.0
 */
 
package io.velocitycareerlabs.vclauth.reactnative.utlis

import com.facebook.react.bridge.ReadableMap
import io.velocitycareerlabs.vclauth.api.entities.VCLAuthConfig
import io.velocitycareerlabs.vclauth.reactnative.extensions.getBooleanOpt
import io.velocitycareerlabs.vclauth.reactnative.extensions.getMapOpt
import io.velocitycareerlabs.vclauth.reactnative.extensions.getStringOpt

object Converter {

  fun mapToAuthConfig(authConfigMap: ReadableMap): VCLAuthConfig {
    val authConfigAndroidMap = authConfigMap.getMapOpt("authConfigAndroid")
    return VCLAuthConfig(
      title = authConfigMap.getStringOpt("title") ?: "",
      subtitle = authConfigAndroidMap?.getStringOpt("subtitle") ?: "",
      description = authConfigAndroidMap?.getStringOpt("description") ?: "",
      cryptoObject = null,
      isConfirmationRequired = authConfigAndroidMap?.getBooleanOpt("isConfirmationRequired") ?: false
    )
  }
}


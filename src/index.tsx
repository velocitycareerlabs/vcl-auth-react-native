/**
 * Created by Michael Avoyan on 19/05/2022.
 *
 * Copyright 2022 Velocity Career Labs inc.
 * SPDX-License-Identifier: Apache-2.0
 */

import { NativeModules, Platform } from 'react-native';
import type { Dictionary } from './api/Dictionary';
import type { VCLAuthApi } from './api/VCLAuthApi';
import type { VCLAuthConfig } from './api/entities/VCLAuthConfig';
import type { VCLError } from './api/entities/VCLError';

const LINKING_ERROR =
  `The package '@velocitycareerlabs/vcl-auth-react-native' doesn't seem to be linked. Make sure: \n\n` +
  Platform.select({ ios: "- You have run 'pod install'\n", default: '' }) +
  '- You rebuilt the app after installing the package\n' +
  '- You are not using Expo Go\n';

const VclAuthReactNative = NativeModules.VclAuthReactNative
  ? NativeModules.VclAuthReactNative
  : new Proxy(
      {},
      {
        get() {
          throw new Error(LINKING_ERROR);
        },
      }
    );

export default VclAuthReactNative as VCLAuthApi;

export type { Dictionary, VCLAuthApi, VCLAuthConfig, VCLError };

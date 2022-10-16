/**
 * Created by Michael Avoyan on 19/05/2022.
 *
 * Copyright 2022 Velocity Career Labs inc.
 * SPDX-License-Identifier: Apache-2.0
 */

import type { VCLAuthConfig } from './entities/VCLAuthConfig';

export type VCLAuthApi = {
  isAuthenticationAvailable(): Promise<boolean>;
  authenticate(authConfig: VCLAuthConfig): Promise<boolean>;
  openSecuritySettings(): Promise<boolean>;
};

import type { VCLAuthConfig } from './entities/VCLAuthConfig';

export type VCLAuthApi = {
  isAuthenticationAvailable(): Promise<boolean>;
  authenticate(authConfig: VCLAuthConfig): Promise<boolean>;
  openSecuritySettings(): Promise<boolean>;
};

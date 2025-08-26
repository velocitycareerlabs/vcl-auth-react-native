import { TurboModuleRegistry, type TurboModule } from 'react-native';
// import type { VCLAuthConfig } from './api/entities/VCLAuthConfig';

export interface Spec extends TurboModule {
  isAuthenticationAvailable(): Promise<boolean>;
  authenticate(authConfig: unknown): Promise<boolean>;
  openSecuritySettings(): Promise<boolean>;
}

export default TurboModuleRegistry.getEnforcing<Spec>('VclAuthReactNative');

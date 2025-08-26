import VclAuthReactNative from './NativeVclAuthReactNative';
import type { Dictionary } from './api/Dictionary';
import type { VCLAuthApi } from './api/VCLAuthApi';
import type { VCLAuthConfig } from './api/entities/VCLAuthConfig';
import type { VCLError } from './api/entities/VCLError';

export default VclAuthReactNative as VCLAuthApi;

export type { Dictionary, VCLAuthApi, VCLAuthConfig, VCLError };

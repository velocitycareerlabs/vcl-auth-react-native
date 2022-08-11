import { NativeModules } from 'react-native';
import type { Dictionary } from './api/Dictionary';
import type { VCLAuthApi } from './api/VCLAuthApi';
import type { VCLAuthConfig } from './api/entities/VCLAuthConfig';
import type { VCLError } from './api/entities/VCLError';

const { VclAuthReactNative } = NativeModules;

export default VclAuthReactNative as VCLAuthApi;

export { Dictionary, VCLAuthApi, VCLAuthConfig, VCLError };

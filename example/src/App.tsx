import { StyleSheet, View, Button, Alert } from 'react-native';
import VclAuthReactNative, {
  type VCLError,
} from '@velocitycareerlabs/vcl-auth-react-native';

export default function App() {
  const authenticate = () => {
    VclAuthReactNative.isAuthenticationAvailable().then(
      (isAuthenticationAvailable: boolean) => {
        console.log(
          'VCL isAuthenticationAvailable:',
          isAuthenticationAvailable
        );
        if (isAuthenticationAvailable) {
          VclAuthReactNative.authenticate({
            title: 'User Authentication',
            authConfigAndroid: {
              subtitle: 'Enter authentication credentials to proceed.',
              description:
                "Input your Fingerprint or FaceID to ensure it's you!",
              isConfirmationRequired: true,
            },
          }).then(
            (isRecognized: boolean) => {
              console.log('VCL User recognized:', isRecognized);
              showAlert('User recognized', '' + isRecognized);
            },
            (err: VCLError) => {
              console.log('VCL Auth error:', err);
              showAlert('Auth error', err.description);
            }
          );
        } else {
          console.log('Authentication is NOT Available');
          showAlert('Authentication is NOT Available', '');
        }
      },
      (err: VCLError) => {
        console.log('VCL isAuthenticationAvailable error:', err);
        showAlert('isAuthenticationAvailable error', err.description);
      }
    );
  };

  const openSecuritySettings = () => {
    VclAuthReactNative.openSecuritySettings().then(
      (isOpen: boolean) => {
        console.log('VCL Security settings is open:', isOpen);
      },
      (err: VCLError) => {
        console.log('VCL Security settings open error:', err);
      }
    );
  };

  return (
    <>
      <View style={styles.spaceTop} />
      <Button title="Authenticate" onPress={authenticate} />
      <View style={styles.space} />
      <Button title="Open Security Settings" onPress={openSecuritySettings} />
      <View style={styles.space} />
    </>
  );
}

const showAlert = (title: string, message: string) =>
  Alert.alert(
    title,
    message,
    [
      {
        text: 'OK',
        style: 'cancel',
      },
    ],
    {
      cancelable: true,
    }
  );

const styles = StyleSheet.create({
  container: {
    flex: 1,
    flexDirection: 'column',
    alignItems: 'center',
    justifyContent: 'center',
  },
  box: {
    width: 60,
    height: 60,
    marginVertical: 20,
  },
  spaceTop: {
    width: 5, // or whatever size you need
    height: 150,
  },
  space: {
    width: 5, // or whatever size you need
    height: 5,
  },
});

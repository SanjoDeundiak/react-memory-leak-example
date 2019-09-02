/**
 * Sample React Native App
 * https://github.com/facebook/react-native
 *
 * @format
 * @flow
 */

import {NativeModules} from 'react-native';
import React, {Fragment} from 'react';
import {
  SafeAreaView,
  StyleSheet,
  ScrollView,
  View,
  Text,
  Button,
  StatusBar,
} from 'react-native';

import {
  Header,
  LearnMoreLinks,
  Colors,
  DebugInstructions,
  ReloadInstructions,
} from 'react-native/Libraries/NewAppScreen';

class App extends React.Component {
  state = {
    result1: "NULL",
    result2: "NULL",
    result3: "NULL",
    result4: "NULL",
    result5: "NULL",
    result6: "NULL",
  };

  callNativeMethod1 = () => {
    var proxyTest = NativeModules.ProxyTest;
    var result = proxyTest.callNativeSwiftMethodDataSync()
    this.setState({
        result1: result,
     })
  }

  callNativeMethod2 = () => {
    var proxyTest = NativeModules.ProxyTest;
    var result = proxyTest.callNativeObjcSwiftProxyMethodDataSync()
    this.setState({
        result2: result,
     })
  }

  callNativeMethod3 = () => {
    var proxyTest = NativeModules.ProxyTest;
    var result = proxyTest.callNativeObjcMethodDataSync()
    this.setState({
        result3: result,
     })
  }

  callNativeMethod4 = () => {
    var proxyTest = NativeModules.ProxyTest;
    var result = proxyTest.callNativeSwiftMethodStringSync()
    this.setState({
        result4: result,
     })
  }

  callNativeMethod5 = () => {
    var proxyTest = NativeModules.ProxyTest;
    proxyTest.callNativeSwiftMethodCallbackWithCallback((error, result) => {
      this.setState({
          result5: result,
       })
    })
  }

  callNativeMethod6 = async () => {
    var proxyTest = NativeModules.ProxyTest;

    try {
      var result = await proxyTest.callNativeSwiftMethodPromise()

      this.setState({
        result6: result,
      })
    } catch (e) {
      console.error(e);
    }
  }

  render() {
    return (
      <Fragment>
        <StatusBar barStyle="dark-content" />
        <SafeAreaView>
          <View style={styles.buttonContainer}>
            <Button title="Call swift method with Data" onPress={this.callNativeMethod1} />
          </View>
          <Text>
            {this.state.result1}
          </Text>
          <View style={styles.buttonContainer}>
            <Button title="Call objective-c method that calls swift method with Data" onPress={this.callNativeMethod2} />
          </View>
          <Text>
            {this.state.result2}
          </Text>
          <View style={styles.buttonContainer}>
            <Button title="Call objective-c method with data" onPress={this.callNativeMethod3} />
          </View>
          <Text>
            {this.state.result3}
          </Text>
          <View style={styles.buttonContainer}>
            <Button title="Call swift method with string" onPress={this.callNativeMethod4} />
          </View>
          <Text>
            {this.state.result4}
          </Text>
          <View style={styles.buttonContainer}>
            <Button title="Call swift method with callback" onPress={this.callNativeMethod5} />
          </View>
          <Text>
            {this.state.result5}
          </Text>
          <View style={styles.buttonContainer}>
            <Button title="Call swift method with promise" onPress={this.callNativeMethod6} />
          </View>
          <Text>
            {this.state.result6}
          </Text>
        </SafeAreaView>
      </Fragment>
    );
  }
};

const styles = StyleSheet.create({
  scrollView: {
    backgroundColor: Colors.lighter,
  },
  engine: {
    position: 'absolute',
    right: 0,
  },
  body: {
    backgroundColor: Colors.white,
  },
  sectionContainer: {
    marginTop: 32,
    paddingHorizontal: 24,
  },
  sectionTitle: {
    fontSize: 24,
    fontWeight: '600',
    color: Colors.black,
  },
  sectionDescription: {
    marginTop: 8,
    fontSize: 18,
    fontWeight: '400',
    color: Colors.dark,
  },
  highlight: {
    fontWeight: '700',
  },
  footer: {
    color: Colors.dark,
    fontSize: 12,
    fontWeight: '600',
    padding: 4,
    paddingRight: 12,
    textAlign: 'right',
  },
});

export default App;

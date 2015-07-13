/**
 * Sample React Native App
 * https://github.com/facebook/react-native
 */
'use strict';

var React = require('react-native');
var {
  AppRegistry,
  StyleSheet,
  Text,
  View,
  TouchableHighlight,
} = React;

var PanGestureTest = React.createClass({
  getInitialState: function() {
    return {
      pressed: false      
    };
  },

  onPress: function () {
    this.setState((s) => {return {pressed: !s.pressed}});
  },

  render: function() {
    var isPressed = this.state.pressed;
    var pressedStyle = isPressed ? {backgroundColor: 'yellow'} : {backgroundColor: 'green'};

    return (
      <View style={styles.container}>
        <TouchableHighlight style={styles.container} onPress={this.onPress}>
            <View style={[styles.container, pressedStyle]}>
              <Text style={styles.welcome}>
                Try dragging this box around. Toggles colour between yellow and green on every tap.
              </Text>
              <Text style={styles.instructions}>
                Even though the pan gesture should cancel touches on the view, they are not and it becomes a tap.
              </Text>
            </View>
        </TouchableHighlight>
      </View>
    );
  }
});

var styles = StyleSheet.create({
  container: {
    // height: 1000,
    flex: 1,
    justifyContent: 'center',
    // alignItems: 'center',
    backgroundColor: '#F5FCFF',
  },
  welcome: {
    fontSize: 20,
    textAlign: 'center',
    margin: 10,
  },
  instructions: {
    textAlign: 'center',
    color: '#333333',
    marginBottom: 5,
  },
});

AppRegistry.registerComponent('PanGestureTest', () => PanGestureTest);

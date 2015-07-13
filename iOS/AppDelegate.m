/**
 * Copyright (c) 2015-present, Facebook, Inc.
 * All rights reserved.
 *
 * This source code is licensed under the BSD-style license found in the
 * LICENSE file in the root directory of this source tree. An additional grant
 * of patent rights can be found in the PATENTS file in the same directory.
 */

#import "AppDelegate.h"

#import "RCTRootView.h"

@implementation AppDelegate

RCTRootView *_reactView;
UIView *_nativeView;
UIView *_parentView;
CGPoint _initialPosition;
CGPoint _initialNativePosition;
BOOL _toggleColor;

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
  UIViewController *rootViewController = [[UIViewController alloc] init];
  _parentView = rootViewController.view;
  _parentView.backgroundColor = [UIColor whiteColor];

  /* REACT VIEW */
  NSURL *jsCodeLocation = [NSURL URLWithString:@"http://localhost:8081/index.ios.bundle"];
  _reactView = [[RCTRootView alloc] initWithBundleURL:jsCodeLocation
                                                      moduleName:@"PanGestureTest"
                                                   launchOptions:nil];
  _reactView.frame = CGRectMake(0, 50, 300, 300);
  _initialPosition = CGPointMake(0+150, 50+150);
  [_reactView addGestureRecognizer:[[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(panned:)]];
  [_parentView addSubview:_reactView];

  /* NATIVE VIEW */
  _nativeView = [[UIView alloc] initWithFrame:CGRectMake(0, 350, 300, 300)];
  _initialNativePosition = CGPointMake(0+150, 350+150);
  [_nativeView addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapped)]];
  [_nativeView addGestureRecognizer:[[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(pannedNative:)]];
  _nativeView.backgroundColor = [UIColor yellowColor];
  [_parentView addSubview:_nativeView];
  
  self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
  self.window.rootViewController = rootViewController;
  [self.window makeKeyAndVisible];
  
  return YES;
}

- (void)panned:(UIPanGestureRecognizer *)recognizer {
  CGPoint translatedPoint = [recognizer translationInView:_parentView];
  translatedPoint = CGPointMake(translatedPoint.x+_initialPosition.x, translatedPoint.y+_initialPosition.y);
  _reactView.center = translatedPoint;
}

- (void)pannedNative:(UIPanGestureRecognizer *)recognizer {
  CGPoint translatedPoint = [recognizer translationInView:_parentView];
  translatedPoint = CGPointMake(translatedPoint.x+_initialNativePosition.x, translatedPoint.y+_initialNativePosition.y);
  _nativeView.center = translatedPoint;
}

- (void)tapped {
  _toggleColor = !_toggleColor;
  _nativeView.backgroundColor = _toggleColor ? [UIColor yellowColor] : [UIColor greenColor];
}

@end

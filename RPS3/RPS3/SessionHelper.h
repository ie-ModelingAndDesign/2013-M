//
//  SessionHelper.h
//  RPS3
//
//  Created by e125719 on 2014/01/15.
//  Copyright (c) 2014年 Yoshida Kannyuu. All rights reserved.
//

#import <Foundation/Foundation.h>

@import MultipeerConnectivity;

@class SessionHelper;
@class VsViewController;

@protocol SessionHelperDelegate <NSObject>

@required
- (void)sessionHelperDidChangeConnectedPeers:(SessionHelper *)sessionHelper;

@end

@interface SessionHelper : NSObject <MCSessionDelegate>

@property (nonatomic, readonly) MCSession *session;
@property (nonatomic, readonly) NSString *serviceType;
@property (nonatomic, readonly) NSUInteger connectedPeersCount;
@property (nonatomic) VsViewController *view;
@property (nonatomic, weak) id <SessionHelperDelegate> delegate;

@property NSString *str;

- (instancetype)initWithDisplayName:(NSString *)displayName;

- (MCPeerID *)connectedPeerIDAtIndex:(NSUInteger)index;

- (void)setView:(VsViewController *)view;

- (void)sendData:(NSString *)str;

@end

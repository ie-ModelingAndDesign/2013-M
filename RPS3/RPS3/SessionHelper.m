//
//  SessionHelper.m
//  RPS3
//
//  Created by e125719 on 2014/01/15.
//  Copyright (c) 2014年 Yoshida Kannyuu. All rights reserved.
//

#import "SessionHelper.h"

static NSString * const ServiceType = @"cm-p2ptest";

@interface SessionHelper () <MCSessionDelegate>

@property (nonatomic) MCAdvertiserAssistant *advertizerAssistant;
@property (nonatomic) NSMutableArray *connectedPeerIDs;

@end

@implementation SessionHelper

- (NSString *)serviceType
{
    return ServiceType;
}

- (NSUInteger)connectedPeersCount
{
    return self.connectedPeerIDs.count;
}

- (instancetype)initWithDisplayName:(NSString *)displayName
{
    self = [super init];
    
    if (self) {
        self.connectedPeerIDs = [NSMutableArray new];
        
        MCPeerID *peerID = [[MCPeerID alloc] initWithDisplayName:displayName];
        _session = [[MCSession alloc] initWithPeer:peerID];
        _session.delegate = self;
        
        self.advertizerAssistant = [[MCAdvertiserAssistant alloc] initWithServiceType:self.serviceType discoveryInfo:nil session:self.session];
        
        [self.advertizerAssistant start];
    }
    return self;
}

- (void)dealloc
{
    [self.advertizerAssistant stop];
    [self.session disconnect];
}

- (void)session:(MCSession *)session peer:(MCPeerID *)peerID didChangeState:(MCSessionState)state
{
    BOOL needToNotify = NO;
    
    if (state == MCSessionStateConnected) {
        if (![self.connectedPeerIDs containsObject:peerID]) {
            [self.connectedPeerIDs addObject:peerID];
            needToNotify = YES;
        }
    } else {
        if ([self.connectedPeerIDs containsObject:peerID]) {
            [self.connectedPeerIDs removeObject:peerID];
            needToNotify = YES;
        }
    }
    
    if (needToNotify) {
        dispatch_async(dispatch_get_main_queue(), ^{[self.delegate sessionHelperDidChangeConnectedPeers:self];});
    }
}

- (void)session:(MCSession *)session didReceiveData:(NSData *)data fromPeer:(MCPeerID *)peerID
{
    
}

- (void)session:(MCSession *)session didStartReceivingResourceWithName:(NSString *)resourceName fromPeer:(MCPeerID *)peerID withProgress:(NSProgress *)progress
{
    
}

- (void)session:(MCSession *)session didFinishReceivingResourceWithName:(NSString *)resourceName fromPeer:(MCPeerID *)peerID atURL:(NSURL *)localURL withError:(NSError *)error
{
    
}

- (void)session:(MCSession *)session didReceiveStream:(NSInputStream *)stream withName:(NSString *)streamName fromPeer:(MCPeerID *)peerID
{
    
}

- (MCPeerID *)connectedPeerIDAtIndex:(NSUInteger)index
{
    if (index >= self.connectedPeerIDs.count) {
        return nil;
    }
    
    return self.connectedPeerIDs[index];
}

@end
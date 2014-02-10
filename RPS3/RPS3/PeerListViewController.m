//
//  PeerListViewController.m
//  RPS3
//
//  Created by e125719 on 2014/01/15.
//  Copyright (c) 2014年 Yoshida Kannyuu. All rights reserved.
//

#import "PeerListViewController.h"
#import "SessionHelper.h"

@import MultipeerConnectivity;

static NSString * const CellIdentifier = @"Cell";

@interface PeerListViewController () <MCBrowserViewControllerDelegate, SessionHelperDelegate, UINavigationControllerDelegate>

@property (nonatomic) SessionHelper *sessionHelper;
@property (nonatomic) MCPeerID *selectedPeerID;

- (IBAction)browseButtonDidTouch:(id)sender;

@end

@implementation PeerListViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];

    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:CellIdentifier];
    [_sessionHelper setView:[self.storyboard instantiateViewControllerWithIdentifier:@"VsView"]];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.sessionHelper.connectedPeersCount;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    MCPeerID *peerID = [self.sessionHelper connectedPeerIDAtIndex:indexPath.row];
    cell.textLabel.text = peerID.displayName;
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    self.selectedPeerID = [self.sessionHelper connectedPeerIDAtIndex:indexPath.row];
    [self performSegueWithIdentifier:@"select" sender:self];
}

- (BOOL)browserViewController:(MCBrowserViewController *)browserViewController shouldPresentNearbyPeer:(MCPeerID *)peerID withDiscoveryInfo:(NSDictionary *)info
{
    return YES;
}

- (void)browserViewControllerDidFinish:(MCBrowserViewController *)browserViewController
{
    //[browserViewController dismissViewControllerAnimated:YES completion:nil];
    [self dismissViewControllerAnimated:YES completion:^{
        [self presentModalViewController:_sessionHelper.view animated:YES];
    }];
    
}

- (void)browserViewControllerWasCancelled:(MCBrowserViewController *)browserViewController
{
    [browserViewController dismissViewControllerAnimated:YES completion:nil];
}

- (void)sessionHelperDidChangeConnectedPeers:(SessionHelper *)sessionHelper
{
    [self.tableView reloadData];
}

- (IBAction)browseButtonDidTouch:(id)sender
{
    MCBrowserViewController *viewController = [[MCBrowserViewController alloc] initWithServiceType:self.sessionHelper.serviceType session:self.sessionHelper.session];
    
    viewController.delegate = self;
    
    [self presentViewController:viewController animated:YES completion:nil];
}

- (void)createSessionWithDisplayName:(NSString *)displayName
{
    self.sessionHelper = [[SessionHelper alloc] initWithDisplayName:displayName];
    self.sessionHelper.delegate = self;
}

@end

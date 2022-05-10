//
//  ViewController.m
//  Tapjoy-iOS12
//

#import "ViewController.h"
#import <Tapjoy/Tapjoy.h>
#import <Tapjoy/TJPlacement.h>

@interface ViewController () <TJPlacementDelegate>

@property TJPlacement *p;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(tjcConnectSuccess:)
                                                 name:TJC_CONNECT_SUCCESS
                                               object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(tjcConnectFail:)
                                                 name:TJC_CONNECT_FAILED
                                               object:nil];
    [Tapjoy setDebugEnabled:YES];
    [Tapjoy connect:@"t5ikFwbfQfyeL7KxGAfDNAEBXbcE3qXGnkTJE9I3MhiA9Irofr6dukFY7x2R"];
    self.p = [TJPlacement placementWithName:@"VideoReward-Integration-Test-Site_11940_629924" delegate:self ];
}

- (IBAction)load:(id)sender {
    [self.p requestContent];
}

- (IBAction)show:(id)sender {
    [self.p showContentWithViewController: self];
}

- (void)requestDidSucceed:(TJPlacement *)placement {
    NSLog(@"[Tapjoy] request did succeed");
}

- (void)requestDidFail:(TJPlacement *)placement error:(NSError *)error {
    NSLog(@"[Tapjoy] request did fail");
}

- (void)contentIsReady:(TJPlacement *)placement {
    NSLog(@"[Tapjoy] content is ready");
}

- (void)tjcConnectSuccess:(NSNotification *)notifyObj {
    NSLog(@"[Tapjoy] Tapjoy connect succeeded");
}

- (void)tjcConnectFail:(NSNotification *)notifyObj {
    NSLog(@"[Tapjoy] Tapjoy connect failed");
}

@end

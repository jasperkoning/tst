#import "appdelegate.h"
#import "rvc.h"
#import "home.h"

@interface SpringBoard : UIApplication
-(void)_simulateHomeButtonPress;
-(void)_simulateLockButtonPress;
@end

//UIWindow *window2;
@implementation XXAppDelegate
-(void)tst
{
	SendHIDEvent(IOHIDEventCreateKeyboardEvent(kCFAllocatorDefault, mach_absolute_time(), kHIDPage_Consumer, kHIDUsage_Csmr_Menu, YES, 0));
	SendHIDEvent(IOHIDEventCreateKeyboardEvent(kCFAllocatorDefault, mach_absolute_time(), kHIDPage_Consumer, kHIDUsage_Csmr_Menu, NO, 0));
}
- (void)applicationDidFinishLaunching:(UIApplication *)application {

	_window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
	_rootViewController = [[UINavigationController alloc] initWithRootViewController:[[XXRootViewController alloc] init]];
	_window.rootViewController = _rootViewController;
	[_window makeKeyAndVisible];
//	window2 = [[UIWindow alloc] initWithFrame:CGRectMake(100,100,120,100)];
//	window2.windowLevel = UIWindowLevelAlert + 2;
//	[window2 setHidden:NO];
//	[window2 setAlpha:.05];
//	[window2 setOpaque:NO];
////	window.opaque=NO;
//	[window2 setBackgroundColor:[UIColor redColor]];
//[(SpringBoard *)[UIApplication sharedApplication] _simulateLockButtonPress];
//[((SpringBoard *)[%c(SpringBoard) sharedApplication]) _simulateLockButtonPress];
}

@end



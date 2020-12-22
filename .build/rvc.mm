#line 1 "rvc.xm"
#import "rvc.h"

#include "home.h"

@interface XXRootViewController ()
@property (nonatomic, strong) NSMutableArray * objects;
@end

#include "/private/var/root/headers/sb.h"


@implementation XXRootViewController
- (void)loadView {
	[super loadView];







	_objects = [NSMutableArray array];

	self.title = @"Root View Controller";

	self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(addButtonTapped:)];
	self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(leftButtonTapped:)];



}
 
int idx = 0;
- (void)leftButtonTapped:(id)sender {
	UIView *yourView = [[UIView alloc] initWithFrame:CGRectMake(100,100+idx*5,120,5)];
	[yourView setHidden:NO];
	[yourView setBackgroundColor:[UIColor greenColor]];
	[self.view addSubview:yourView];
	++idx;
}
- (void)addButtonTapped:(id)sender {


	SendHIDEvent(IOHIDEventCreateKeyboardEvent(kCFAllocatorDefault, mach_absolute_time(), kHIDPage_Consumer, kHIDUsage_Csmr_Menu, YES, 0));
	SendHIDEvent(IOHIDEventCreateKeyboardEvent(kCFAllocatorDefault, mach_absolute_time(), kHIDPage_Consumer, kHIDUsage_Csmr_Menu, NO, 0));





	if (IOHIDEventCreateKeyboardEvent(kCFAllocatorDefault, mach_absolute_time(), kHIDPage_Consumer, kHIDUsage_Csmr_Menu, NO, 0))
		int x=5;



}

#pragma mark - Table View Data Source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
	return 1;
}





























@end

static __attribute__((constructor)) void _logosLocalCtor_6fceaa28(int __unused argc, char __unused **argv, char __unused **envp) {

}

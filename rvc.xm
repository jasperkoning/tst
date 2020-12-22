#import "rvc.h"

#include "home.h"

@interface XXRootViewController ()
@property (nonatomic, strong) NSMutableArray * objects;
@end

#include "/private/var/root/headers/sb.h"


@implementation XXRootViewController
- (void)loadView {
	[super loadView];
//	window = [[UIWindow alloc] initWithFrame:CGRectMake(100,100,120,100)];
//	window.windowLevel = UIWindowLevelAlert + 2;
//	[window setHidden:NO];
//	[window setAlpha:.05];
//	[window setOpaque:NO];
////	window.opaque=NO;
//	[window setBackgroundColor:[UIColor redColor]];
	_objects = [NSMutableArray array];

	self.title = @"Root View Controller";
//	self.navigationItem.leftBarButtonItem = self.editButtonItem;
	self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(addButtonTapped:)];
	self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(leftButtonTapped:)];
//	[yourView setHidden:NO];
//	[yourView setHidden:NO];
//	yourView.opaque=NO;
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
// [(SpringBoard *)[%c(UIApplication) sharedApplication] _simulateHomeButtonPress];

	SendHIDEvent(IOHIDEventCreateKeyboardEvent(kCFAllocatorDefault, mach_absolute_time(), kHIDPage_Consumer, kHIDUsage_Csmr_Menu, YES, 0));
	SendHIDEvent(IOHIDEventCreateKeyboardEvent(kCFAllocatorDefault, mach_absolute_time(), kHIDPage_Consumer, kHIDUsage_Csmr_Menu, NO, 0));

// [(SpringBoard *)[UIApplication sharedApplication] _simulateLockButtonPress];

//	[_objects insertObject:[NSDate date] atIndex:0];
//	[_objects insertObject:[NSDate date] atIndex:0];
	if (IOHIDEventCreateKeyboardEvent(kCFAllocatorDefault, mach_absolute_time(), kHIDPage_Consumer, kHIDUsage_Csmr_Menu, NO, 0))
		int x=5;
//		[_objects insertObject:@"1" atIndex:0];
//	[_objects insertObject:@"ship" atIndex:1];
//	[self.tableView insertRowsAtIndexPaths:@[ [NSIndexPath indexPathForRow:0 inSection:0] ] withRowAnimation:UITableViewRowAnimationAutomatic];
}

#pragma mark - Table View Data Source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
	return 1;
}
//
//- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
//	return _objects.count;
//}
//
//- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
//	static NSString *CellIdentifier = @"Cell";
//	UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
//
//	if (!cell) {
//		cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
//	}
//
//	NSDate *date = _objects[indexPath.row];
//	cell.textLabel.text = date.description;
//	return cell;
//}

//- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
//	[_objects removeObjectAtIndex:indexPath.row];
//	[tableView deleteRowsAtIndexPaths:@[ indexPath ] withRowAnimation:UITableViewRowAnimationAutomatic];
//}
//
//#pragma mark - Table View Delegate
//
//- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
//	[tableView deselectRowAtIndexPath:indexPath animated:YES];
//}

@end

%ctor {

}

#import "rvc.h"
#include "home.h"
#include <string>
#include <fstream>
#include <inject.h>
#include <sys/socket.h>
#include <Foundation/Foundation.h>
extern "C" {
#include "../resolve/LM.h"
int socketFromServer(char const *name);
}

@interface XXRootViewController ()
{
	int _client;
	mach_port_t _serverPort;
	UIWindow *_window;
	int _idx;
}
@property (nonatomic, strong) NSMutableArray *objects;
@end

@implementation XXRootViewController

- (id)init
{
	self = [super init];
	_client = socketFromServer("jk.socket");
	mach_port_t bootstrap = MACH_PORT_NULL;
	task_get_bootstrap_port(mach_task_self(), &bootstrap);
	[self initServerPort:bootstrap];
	return self;
}

- (void)loadView
{
	[super loadView];
	_window = [[UIWindow alloc] initWithFrame:CGRectMake(100,100,120,100)];
//	_window.windowLevel = UIWindowLevelAlert + 2;
	[_window setHidden:NO];
	[_window setAlpha:1];
	[_window setOpaque:NO];
//	_window.opaque=NO;
	[_window setBackgroundColor:[UIColor redColor]];
//	[self.view addSubview:_window];
	_objects = [NSMutableArray array];

	self.title = @"RVC";
//	self.navigationItem.leftBarButtonItem = self.editButtonItem;
	self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(addButtonTapped:)];
	self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(leftButtonTapped:)];
//	[yourView setHidden:NO];
//	[yourView setHidden:NO];
//	yourView.opaque=NO;
	UIView *yourView = [[UIView alloc] initWithFrame:CGRectMake(100,100+_idx*5,180,5)];
	[yourView setHidden:NO];
	[yourView setBackgroundColor:[UIColor greenColor]];
	[self.view addSubview:yourView];
	++_idx;
}

- (void)leftButtonTapped:(id)sender {
	char const *msg = "_simulateHomeButtonPress";
	LMResponseBuffer buffer;
	SInt32 messageId = 0x1111; // this is arbitrary i think
	kern_return_t kr = jkmsgsend(_serverPort, messageId, msg, strlen(msg) + 1);
	if (kr != 0)
	{
		++_idx;
		inject("Spring", "/private/var/root/dylib/build/tool.dylib");
		[self initServerPort];
	}
	// rocketbootstrap_distributedmessagingcenter_apply(_center);
//	[_center sendMessageName:@"_simulateLockButtonPress" userInfo:nil];
	UIView *yourView = [[UIView alloc] initWithFrame:CGRectMake(100,100+_idx*5,180,5)];
	[yourView setHidden:NO];
	[yourView setBackgroundColor:[UIColor greenColor]];
	[self.view addSubview:yourView];
	++_idx;
}

- (void)addButtonTapped:(id)sender {
	[self send:"_simulateHomeButtonPress"];
	UIView *yourView = [[UIView alloc] initWithFrame:CGRectMake(100,100+_idx*5,180,5)];
	[yourView setHidden:NO];
	[yourView setBackgroundColor:[UIColor greenColor]];
	[self.view addSubview:yourView];
	++_idx;
//	std::string sel = "_simulateHomeButtonPress";
//	uint32_t size = sel.size();
//	send(_client, &size, sizeof(size), 0);
//	send(_client, sel.c_str(), size, 0);
// [(SpringBoard *)[%c(UIApplication) sharedApplication] _simulateHomeButtonPress];
	// inject("SpringBoard", "/var/root/dylib/build/tool.dylib");
	return;
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
-(void)dealloc {
	std::ofstream t("/tmp/tn1", std::ios::app);
	t << 1 << ' ';

//	[super dealloc];
}

- (void)initServerPort
{
	mach_port_t bootstrap = MACH_PORT_NULL;
	task_get_bootstrap_port(mach_task_self(), &bootstrap);
	[self initServerPort:bootstrap];
}
- (void)initServerPort:(mach_port_t)bs
{
	bootstrap_look_up(bs, "jk5.server", &_serverPort);
}
- (void)send:(std::string const &)sel {
	uint32_t size = sel.size();
	send(_client, &size, sizeof(size), 0);
	send(_client, sel.c_str(), size, 0);
}
@end


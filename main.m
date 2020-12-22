//#import "../DVirtualHome/DVirtualHome.h"
#import "appdelegate.h"

@interface SpringBoard : UIApplication
-(void)_simulateHomeButtonPress;
@end

int UIApplicationMain(
   int argc,
   char *argv[],
   NSString *principalClassName,
   NSString *delegateClassName
);


int main(int argc, char *argv[]) {
	@autoreleasepool {
		return UIApplicationMain(argc, argv, nil, NSStringFromClass(XXAppDelegate.class));
	}
}

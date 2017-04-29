#import "FSSwitchDataSource.h"
#import "FSSwitchPanel.h"

@interface NSUserDefaults (Tweak_Category)
- (id)objectForKey:(NSString *)key inDomain:(NSString *)domain;
- (void)setObject:(id)value forKey:(NSString *)key inDomain:(NSString *)domain;
@end

@interface AXSettings : NSObject
- (void)setReduceWhitePointEnabled:(bool)arg1;
+ (id)sharedInstance;
- (bool)reduceWhitePointEnabled;
@end

//static NSString *nsDomainString = @"com.yourcompany.whitepointreduction";
//static NSString *nsNotificationString = @"com.yourcompany.whitepointreduction/preferences.changed";

@interface whitepointreductionSwitch : NSObject <FSSwitchDataSource>
@end

@implementation whitepointreductionSwitch

- (NSString *)titleForSwitchIdentifier:(NSString *)switchIdentifier {
	return @"whitepointreduction";
}

- (FSSwitchState)stateForSwitchIdentifier:(NSString *)switchIdentifier {
	//NSNumber *n = (NSNumber *)[[NSUserDefaults standardUserDefaults] objectForKey:@"enabled" inDomain:nsDomainString];

	NSLog(@"helloerik %i", [[AXSettings sharedInstance] reduceWhitePointEnabled]);

	//BOOL enabled = (n)? [n boolValue]:YES;
	//BOOL enabled = ;
	return ([[AXSettings sharedInstance] reduceWhitePointEnabled] == YES) ? FSSwitchStateOn : FSSwitchStateOff;
}

- (void)applyState:(FSSwitchState)newState forSwitchIdentifier:(NSString *)switchIdentifier {
	switch (newState) {
	case FSSwitchStateIndeterminate:
		break;
	case FSSwitchStateOn:
		//[[NSUserDefaults standardUserDefaults] setObject:[NSNumber numberWithBool:YES] forKey:@"enabled" inDomain:nsDomainString];
		//CFNotificationCenterPostNotification(CFNotificationCenterGetDarwinNotifyCenter(), (CFStringRef)nsNotificationString, NULL, NULL, YES);
		[[AXSettings sharedInstance] setReduceWhitePointEnabled:true];
		break;
	case FSSwitchStateOff:
		//[[NSUserDefaults standardUserDefaults] setObject:[NSNumber numberWithBool:NO] forKey:@"enabled" inDomain:nsDomainString];
		//CFNotificationCenterPostNotification(CFNotificationCenterGetDarwinNotifyCenter(), (CFStringRef)nsNotificationString, NULL, NULL, YES);
		[[AXSettings sharedInstance] setReduceWhitePointEnabled:false];
		break;
	}
	return;
}

@end

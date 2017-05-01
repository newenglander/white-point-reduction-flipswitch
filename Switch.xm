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

@interface whitepointreductionSwitch : NSObject <FSSwitchDataSource>
@end

@implementation whitepointreductionSwitch

- (NSString *)titleForSwitchIdentifier:(NSString *)switchIdentifier {
	return @"White point reduction";
}

- (FSSwitchState)stateForSwitchIdentifier:(NSString *)switchIdentifier {
	return ([[AXSettings sharedInstance] reduceWhitePointEnabled]) ? FSSwitchStateOn : FSSwitchStateOff;
}

- (void)applyState:(FSSwitchState)newState forSwitchIdentifier:(NSString *)switchIdentifier {
	switch (newState) {
	case FSSwitchStateIndeterminate:
		break;
	case FSSwitchStateOn:
		[[AXSettings sharedInstance] setReduceWhitePointEnabled:true];
		break;
	case FSSwitchStateOff:
		[[AXSettings sharedInstance] setReduceWhitePointEnabled:false];
		break;
	}
	return;
}

@end

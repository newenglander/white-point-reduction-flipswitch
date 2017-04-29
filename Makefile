include $(THEOS)/makefiles/common.mk

BUNDLE_NAME = whitepointreduction
whitepointreduction_FILES = Switch.xm
whitepointreduction_FRAMEWORKS = UIKit
whitepointreduction_PRIVATE_FRAMEWORKS = AccessibilityUtilities
whitepointreduction_LIBRARIES = flipswitch
whitepointreduction_INSTALL_PATH = /Library/Switches

include $(THEOS_MAKE_PATH)/bundle.mk

internal-stage::
    #PreferenceLoader plist
#    if [ -f Preferences.plist ]; then mkdir -p $(THEOS_STAGING_DIR)/Library/PreferenceLoader/Preferences/whitepointreduction; cp Preferences.plist $(THEOS_STAGING_DIR)/Library/PreferenceLoader/Preferences/whitepointreduction/; fi

after-install::
	install.exec "killall -9 SpringBoard"

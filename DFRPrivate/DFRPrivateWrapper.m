//
//  DFRPrivateWrapper.m
//  DFRPrivate
//
//  Created by ddddxxx on 2018/12/3.
//  Copyright © 2018 ddddxxx. All rights reserved.
//

#import "DFRPrivateWrapper.h"
#import "DFRPrivateHeader.h"

@implementation NSTouchBarItem (DFRAccess)

- (void)addToSystemTray {
    [NSTouchBarItem addSystemTrayItem:self];
}

- (void)removeFromSystemTray {
    [NSTouchBarItem removeSystemTrayItem:self];
}

- (void)setControlStripPresence:(BOOL)present {
    DFRElementSetControlStripPresenceForIdentifier_(self.identifier, present);
}

@end

@implementation NSTouchBar (DFRAccess)

- (void)presentAsSystemModalForItem:(NSTouchBarItem *)item {
    [self presentAsSystemModalForItemIdentifier:item.identifier];
}

- (void)presentAsSystemModalForItemIdentifier:(NSTouchBarItemIdentifier)identifier {
    if (@available(macOS 10.14, *)) {
        [NSTouchBar presentSystemModalTouchBar:self
                      systemTrayItemIdentifier:identifier];
    } else {
        [NSTouchBar presentSystemModalFunctionBar:self
                         systemTrayItemIdentifier:identifier];
    }
}

- (void)dismissSystemModal {
    if (@available(macOS 10.14, *)) {
        [NSTouchBar dismissSystemModalTouchBar:self];
    } else {
        [NSTouchBar dismissSystemModalFunctionBar:self];
    }
}

- (void)minimizeSystemModal {
    if (@available(macOS 10.14, *)) {
        [NSTouchBar minimizeSystemModalTouchBar:self];
    } else {
        [NSTouchBar minimizeSystemModalFunctionBar:self];
    }
}

+ (void)setSystemModalShowsCloseBoxWhenFrontMost:(BOOL)show {
    DFRSystemModalShowsCloseBoxWhenFrontMost_(show);
}

@end

//
//  DFRPrivateWrapper.h
//  DFRPrivate
//
//  Created by ddddxxx on 2018/12/3.
//  Copyright © 2018 ddddxxx. All rights reserved.
//

#ifndef DFRPrivateWrapper_h
#define DFRPrivateWrapper_h

#import <AppKit/AppKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSTouchBarItem (DFRAccess)

- (void)addToSystemTray;

- (void)removeFromSystemTray;

/// Wrapper of `DFRElementSetControlStripPresenceForIdentifier`
+ (void)setControlStripPresence:(BOOL)present for:(NSTouchBarItemIdentifier)identifier;

- (void)setControlStripPresence:(BOOL)present;

@end

@interface NSTouchBar (DFRAccess)

- (void)presentAsSystemModalForItem:(NSTouchBarItem *)item;

- (void)presentAsSystemModalForItemIdentifier:(NSTouchBarItemIdentifier)identifier;

- (void)dismissSystemModal;

- (void)minimizeSystemModal;

/// Wrapper of DFRSystemModalShowsCloseBoxWhenFrontMost
+ (void)setSystemModalShowsCloseBoxWhenFrontMost:(BOOL)show;

@end

NS_ASSUME_NONNULL_END

#endif /* DFRPrivateWrapper_h */

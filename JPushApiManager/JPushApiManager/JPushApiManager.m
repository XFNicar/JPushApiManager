//
//  JPushApiManager.m
//  JPushApiManager
//
//  Created by YanYi on 2019/1/18.
//  Copyright © 2019 YanYi. All rights reserved.
//

#import "JPushApiManager.h"

@implementation JPushApiManager

static JPushApiManager *s_instance;

- (void)setJPushAppKey:(NSString *)appKey didFinishLaunchingWithOptions:(nonnull NSDictionary *)launchOptions {
    if ([[UIDevice currentDevice].systemVersion floatValue] >= 10.0) {
        JPUSHRegisterEntity * entity = [[JPUSHRegisterEntity alloc] init];
        entity.types = UNAuthorizationOptionAlert|UNAuthorizationOptionBadge|UNAuthorizationOptionSound;
        [JPUSHService registerForRemoteNotificationConfig:entity delegate:self.delegate];
    }
    else if ([[UIDevice currentDevice].systemVersion floatValue] >= 8.0) {
        //可以添加自定义categories
        [JPUSHService registerForRemoteNotificationTypes:(UIUserNotificationTypeBadge |
                                                          UIUserNotificationTypeSound |
                                                          UIUserNotificationTypeAlert)
                                              categories:nil];
    }
    else {
        //categories 必须为nil
        [JPUSHService registerForRemoteNotificationTypes:(UIRemoteNotificationTypeBadge | UIRemoteNotificationTypeSound | UIRemoteNotificationTypeAlert)
                                              categories:nil];
    }
    [JPUSHService setupWithOption:launchOptions appKey:appKey
                          channel:nil
                 apsForProduction:FALSE
            advertisingIdentifier:nil];
}


- (void)setTags:(NSSet<NSString *>*)tags alias:(NSString *)alias callbackSelector:(SEL)selector object:(id)object {
    [JPUSHService setTags:tags alias:alias callbackSelector:@selector(selector) object:object];
}


- (void)addTags:(NSSet<NSString *> *)tags
     completion:(JPUSHTagsOperationCompletion)completion
            seq:(NSInteger)seq {
    [JPUSHService addTags:tags completion:completion seq:seq];
}


- (void)setTags:(NSSet<NSString *> *)tags
     completion:(JPUSHTagsOperationCompletion)completion
            seq:(NSInteger)seq {
    [JPUSHService setTags:tags completion:completion seq:seq];
}


- (void)deleteTags:(NSSet<NSString *> *)tags
        completion:(JPUSHTagsOperationCompletion)completion
               seq:(NSInteger)seq {
    [JPUSHService deleteTags:tags completion:completion seq:seq];
}


- (void)cleanTags:(JPUSHTagsOperationCompletion)completion
              seq:(NSInteger)seq {
    [JPUSHService cleanTags:completion seq:seq];
}


- (void)getAllTags:(JPUSHTagsOperationCompletion)completion
               seq:(NSInteger)seq {
    [JPUSHService getAllTags:completion seq:seq];
}


- (void)validTag:(NSString *)tag
      completion:(JPUSHTagValidOperationCompletion)completion
             seq:(NSInteger)seq {
    [JPUSHService validTag:tag completion:completion seq:seq];
}

- (void)setAlias:(NSString *)alias
      completion:(JPUSHAliasOperationCompletion)completion
             seq:(NSInteger)seq {
    [JPUSHService setAlias:alias completion:completion seq:seq];
}


- (void)deleteAlias:(JPUSHAliasOperationCompletion)completion
                seq:(NSInteger)seq {
    [JPUSHService deleteAlias:completion seq:seq];
}


- (void)getAlias:(JPUSHAliasOperationCompletion)completion
             seq:(NSInteger)seq {
    [JPUSHService getAlias:completion seq:seq];
}



- (NSSet *)filterValidTags:(NSSet *)tags {
    return [JPUSHService filterValidTags:tags];
}




+ (instancetype)allocWithZone:(struct _NSZone *)zone {
    if (s_instance == nil) {
        static dispatch_once_t onceToken;
        dispatch_once(&onceToken, ^{
            s_instance = [super allocWithZone:zone];
        });
    }
    return s_instance;
}

- (instancetype)init {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        s_instance = [super init];
    });
    return s_instance;
}

+ (instancetype)sharedManager {
    return [[self alloc]init];
}

- (id)copy {
    return s_instance;
}

- (id)copyWithZone:(NSZone *)zone {
    return s_instance;
}

- (id)mutableCopy {
    return s_instance;
}

- (id)mutableCopyWithZone:(NSZone *)zone {
    return s_instance;
}

@end

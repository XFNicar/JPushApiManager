//
//  JPushApiManager.h
//  JPushApiManager
//
//  Created by YanYi on 2019/1/18.
//  Copyright © 2019 YanYi. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <JPUSHService.h>
#import <AdSupport/AdSupport.h>
#ifdef NSFoundationVersionNumber_iOS_9_x_Max
#import <UserNotifications/UserNotifications.h>
#endif
NS_ASSUME_NONNULL_BEGIN

@protocol JPushApiManagerDelegate <JPUSHRegisterDelegate>

@optional

@end

@interface JPushApiManager : NSObject

@property (nonatomic, weak ) id<JPushApiManagerDelegate> delegate;

+ (instancetype)sharedManager;



/**
 配置极光服务

 @param appKey appKey
 @param launchOptions launchOptions
 @param delegate delegate
 */
- (void)setJPushAppKey:(nonnull NSString *)appKey didFinishLaunchingWithOptions:(nonnull NSDictionary *)launchOptions delegate:(nonnull id<JPushApiManagerDelegate>)delegate;

// 该方法 JPush 3.0.6 版本已过期
- (void)setTags:(NSSet<NSString *> *)tags alias:(NSString *)alias callbackSelector:(SEL)selector object:(id)object;


/**
 增加tags
 
 @param tags 需要增加的tags集合
 @param completion 响应回调
 @param seq 请求序列号
 */
- (void)addTags:(NSSet<NSString *> *)tags
     completion:(JPUSHTagsOperationCompletion)completion
            seq:(NSInteger)seq;

/**
 覆盖tags
 调用该接口会覆盖用户所有的tags
 
 @param tags 需要设置的tags集合
 @param completion 响应回调
 @param seq 请求序列号
 */
- (void)setTags:(NSSet<NSString *> *)tags
     completion:(JPUSHTagsOperationCompletion)completion
            seq:(NSInteger)seq;

/**
 删除指定tags
 
 @param tags 需要删除的tags集合
 @param completion 响应回调
 @param seq 请求序列号
 */
- (void)deleteTags:(NSSet<NSString *> *)tags
        completion:(JPUSHTagsOperationCompletion)completion
               seq:(NSInteger)seq;

/**
 清空所有tags
 @param completion 响应回调
 @param seq 请求序列号
 */
- (void)cleanTags:(JPUSHTagsOperationCompletion)completion
              seq:(NSInteger)seq;

/**
 查询全部tags
 
 @param completion 响应回调，请在回调中获取查询结果
 @param seq 请求序列号
 */
- (void)getAllTags:(JPUSHTagsOperationCompletion)completion
               seq:(NSInteger)seq;

/**
 验证tag是否绑定
 
 @param completion 响应回调，回调中查看是否绑定
 @param seq 请求序列号
 */
- (void)validTag:(NSString *)tag
      completion:(JPUSHTagValidOperationCompletion)completion
             seq:(NSInteger)seq;

/**
 设置Alias
 
 @param alias 需要设置的alias
 @param completion 响应回调
 @param seq 请求序列号
 */
- (void)setAlias:(NSString *)alias
      completion:(JPUSHAliasOperationCompletion)completion
             seq:(NSInteger)seq;

/**
 删除alias
 
 @param completion 响应回调
 @param seq 请求序列号
 */
- (void)deleteAlias:(JPUSHAliasOperationCompletion)completion
                seq:(NSInteger)seq;

/**
 查询当前alias
 
 @param completion 响应回调
 @param seq 请求序列号
 */
- (void)getAlias:(JPUSHAliasOperationCompletion)completion
             seq:(NSInteger)seq;


/*!
 * @abstract 过滤掉无效的 tags
 *
 * @discussion 如果 tags 数量超过限制数量, 则返回靠前的有效的 tags.
 * 建议设置 tags 前用此接口校验. SDK 内部也会基于此接口来做过滤.
 */
- (NSSet *)filterValidTags:(NSSet *)tags;




@end

NS_ASSUME_NONNULL_END

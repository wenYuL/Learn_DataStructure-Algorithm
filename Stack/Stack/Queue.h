//
//  Queue.h
//  Stack
//
//  Created by 刘文裕 on 2019/4/14.
//  Copyright © 2019 wenYuL. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

typedef void(^queueEnum)(id object);

@interface Queue : NSObject

//入队、出队
- (void)enQueueObject:(id)object;
- (void)deQueueObject;

//队首元素
- (id)queueHead;
//队满、队空
- (BOOL)isEmpty;
- (BOOL)isFull;
//遍历队列元素
- (void)enumerateQueueObjectsFromHeader:(queueEnum)block;
- (void)enumerateQueueObjectsFromFooter:(queueEnum)block;


@end

NS_ASSUME_NONNULL_END

//
//  Queue.m
//  Stack
//
//  Created by 刘文裕 on 2019/4/14.
//  Copyright © 2019 wenYuL. All rights reserved.
//

#import "Queue.h"

static const NSInteger kDefaultQueueCount = 4;

@interface Queue ()

@property(nonatomic, strong)NSMutableArray *queueArray;
@property(nonatomic, assign)NSInteger queueCount;

@end

@implementation Queue

- (instancetype)init {
    self = [super init];
    if (self) {
        _queueArray = [[NSMutableArray alloc]initWithCapacity:kDefaultQueueCount];
        _queueCount = kDefaultQueueCount;
    }
    return self;
}


- (void)enQueueObject:(id)object {
    if (object == nil) {
        NSAssert(object != nil, @"The object can not be nil !");
        return;
    }
    
    if ([self isFull] && self.queueCount) {
        self.queueCount *= 2;
        NSMutableArray *newQueueArray = [[NSMutableArray alloc]initWithCapacity:self.queueCount];
        [newQueueArray addObjectsFromArray:self.queueArray];
        self.queueArray = newQueueArray;
    }
    
    [self.queueArray addObject:object];
    
}

- (void)deQueueObject {
    [self.queueArray removeObjectAtIndex:0];
}

//队首元素
- (id)queueHead {
    return self.queueArray.firstObject;
}
//队满、队空
- (BOOL)isEmpty {
    return (NSInteger)self.queueArray.count == 0;
}
- (BOOL)isFull {
    return self.queueArray.count == self.queueCount;
}
//遍历队列元素
- (void)enumerateQueueObjectsFromHeader:(queueEnum)block {
    [self.queueArray enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        block?block(obj):nil;
    }];
}
- (void)enumerateQueueObjectsFromFooter:(queueEnum)block {
    [self.queueArray enumerateObjectsWithOptions:NSEnumerationReverse usingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        block?block(obj):nil;
    }];
}

@end

//
//  Stack.m
//  Stack
//
//  Created by 刘文裕 on 2019/4/13.
//  Copyright © 2019 wenYuL. All rights reserved.
//

#import "Stack.h"

static const int kDefaultStackCounts = 4;

@interface Stack()

@property(nonatomic, strong)NSMutableArray *stackArray;
@property(nonatomic, assign)NSInteger maxStackNumebr;

@end

@implementation Stack

- (instancetype)init {
    self = [super init];
    if (self) {
        _stackArray = [[NSMutableArray alloc]initWithCapacity:kDefaultStackCounts];
        _maxStackNumebr = kDefaultStackCounts;
        
    }
    return self;
}

- (instancetype)initWithSize:(NSInteger)size {
    self = [super init];
    if (self) {
        _stackArray = [[NSMutableArray alloc]initWithCapacity:size];
        _maxStackNumebr = size;
    }
    return self;
}


- (void)pushObject:(id)object {
    //判空
    if (object == nil) {
        NSAssert(object != nil, @"The object can't be nil!");
        return;
    }
   //栈满时，扩大内存空间
    if ([self isFull] && self.maxStackNumebr) {
        self.maxStackNumebr *= 2;
        NSMutableArray *newStackArray = [[NSMutableArray alloc]initWithCapacity:self.maxStackNumebr];
        [newStackArray addObjectsFromArray:self.stackArray];
        self.stackArray = newStackArray;
    }
    
    [self.stackArray addObject:object];
    
}
- (void)popObject {
    if ([self isEmpty]) {
        NSAssert([self isEmpty], @"The stack is empty!");
        return;
    }
    [self.stackArray removeLastObject];
}


- (id)lastObject {
    if ([self isEmpty]) {
        NSAssert([self isEmpty], @"The stack is empty!");
        return nil;
    }
    return self.stackArray.lastObject;
}

- (BOOL)isEmpty {
    return [self sizeOfStack] == 0;
}
- (BOOL)isFull {
    return ([self sizeOfStack] == self.maxStackNumebr);
}


- (void)enumerateStackObjectsFromBottom:(stackEnum)block {
    //NSEnumerationConcurrent 为大概按照顺序遍历，遍历时为CPU多核快速遍历，不能保证顺序
    /*
    [self.stackArray enumerateObjectsWithOptions:NSEnumerationConcurrent usingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        block?block(obj):nil;
    }];
    */
    [self.stackArray enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        block?block(obj):nil;
    }];
}
- (void)enumerateStackObjectsFromTop:(stackEnum)block {
    [self.stackArray enumerateObjectsWithOptions:NSEnumerationReverse usingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        block?block(obj):nil;
    }];
}

- (NSInteger)sizeOfStack {
    return (NSInteger)self.stackArray.count;
}

@end

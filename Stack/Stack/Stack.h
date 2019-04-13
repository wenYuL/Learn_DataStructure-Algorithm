//
//  Stack.h
//  Stack
//
//  Created by 刘文裕 on 2019/4/13.
//  Copyright © 2019 wenYuL. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

typedef void(^stackEnum)(id object);

@interface Stack : NSObject

- (instancetype)initWithSize:(NSInteger)size;

//入栈、出栈
- (void)pushObject:(id)object;
- (void)popObject;
//栈顶元素
- (id)lastObject;
//栈空、栈满
- (BOOL)isEmpty;
- (BOOL)isFull;
//遍历栈元素
- (void)enumerateStackObjectsFromBottom:(stackEnum)block;
- (void)enumerateStackObjectsFromTop:(stackEnum)block;

@end

NS_ASSUME_NONNULL_END

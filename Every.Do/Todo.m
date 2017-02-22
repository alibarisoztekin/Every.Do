//
//  Todo.m
//  Every.Do
//
//  Created by Ali Barış Öztekin on 2017-02-21.
//  Copyright © 2017 Ali Barış Öztekin. All rights reserved.
//

#import "Todo.h"

@implementation Todo

- (instancetype)initWithTitle:(NSString*)title description:(NSString*) description priorityNumber:(NSInteger) priority
{
    self = [super init];
    if (self) {
        _todoTitle = title;
        _todoDescription = description;
        _priority = priority;
        _isCompleted = NO;
        
        
    }
    return self;
}
@end

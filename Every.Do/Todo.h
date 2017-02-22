//
//  Todo.h
//  Every.Do
//
//  Created by Ali Barış Öztekin on 2017-02-21.
//  Copyright © 2017 Ali Barış Öztekin. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface Todo : NSObject

@property (nonatomic,strong) NSString* todoTitle;
@property (nonatomic,strong) NSString* todoDescription;
@property (nonatomic,assign) NSInteger priority;
@property (nonatomic,assign) BOOL isCompleted;


- (instancetype)initWithTitle:(NSString*)title description:(NSString*) description priorityNumber:(NSInteger) priority;

@end

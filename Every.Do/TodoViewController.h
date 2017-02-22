//
//  TodoViewController.h
//  Every.Do
//
//  Created by Ali Barış Öztekin on 2017-02-21.
//  Copyright © 2017 Ali Barış Öztekin. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Todo.h"

@protocol SaveTodoDelegate <NSObject>

-(void) saveNewTodo:(Todo*)newTodo;


@end

@interface TodoViewController : UIViewController

@property (nonatomic,weak) id <SaveTodoDelegate> saveDelegate;


@end

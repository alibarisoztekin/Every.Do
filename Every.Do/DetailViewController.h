//
//  DetailViewController.h
//  Every.Do
//
//  Created by Ali Barış Öztekin on 2017-02-21.
//  Copyright © 2017 Ali Barış Öztekin. All rights reserved.
//

#import <UIKit/UIKit.h>

@class Todo;

@interface DetailViewController : UIViewController

@property (strong, nonatomic) Todo* detailItem;

@end


//
//  DetailViewController.m
//  Every.Do
//
//  Created by Ali Barış Öztekin on 2017-02-21.
//  Copyright © 2017 Ali Barış Öztekin. All rights reserved.
//

#import "DetailViewController.h"
#import "Todo.h"

@interface DetailViewController ()
@property (weak, nonatomic) IBOutlet UILabel *detailTitle;
@property (weak, nonatomic) IBOutlet UILabel *priorityNumber;
@property (weak, nonatomic) IBOutlet UITextView *detailDescription;

@end

@implementation DetailViewController

#pragma mark - Managing the detail item

- (void)setDetailItem:(id)newDetailItem {
    if (_detailItem != newDetailItem) {
        _detailItem = newDetailItem;
            
        // Update the view.
        [self configureView];
    }
}


- (void)configureView {
    // Update the user interface for the detail item.
    if (self.detailItem) {
        self.detailTitle.text = self.detailItem.todoTitle;
        self.priorityNumber.text = [NSString stringWithFormat:@"%ld", self.detailItem.priority];
        self.detailDescription.text = self.detailItem.todoDescription;
    }
}


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self configureView];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end

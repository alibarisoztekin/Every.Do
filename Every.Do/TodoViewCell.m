//
//  TodoViewCell.m
//  Every.Do
//
//  Created by Ali Barış Öztekin on 2017-02-21.
//  Copyright © 2017 Ali Barış Öztekin. All rights reserved.
//

#import "TodoViewCell.h"

@interface TodoViewCell()

@property (weak, nonatomic) IBOutlet UILabel *todoTitle;
@property (weak, nonatomic) IBOutlet UILabel *todoPriority;
@property (weak, nonatomic) IBOutlet UILabel *todoDescription;
@property (weak, nonatomic) UISwipeGestureRecognizer* swipeRight;



@end

@implementation TodoViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

-(void)setTodo:(Todo *)todo{
    
    _todo = todo;
    [self configureCell];
}

-(void)configureCell{
    self.todoTitle.text = self.todo.todoTitle;
    self.todoPriority.text = [NSString stringWithFormat:@"%ld",self.todo.priority];
    self.todoDescription.text = self.todo.todoDescription;
    if(self.todo.isCompleted)
    {
        self.todoPriority.text = @"Completed";
        self.contentView.alpha = 0.2;
    }
//    switch (self.todo.priority) {
//        case 1:
//            self.backgroundColor = [UIColor redColor;
//            break;
//            
//        default:
//            break;
//    }
    
}
@end

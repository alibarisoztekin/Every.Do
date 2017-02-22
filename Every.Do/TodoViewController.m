//
//  TodoViewController.m
//  Every.Do
//
//  Created by Ali Barış Öztekin on 2017-02-21.
//  Copyright © 2017 Ali Barış Öztekin. All rights reserved.
//

#import "TodoViewController.h"

@interface TodoViewController ()
@property (weak, nonatomic) IBOutlet UITextField *todoTitleTextField;
@property (weak, nonatomic) IBOutlet UITextField *priorityTextField;
@property (weak, nonatomic) IBOutlet UITextField *descriptionTextField;

@end

@implementation TodoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)saveTapped:(id)sender {
    
    Todo* newTodo = [[Todo alloc] initWithTitle:self.todoTitleTextField.text description: self.descriptionTextField.text priorityNumber:[self.priorityTextField.text integerValue]];
    [self.saveDelegate saveNewTodo:newTodo];
    [self dismissViewControllerAnimated:YES completion:nil];
    
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end

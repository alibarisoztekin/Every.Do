//
//  MasterViewController.m
//  Every.Do
//
//  Created by Ali Barış Öztekin on 2017-02-21.
//  Copyright © 2017 Ali Barış Öztekin. All rights reserved.
//

#import "MasterViewController.h"
#import "DetailViewController.h"
#import "Todo.h"
#import "TodoViewCell.h"
#import "TodoViewController.h"

@interface MasterViewController () <SaveTodoDelegate>

@property NSMutableArray *todoDataSource;
@property UISwipeGestureRecognizer* swipeRight;

@end

@implementation MasterViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.navigationItem.leftBarButtonItem = self.editButtonItem;

    UIBarButtonItem *addButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(insertNewObject:)];
    self.navigationItem.rightBarButtonItem = addButton;
    
    self.todoDataSource = [NSMutableArray arrayWithArray:[self setupTodos]];
    self.swipeRight = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(swipedRight:)];
    [self.tableView addGestureRecognizer:self.swipeRight];
}


- (void)viewWillAppear:(BOOL)animated {
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (void)insertNewObject:(id)sender {
    if (!self.todoDataSource) {
        self.todoDataSource = [[NSMutableArray alloc] init];
    }
    [self performSegueWithIdentifier:@"addTodo" sender:sender];
   }



#pragma mark - Segues

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([[segue identifier] isEqualToString:@"showDetail"]) {
        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
        Todo *todo = self.todoDataSource[indexPath.row];
        DetailViewController *controller = (DetailViewController *)[segue destinationViewController];
        [controller setDetailItem:todo];
    }
    else if([[segue identifier] isEqualToString:@"addTodo"]){
        TodoViewController* todoVC =  segue.destinationViewController;
        todoVC.saveDelegate = self;
    }
}


#pragma mark - Table View

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.todoDataSource.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    TodoViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"TodoCell" forIndexPath:indexPath];

    cell.todo = self.todoDataSource[indexPath.row];
    return cell;
}


- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}


- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        [self.todoDataSource removeObjectAtIndex:indexPath.row];
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view.
//        TodoViewCell* newCell = [TodoViewCell new];
//        newCell.todo = self.todoDataSource[indexPath.row];
//        
//        [tableView beginUpdates];
//        [tableView insertRowsAtIndexPaths: withRowAnimation:UITableViewRowAnimation];
//        [tableView endUpdates];
//    }
    }
}

-(NSArray<Todo*>*) setupTodos
{
    
    Todo *toDo1 = [[Todo alloc] initWithTitle:@"Learn everything" description:@"Start learning the origins of the universe and such" priorityNumber:3];
    Todo *toDo2 = [[Todo alloc] initWithTitle:@"Survive 6 more week" description:@"Ask your local doctor what sleep deprivation can lead to" priorityNumber:0];
    Todo *toDo3 = [[Todo alloc] initWithTitle:@"Perfect your coffee brewing skillz" description:@"Youtube how to brew the best coffee in the world, always works" priorityNumber:5];
    
    return @[toDo1,
             toDo2,
             toDo3];
    
}



-(void) saveNewTodo:(Todo *)newTodo
{
    [self.todoDataSource insertObject:newTodo atIndex:0];
    NSIndexPath *indexPath = [NSIndexPath indexPathForRow:0 inSection:0];
    [self.tableView insertRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationAutomatic];

}
- (void)swipedRight:(UISwipeGestureRecognizer *)sender {
    
    CGPoint location = [sender locationInView:self.tableView];
    NSInteger swipedRow = (NSInteger)(location.y / self.tableView.rowHeight);
    NSLog(@"swiped row %ld", swipedRow );
    NSIndexPath* indexPath = [NSIndexPath indexPathForRow:swipedRow inSection:0];

    TodoViewCell* cell = [self.tableView cellForRowAtIndexPath:indexPath];
    
    Todo* cellTodo = cell.todo;
    
    cellTodo.isCompleted =YES;
    
    [self.todoDataSource removeObject:cellTodo];
    [self.todoDataSource addObject:cellTodo];
    cell.todo = cellTodo;
    
    [self.tableView beginUpdates];
    [self.tableView moveRowAtIndexPath:indexPath toIndexPath:[NSIndexPath indexPathForRow:self.todoDataSource.count-1 inSection:0]];
    [self.tableView endUpdates];
}
@end

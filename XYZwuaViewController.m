//
//  XYZwuaViewController.m
//  wu
//
//  Created by wuzheng on 15-3-6.
//  Copyright (c) 2015年 wuzheng. All rights reserved.
//

#import "XYZwuaViewController.h"
#import "XYZwu.h"
#import "XYZWUViewController.h"

@interface XYZwuaViewController ()
@property NSMutableArray *ToDoItems;
@end

@implementation XYZwuaViewController


- (void)loadInitialData {
    XYZwu *item1=[[XYZwu alloc] init ];
    item1.itemName=@"buy milk";
    [self.ToDoItems addObject:item1];
}


- (IBAction)unwindToList:(UIStoryboardSegue *)segue
{XYZWUViewController*source =[segue sourceViewController];
    XYZwuaViewController*item =source.toDoItem;
    if (item!=nil){
        [self.ToDoItems addObject:item];
        [self.tableView reloadData];
    }
    
}
-(IBAction)unwindToList2:(UIStoryboardSegue *)segue
{
    [self.tableView reloadData];
 
}

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.ToDoItems=[[NSMutableArray alloc ]init];
    [self loadInitialData];

    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
#warning Potentially incomplete method implementation.
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
#warning Incomplete method implementation.
    // Return the number of rows in the section.
    return [self.ToDoItems count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"ListPrototypeCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    XYZwu*ToDoItem =[self .ToDoItems objectAtIndex:indexPath.row];
    cell.textLabel.text=ToDoItem.itemName;
    if (ToDoItem.completed){
        cell.accessoryType=UITableViewCellAccessoryCheckmark;
        }else{
                    cell.accessoryType=UITableViewCellAccessoryNone;
                             }
    
   // Configure the cell...
    
    
    return cell;
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }   
    else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a story board-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}

 */
#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath

{

   [tableView deselectRowAtIndexPath:indexPath animated:NO];
   XYZwu*tappedItem=[self.ToDoItems objectAtIndex:indexPath.row];
   tappedItem.completed =!tappedItem.completed;
   [tableView reloadRowsAtIndexPaths:@[indexPath]
withRowAnimation:UITableViewRowAnimationNone];
}
@end

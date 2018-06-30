//
//  SKAPickerView.m
//  SKAPickerViewExample
//
//  Created by Alok Singh on 13/03/18.
//  Copyright © 2018 Alok Singh. All rights reserved.

#import "SKAPickerView.h"

@implementation SKAPickerView
@synthesize arrRecords,delegate;

-(id)initWithFrame:(CGRect)frame withNSArray:(NSArray *)arrValues{
    
    self = [super initWithFrame:frame];
    if (self) {
        self.arrRecords = arrValues;
    }
    return self;
}


-(void)showPicker {
    
    self.userInteractionEnabled = TRUE;
    self.backgroundColor = [UIColor clearColor];
    
    pickerView_new = [[UIPickerView alloc] initWithFrame:CGRectMake(_passRect.origin.x-_passRect.origin.x, _passRect.origin.y-_passRect.origin.y, _passRect.size.width, _passRect.size.height)];
    
    //[picketView addTarget:self action:@selector(valueChanged:) forControlEvents:UIControlEventValueChanged];
    
    picketToolbar = [[UIToolbar alloc] initWithFrame:CGRectMake(_passRect.origin.x-_passRect.origin.x, _passRect.origin.y-_passRect.origin.y, _passRect.size.width, 47)];
    pickerView_new.showsSelectionIndicator = YES;
    pickerView_new.delegate = self;
    pickerView_new.dataSource = self;
    pickerView_new.backgroundColor=[UIColor groupTableViewBackgroundColor];
    
    //picketToolbar.barStyle = UIBarStyleDefault;
    
    picketToolbar.barTintColor=[UIColor lightGrayColor];
    
    [picketToolbar sizeToFit];
    
    
    searchBar_new = [[UISearchBar alloc] initWithFrame:CGRectMake(15, 7, 320, 31)];
    searchBar_new.tag = 1;
    //searchBar_new.barStyle = UIBarStyleBlackTranslucent;
    
    
    
    searchBar_new.backgroundColor = [UIColor clearColor];
    searchBar_new.delegate = self;
    searchBar_new.userInteractionEnabled = TRUE;
    
    //searchBar_new.barTintColor=[UIColor colorWithRed:35.0/255.0 green:141.0/255.0 blue:190.0/255.0 alpha:1.0];
    
    
    UIBarButtonItem *flexible = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:nil action:nil];
    
    UIBarButtonItem *btnDone = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemDone target:self action:@selector(btnDoneClick)];
    
    [btnDone setTitleTextAttributes:
     [NSDictionary dictionaryWithObjectsAndKeys:
      [UIColor whiteColor], NSForegroundColorAttributeName,nil]
                          forState:UIControlStateNormal];
    
    // [picketToolbar addSubview:txtSearch];
    NSArray *arrBarButtoniTems = [[NSArray alloc] initWithObjects:flexible,btnDone, nil];
    [picketToolbar setItems:arrBarButtoniTems];
    [self addSubview:pickerView_new];
    [self addSubview:picketToolbar];
    [picketToolbar addSubview:searchBar_new];
 }

// returns the number of 'columns' to display.
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView{
    
    return 1;
}

// returns the # of rows in each component..
- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    if (searchEnabled)
    {
        return self.searchResult.count;
    }
    else{
        return self.arrRecords.count;
    }
 }

- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component{
    
    if (searchEnabled)
    {
        return [self.searchResult objectAtIndex:row];
    }
    else
    {
        return [self.arrRecords objectAtIndex:row];
    }
    
 }


- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component{
    
    if (searchEnabled) {
        
        [self.delegate didSelectItem:[self.searchResult objectAtIndex:row]];
        refer_row=row;
    }else{
        
        [self.delegate didSelectItem:[arrRecords objectAtIndex:row]];
        refer_row=row;
    }
    
     refer_row=row;
 }
//git clone git@github.com:/myrepo.git
-(void)btnDoneClick{
    
    if (searchEnabled) {
        
        [self.delegate didSelectItem:[self.searchResult objectAtIndex:refer_row]];
    }
    else
    {
        [self.delegate didSelectItem:[arrRecords objectAtIndex:refer_row]];
    }
    
    picketToolbar.hidden=YES;
    pickerView_new.hidden=YES;
}

#pragma mark - Search delegate methods

- (void)filterContentForSearchText:(NSString*)searchText{
    NSPredicate *resultPredicate = [NSPredicate
                                    predicateWithFormat:@"SELF CONTAINS[cd] %@",
                                    searchText];
    _searchResult = [arrRecords filteredArrayUsingPredicate:resultPredicate];
    
    [pickerView_new reloadAllComponents];
}

- (void)searchBar:(UISearchBar *)searchBar textDidChange:(NSString *)searchText{
    if (searchBar.text.length == 0) {
        searchEnabled = NO;
        [pickerView_new reloadAllComponents];
    }
    else {
        searchEnabled = YES;
        [self filterContentForSearchText:searchBar.text];
        
        if (_searchResult.count==0) {
            _lblHeader=[[UILabel alloc] initWithFrame:CGRectMake(0, 0, pickerView_new.bounds.size.width, pickerView_new.bounds.size.height)];
            _lblHeader.text = @"No Result Found";
            _lblHeader.textColor = [UIColor blackColor];
            _lblHeader.textAlignment = NSTextAlignmentCenter;
            pickerView_new.showsSelectionIndicator = _lblHeader.text;
            //pickerView.separatorStyle = UITableViewCellSeparatorStyleNone;
            [pickerView_new reloadAllComponents];
            _lblHeader.hidden=NO;
        }
        else
        {
            _lblHeader.hidden=YES;
        }
    }
    
    refer_row=0;
 }

-(void)searchBarSearchButtonClicked:(UISearchBar *)searchBar{
    [searchBar resignFirstResponder];
    searchEnabled = YES;
    [self filterContentForSearchText:searchBar.text];
}

-(void)searchBarCancelButtonClicked:(UISearchBar *)searchBar{
    [searchBar resignFirstResponder];
    [searchBar setText:@""];
    searchEnabled = NO;
    [pickerView_new reloadAllComponents];
}

@end

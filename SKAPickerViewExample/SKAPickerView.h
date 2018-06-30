//
//  SKAPickerView.h
//  SKAPickerViewExample
//
//  Created by Alok Singh on 13/03/18.
//  Copyright © 2018 Alok Singh. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol SKAPickerViewDelegate <NSObject>

-(void)didSelectItem:(NSString *)item;

@end


@interface SKAPickerView : UIView<UIPickerViewDelegate,UIPickerViewDataSource,UISearchBarDelegate>
{
    UIPickerView *pickerView_new;
    UIToolbar *picketToolbar;
    UISearchBar *searchBar_new;
    NSArray *arrRecords;
    id <SKAPickerViewDelegate> delegate;
    NSUInteger refer_row;
    BOOL searchEnabled;
 }

@property (nonatomic, strong) NSMutableArray *searchResult;
@property (nonatomic, assign) CGRect passRect;
@property (nonatomic, retain) NSArray *arrRecords;
@property (nonatomic, retain) id <SKAPickerViewDelegate> delegate;
@property (nonatomic,strong) UILabel *lblHeader;

-(id)initWithFrame:(CGRect)frame withNSArray:(NSArray *)arrValues;

-(void)showPicker;

@end

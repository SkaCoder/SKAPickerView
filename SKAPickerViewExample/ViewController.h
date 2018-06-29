//
//  ViewController.h
//  SKAPickerViewExample
//
//  Created by Alok Singh on 13/03/18.
//  Copyright © 2018 Alok Singh. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SKAPickerView.h"

@interface ViewController : UIViewController<SKAPickerViewDelegate>

{
    
    NSArray *nameArray;
    UITableView *newtable;
    IBOutlet UIButton *main_btn;
    IBOutlet UILabel *main_label;
    SKAPickerView *objYHCPickerView;
}


@end


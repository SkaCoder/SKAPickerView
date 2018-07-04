# SKAPickerView
picker view with search bar

###Installation

•	import in your project the folder "SKAPickerView"

###How to use

•	in your code import SKAPickerView.h in both interface(.h) and implementation file(.m)

   #import "SKAPickerView.h"

•	implement delegate in your class

    @interface className : UIViewController<SKAPickerViewViewDelegate>

•	add delegate methods

     -(void)didSelectItem:(NSString *)item; //to select picker view cell

•	in your code add follow code when you need show the SKATableView

    SKAPickerView *objYHCPickerView = [[SKAPickerView alloc] initWithFrame:CGRectMake(0, 467, 414, 270) withNSArray:nameArray];
    
    objYHCPickerView.delegate = self;
    
    CGRect newFrame = objYHCPickerView.frame;
    
    objYHCPickerView.passRect=newFrame;
    
    [self.view addSubview:objYHCPickerView];
    
    [objYHCPickerView showPicker];

####feedback?

•	mail: sachinandre06@gmail.com

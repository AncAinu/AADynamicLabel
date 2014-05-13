//
//  AADynamicLabel.h
//  AADynamicLabel
//
//  Created by Tancrede Chazallet on 22/01/14.
//  Copyright (c) 2014 AncAinu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AADynamicLabel : UILabel

- (void)clearText;
- (void)addText:(NSString *)text;
- (void)addText:(NSString *)text withFont:(UIFont *)font;
- (void)addText:(NSString *)text color:(UIColor *)color;
- (void)addText:(NSString *)text withFont:(UIFont *)font color:(UIColor *)color;

@end

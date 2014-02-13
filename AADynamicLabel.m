//
//  AADynamicLabel.m
//  Iswigo
//
//  Created by Tancrede Chazallet on 22/01/14.
//  Copyright (c) 2014 VIGICORP. All rights reserved.
//

#import "AADynamicLabel.h"

@interface AADynamicLabel ()

@property (nonatomic, strong) NSMutableArray *_texts;

@property (nonatomic, strong) UIFont         *_font;
@property (nonatomic, strong) UIColor        *_textColor;

@end

@implementation AADynamicLabel

#pragma mark INIT
- (id)init {
	if (self = [super init]) {
		__texts = [NSMutableArray new];
		__font = [UIFont systemFontOfSize:[UIFont systemFontSize]];
		__textColor = [UIColor blackColor];
		
		self.backgroundColor = [UIColor clearColor];
	}
	return self;
}

- (id)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
		
    }
    return self;
}

#pragma mark SETTER
- (void)setFont:(UIFont *)font {
	__font = font;
	[super setFont:font];
}

- (void)setTextColor:(UIColor *)textColor {
	__textColor = textColor;
	[super setTextColor:textColor];
}

#pragma mark METHODS
- (void)clearText {
	[__texts removeAllObjects];
	[self resetAttributes];
}

- (void)addText:(NSString *)text {
	[self addText:text withFont:nil color:nil];
}

- (void)addText:(NSString *)text withFont:(UIFont *)font {
	[self addText:text withFont:font color:nil];
}

- (void)addText:(NSString *)text color:(UIColor *)color {
	[self addText:text withFont:nil color:color];
}

- (void)addText:(NSString *)text withFont:(UIFont *)font color:(UIColor *)color{
	NSMutableString *mutableString = [NSMutableString new];
	for (NSString *string in [__texts valueForKey:@"text"]) {
		[mutableString appendString:string];
	}
	
	[__texts addObject:@{@"text":text,
						 @"font":font?font:[NSNull null],
						 @"color":color?color:[NSNull null],
						 @"location":@(mutableString.length)}];
	
	[self resetAttributes];
}

- (void)resetAttributes {
	// We set the text
	NSMutableString *mutableString = [NSMutableString new];
	for (NSString *string in [__texts valueForKey:@"text"]) {
		[mutableString appendString:string];
	}
	
	NSMutableAttributedString *attributedText =	[[NSMutableAttributedString alloc] initWithString:mutableString.copy
																					   attributes:@{NSFontAttributeName: __font,
																									NSForegroundColorAttributeName: __textColor}];
	for (NSDictionary *attributs in __texts) {
		UIFont  *font = [attributs valueForKey:@"font"] != [NSNull null] ? [attributs valueForKey:@"font"] : __font;
		UIColor *foregroundColor = [attributs valueForKey:@"color"] != [NSNull null] ? [attributs valueForKey:@"color"] : __textColor;
		
		[attributedText setAttributes:@{NSFontAttributeName: font,
										NSForegroundColorAttributeName: foregroundColor}
								range:NSMakeRange([[attributs valueForKey:@"location"] integerValue],
												  [[attributs valueForKey:@"text"] length])];
	}
	
    // Set it in our UILabel and we are done!
    [self setAttributedText:attributedText];
}

@end

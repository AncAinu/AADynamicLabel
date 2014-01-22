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

@end

@implementation AADynamicLabel

#pragma mark INIT
- (id)init {
	if (self = [super init]) {
		__texts = [NSMutableArray new];
		
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

#pragma mark METHODS
- (void)addText:(NSString *)text withFont:(UIFont *)font {
	[__texts addObject:@{@"text":text, @"font":font}];
	
	[self resetAttributes];
}

- (void)addText:(NSString *)text withFont:(UIFont *)font color:(UIColor *)color{
	NSMutableString *mutableString = [NSMutableString new];
	for (NSString *string in [__texts valueForKey:@"text"]) {
		[mutableString appendString:string];
	}
	
	[__texts addObject:@{@"text":text,
						 NSFontAttributeName:font?font:[NSNull null],
						 NSForegroundColorAttributeName:color?color:[NSNull null],
						 @"location":@(mutableString.length)}];
	
	[self resetAttributes];
}

- (void)resetAttributes {
	// We set the text
	NSMutableString *mutableString = [NSMutableString new];
	for (NSString *string in [__texts valueForKey:@"text"]) {
		[mutableString appendString:string];
	}
	
	NSMutableAttributedString *attributedText =	[[NSMutableAttributedString alloc] initWithString:mutableString.copy];
	for (NSDictionary *attributs in __texts) {
		[attributedText setAttributes:attributs range:NSMakeRange([[attributs valueForKey:@"location"] integerValue], [[attributs valueForKey:@"text"] length])];
	}
	
    // Set it in our UILabel and we are done!
    [self setAttributedText:attributedText];
}

@end

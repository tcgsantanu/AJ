//
//  CustomLabel.h
//  rointe
//
//  Created by Juanjo Guevara on 22/5/15.
//  Copyright (c) 2015 Juanjo Guevara. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_OPTIONS(NSInteger, ajMaterialTextfieldColorOption) {
    materialTextfieldColorOptionblackColor,
    materialTextfieldColorOptiondarkGrayColor,
    materialTextfieldColorOptionlightGrayColor,
    materialTextfieldColorOptionwhiteColor,
    materialTextfieldColorOptiongrayColor,
    materialTextfieldColorOptionredColor,
    materialTextfieldColorOptiongreenColor,
    materialTextfieldColorOptionblueColor,
    materialTextfieldColorOptioncyanColor,
    materialTextfieldColorOptionyellowColor,
    materialTextfieldColorOptionmagentaColor,
    materialTextfieldColorOptionorangeColor,
    materialTextfieldColorOptionpurpleColor,
    materialTextfieldColorOptionbrownColor,
    materialTextfieldColorOptionclearColor,
    materialTextfieldColorOptionDefaultColor = materialTextfieldColorOptionblackColor
};

typedef NS_ENUM(NSInteger, ajTextAutocorrectionType) {
    ajTextAutocorrectionTypeDefault,
    ajTextAutocorrectionTypeNo,
    ajTextAutocorrectionTypeYes,
};

@interface AJMaterialTextfield : UITextField

/**
 *  Attributes that are optionally applied to the placeholder text. Use this to style the placeholder differently than the regular text. Default is nil (meaning no additional styling will be applied to the placeholder. If nil, the placeholder will be styled the same as the textfield except its color will be a 0.8 alpha version of the textfield text color.
 */
@property (nonatomic, strong, nullable) NSDictionary *placeholderAttributes;

/**
 *  The color of the line when there is an error.
 */
@property (nonatomic) ajMaterialTextfieldColorOption errorColor;

@property (nonatomic, assign) BOOL showClearButtonOption;


/**
 *  The Tag Of UITextFiled
 */
@property (nonatomic) int textFiledTag;

/**
 *  The color of the line when the textfield is active.  Default is [UIColor lightGrayColor];
 */
@property (nonatomic, strong, nullable) UIColor *lineColor;


/**
 *  Shows an error - makes the line the error color.
 */
- (void)showError;

/**
 *  Hides the error. Returns the line to normal.
 */
- (void)hideError;


/**
 *  Enables or disables the material placeholder (the placeholder jumping above the textfield on text entry). Default is YES.
 */
@property (nonatomic) IBInspectable BOOL enableMaterialPlaceHolder;


@end

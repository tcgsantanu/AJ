//
//  CustomLabel.m
//  rointe
//
//  Created by Juanjo Guevara on 22/5/15.
//  Copyright (c) 2015 Juanjo Guevara. All rights reserved.
//

#import "AJMaterialTextfield.h"

@interface AJMaterialTextfield ()
{
    UIView *line;
    UILabel *placeHolderLabel;
    BOOL showError;
}
@end

@implementation AJMaterialTextfield
@synthesize errorColor;

#define DEFAULT_ALPHA_LINE 0.8

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self commonInit];
    }
    return self;
}

- (void)awakeFromNib
{
    [super awakeFromNib];
    [self commonInit];
    
}

- (void)commonInit
{
    _lineColor = [UIColor lightGrayColor];
    line = [[UIView alloc] init];
    line.backgroundColor = [_lineColor colorWithAlphaComponent:DEFAULT_ALPHA_LINE];
    [self addSubview:line];
    self.tag = _textFiledTag;
    self.clipsToBounds = NO;
    [self iniitWithTextFieldCrossButton];
    
    [self setEnableMaterialPlaceHolder:YES];
    [self addTarget:self action:@selector(textFieldDidChange:) forControlEvents:UIControlEventEditingChanged];
}

-(void)iniitWithTextFieldCrossButton {
    
    UIButton *clearButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [clearButton setImage:[UIImage imageNamed:@"cross-gray"] forState:UIControlStateNormal];
    [clearButton setFrame:CGRectMake(0, 0, 14, 14)];
    [clearButton.layer setOpacity:0.7];
    [clearButton addTarget:self action:@selector(crossImageCloseSelecter:) forControlEvents:UIControlEventTouchUpInside];
    [self setRightView:clearButton];
}

-(void)crossImageCloseSelecter:(UITextField *)sender {
    [self setText:nil];
}

- (void)setText:(NSString *)text {
    [super setText:text];
    [self textFieldDidChange:self];
}

- (void)setLineColor:(UIColor *)lineColor {
    _lineColor = lineColor;
    line.backgroundColor = _lineColor;
}

- (IBAction)textFieldDidChange:(id)sender {
    if (self.enableMaterialPlaceHolder) {
        
        if (!self.text || self.text.length > 0) {
            placeHolderLabel.alpha = 1;
            self.attributedPlaceholder = nil;
        }
        
        CGFloat duration = 0.1;
        CGFloat delay = 0;
        CGFloat damping = 0.6;
        CGFloat velocity = 1;
        
        [UIView animateWithDuration:duration
                              delay:delay
             usingSpringWithDamping:damping
              initialSpringVelocity:velocity
                options:UIViewAnimationOptionCurveEaseInOut animations:^{

                    if (!self.text || self.text.length <= 0) {
                        if (_showClearButtonOption)
                            self.rightViewMode=UITextFieldViewModeNever;
                        placeHolderLabel.transform = CGAffineTransformIdentity;
                       [placeHolderLabel setFont:[placeHolderLabel.font fontWithSize:15]];
                    }
                    else {
                        if (_showClearButtonOption)
                            self.rightViewMode=UITextFieldViewModeAlways;
                        
                        placeHolderLabel.transform = CGAffineTransformMakeTranslation(0, -placeHolderLabel.frame.size.height - 5);
                        [placeHolderLabel setFont:[placeHolderLabel.font fontWithSize:12]];
                    }
                }
             completion:^(BOOL finished) {
                 
             }];
       
    }
}

-(IBAction)clearAction:(id)sender
{
    self.text = @"";
    [self textFieldDidChange:self];
}

-(void)highlight
{
    
    [UIView animateWithDuration: 0.3 // duración
                          delay: 0 // sin retardo antes de comenzar
                        options: UIViewAnimationOptionCurveEaseInOut //opciones
                     animations:^{
                         
                         if (showError) {
                             line.backgroundColor=[self setColor];
                         }
                         else {
                             line.backgroundColor=self.lineColor;
                         }
                     }
                     completion:^(BOOL finished) {
                         if (finished) {
                             
                             //finalizacion
                         }
                     }];
    
}

-(void)unhighlight
{
    [UIView animateWithDuration: 0.3 // duración
                          delay: 0 // sin retardo antes de comenzar
                        options: UIViewAnimationOptionCurveEaseInOut //opciones
                     animations:^{
                         
                         if (showError) {
                             line.backgroundColor = [self setColor];
                         }
                         else {
                             line.backgroundColor = [self.lineColor colorWithAlphaComponent:DEFAULT_ALPHA_LINE];
                         }
                     }
                     completion:^(BOOL finished) {
                         if (finished) {
                             //finalizacion
                         }
                     }];

  }

- (void)setPlaceholderAttributes:(NSDictionary *)placeholderAttributes
{
    _placeholderAttributes = placeholderAttributes;
    [self setPlaceholder:self.placeholder];
}

-(void)setPlaceholder:(NSString *)placeholder
{
    [super setPlaceholder:placeholder];
    
    NSDictionary *atts = @{NSForegroundColorAttributeName: [self.textColor colorWithAlphaComponent:0.8],
                           NSFontAttributeName : [self.font fontWithSize: 15]};
    
    self.attributedPlaceholder = [[NSAttributedString alloc] initWithString:placeholder ?: @"" attributes: self.placeholderAttributes ?: atts];

    [self setEnableMaterialPlaceHolder:self.enableMaterialPlaceHolder];
}

- (void)setEnableMaterialPlaceHolder:(BOOL)enableMaterialPlaceHolder
{
    _enableMaterialPlaceHolder = enableMaterialPlaceHolder;
    
    if (!placeHolderLabel) {
        placeHolderLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 6, 0, self.frame.size.height)];
        [self addSubview:placeHolderLabel];
    }
    placeHolderLabel.alpha = _enableMaterialPlaceHolder ? placeHolderLabel.alpha : 0;
    placeHolderLabel.attributedText = self.attributedPlaceholder;
    [placeHolderLabel sizeToFit];
}

- (BOOL)becomeFirstResponder
{
    BOOL returnValue = [super becomeFirstResponder];
    
    [self highlight];
    
    return returnValue;
}

- (BOOL)resignFirstResponder
{
    BOOL returnValue = [super resignFirstResponder];
   
    [self unhighlight];
    
    return returnValue;
}

- (void)showError
{
    showError = YES;
    line.backgroundColor = [self setColor];
}

-(UIColor *)setColor {
    
    UIColor *colorCode = nil;
    
    switch (errorColor) {
        case materialTextfieldColorOptionblackColor:
            colorCode = [UIColor blackColor];
            break;
        case materialTextfieldColorOptiondarkGrayColor:
            colorCode = [UIColor darkGrayColor];
            break;
        case materialTextfieldColorOptionlightGrayColor:
            colorCode = [UIColor lightGrayColor];
            break;
        case materialTextfieldColorOptionwhiteColor:
            colorCode = [UIColor whiteColor];
            break;
        case materialTextfieldColorOptiongrayColor:
            colorCode = [UIColor grayColor];
            break;
        case materialTextfieldColorOptionredColor:
            colorCode = [UIColor redColor];
            break;
        case materialTextfieldColorOptiongreenColor:
            colorCode = [UIColor greenColor];
            break;
        case materialTextfieldColorOptionblueColor:
            colorCode = [UIColor blueColor];
            break;
        case materialTextfieldColorOptioncyanColor:
            colorCode = [UIColor cyanColor];
            break;
        case materialTextfieldColorOptionyellowColor:
            colorCode = [UIColor yellowColor];
            break;
        case materialTextfieldColorOptionmagentaColor:
            colorCode = [UIColor magentaColor];
            break;
        case materialTextfieldColorOptionorangeColor:
            colorCode = [UIColor orangeColor];
            break;
        case materialTextfieldColorOptionpurpleColor:
            colorCode = [UIColor purpleColor];
            break;
        case materialTextfieldColorOptionclearColor:
            colorCode = [UIColor clearColor];
            break;
        default:
            colorCode = [UIColor blackColor];
            break;
    }
    return colorCode;
}
- (void)hideError
{
    showError = NO;
    line.backgroundColor = self.lineColor;
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    line.frame = CGRectMake(0, self.frame.size.height-1, self.frame.size.width, 1);
}

@end

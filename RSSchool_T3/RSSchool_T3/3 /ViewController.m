#import "ViewController.h"

@interface ViewController()

@property (nonatomic, strong) UILabel *labelResultColor;
@property (nonatomic, strong) UILabel *labelRed;
@property (nonatomic, strong) UILabel *labelGreen;
@property (nonatomic, strong) UILabel *labelBlue;

@property (nonatomic, strong) UIView *viewResultColor;

@property (nonatomic, strong) UITextField *textFieldRed;
@property (nonatomic, strong) UITextField *textFieldGreen;
@property (nonatomic, strong) UITextField *textFieldBlue;

@property (nonatomic, strong) UIButton *buttonProcess;


@end

@implementation ViewController

#pragma mark -

- (void)viewDidLoad {
    [super viewDidLoad];
  
    self.labelResultColor = [[UILabel alloc] initWithFrame:CGRectMake(50.0, 100.0, 200, 100)];
    _labelResultColor.text = @"Color";
    [self.view addSubview:_labelResultColor];
    
    self.labelRed = [[UILabel alloc] initWithFrame:CGRectMake(50.0, 170.0, 100, 100)];
    _labelRed.text = @"RED";
    [self.view addSubview:_labelRed];
    
    self.labelGreen = [[UILabel alloc] initWithFrame:CGRectMake(50.0, 240.0, 100, 100)];
    _labelGreen.text = @"GREEN";
    [self.view addSubview:_labelGreen];
    
    self.labelBlue = [[UILabel alloc] initWithFrame:CGRectMake(50.0, 310.0, 100, 100)];
    _labelBlue.text = @"BLUE";
    [self.view addSubview:_labelBlue];
    
    self.viewResultColor = [[UIView alloc] initWithFrame:CGRectMake(160.0, 130.0, 200.0, 40.0)];
    _viewResultColor.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:_viewResultColor];
    
    self.textFieldRed = [[UITextField alloc] initWithFrame:CGRectMake(130.0, 200.0, 230.0, 40.0)];
    _textFieldRed.textColor = [UIColor grayColor];
    _textFieldRed.placeholder = @"0..255";
    _textFieldRed.borderStyle = UITextBorderStyleRoundedRect;
    [self.textFieldRed addTarget:self action:@selector(beginEditing) forControlEvents:UIControlEventEditingDidBegin];
    [self.view addSubview:_textFieldRed];
    
    self.textFieldGreen = [[UITextField alloc] initWithFrame:CGRectMake(130.0, 270.0, 230.0, 40.0)];
    _textFieldGreen.textColor = [UIColor grayColor];
    _textFieldGreen.placeholder = @"0..255";
    _textFieldGreen.borderStyle = UITextBorderStyleRoundedRect;
    [self.textFieldGreen addTarget:self action:@selector(beginEditing) forControlEvents:UIControlEventEditingDidBegin];
    [self.view addSubview:_textFieldGreen];
   
    self.textFieldBlue = [[UITextField alloc] initWithFrame:CGRectMake(130.0, 340.0, 230.0, 40.0)];
    _textFieldBlue.textColor = [UIColor grayColor];
    _textFieldBlue.placeholder = @"0..255";
    _textFieldBlue.borderStyle = UITextBorderStyleRoundedRect;
    [self.textFieldBlue addTarget:self action:@selector(beginEditing) forControlEvents:UIControlEventEditingDidBegin];
    [self.view addSubview:_textFieldBlue];
    
    CGFloat width = CGRectGetWidth(self.view.bounds);
    self.buttonProcess = [[UIButton alloc] initWithFrame:CGRectMake(width/2 - 50, 400, 100, 100)];
    [self.buttonProcess setTitle:@"Process" forState:UIControlStateNormal];
    [self.buttonProcess setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    [self.buttonProcess addTarget:self action:@selector(process) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_buttonProcess];
    
    self.view.accessibilityIdentifier = @"mainView";
    _textFieldRed.accessibilityIdentifier = @"textFieldRed";
    _textFieldGreen.accessibilityIdentifier = @"textFieldGreen";
    _textFieldBlue.accessibilityIdentifier = @"textFieldBlue";
    _buttonProcess.accessibilityIdentifier = @"buttonProcess";
    _labelRed.accessibilityIdentifier = @"labelRed";
    _labelGreen.accessibilityIdentifier = @"labelGreen";
    _labelBlue.accessibilityIdentifier = @"labelBlue";
    _labelResultColor.accessibilityIdentifier = @"labelResultColor";
    _viewResultColor.accessibilityIdentifier = @"viewResultColor";
    
}

-(void)process {
    
    NSInteger redColor = _textFieldRed.text.integerValue;
    NSInteger greenColor = _textFieldGreen.text.integerValue;
    NSInteger blueColor = _textFieldBlue.text.integerValue;
    
//    NSArray *txtArr = [NSArray arrayWithObjects:_textFieldRed.text, _textFieldGreen.text,_textFieldBlue.text, nil];
//    for (int i = 0; i < txtArr.count; i++) {
//    NSScanner *scanner = [NSScanner scannerWithString:txtArr[i]];
//    BOOL isNumeric = [scanner scanInteger:NULL] && [scanner isAtEnd];
//    }
    
    if ( [_textFieldRed.text isEqualToString:@""] || [_textFieldGreen.text isEqualToString:@""] || [_textFieldBlue.text isEqualToString:@""] || redColor > 255 || redColor < 0 || greenColor > 255 || greenColor <0 || blueColor > 255 || blueColor < 0 || ![self isNumeric:_textFieldRed.text] || ![self isNumeric:_textFieldGreen.text] || ![self isNumeric:_textFieldBlue.text]) {
        _labelResultColor.text = @"Error";
        _textFieldRed.text = @"";
        _textFieldGreen.text = @"";
        _textFieldBlue.text = @"";
        _viewResultColor.backgroundColor = [UIColor whiteColor];
        [self.view endEditing:YES];
    } else {
        UIColor *color = [UIColor colorWithRed:redColor/255.0 green:greenColor/255.0 blue:blueColor/255.0 alpha:1];
        _viewResultColor.backgroundColor = color;
        _labelResultColor.text = [NSString stringWithFormat:@"0x%02lX%02lX%02lX",(long)redColor,(long)greenColor,(long)blueColor];
        _textFieldRed.text = @"";
        _textFieldGreen.text = @"";
        _textFieldBlue.text = @"";
        [self.view endEditing:YES];
    }
    
}
-(void)beginEditing {
    _labelResultColor.text = @"Color";
}

- (BOOL) isNumeric:(NSString *)txtField {
        
  NSScanner *sc = [NSScanner scannerWithString: txtField];
    if ( [sc scanInt:NULL] && [sc isAtEnd]) {
        return YES;
    } else {
        return NO;
    }
}
@end


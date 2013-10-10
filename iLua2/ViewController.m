//
//  ViewController.m
//  iLua2
//
//  Created by Justin Christofoli on 10/10/13.
//  Copyright (c) 2013 Justin Christofoli. All rights reserved.
//

#import "ViewController.h"
#import "LuaInterpreter.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UITextView *outputTextView;

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

    LuaInterpreter* luaInterpreter = [[LuaInterpreter alloc] init];
    self.outputTextView.text = [luaInterpreter evaluateLua:@"return 'Hello world'"];
}

@end

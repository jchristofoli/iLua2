//
//  LuaInterpreter.h
//  ilua2
//
//  Created by Justin Christofoli on 10/10/13.
//  Copyright (c) 2013 Justin Christofoli. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LuaInterpreter : NSObject

-(NSString*)evaluateLua:(NSString*)input;

@end

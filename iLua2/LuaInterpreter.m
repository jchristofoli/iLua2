//
//  LuaInterpreter.m
//  ilua2
//
//  Created by Justin Christofoli on 10/10/13.
//  Copyright (c) 2013 Justin Christofoli. All rights reserved.
//

#import "LuaInterpreter.h"

#include "lua.h"
#include "lualib.h"
#include "lauxlib.h"

@interface LuaInterpreter ()
@property (nonatomic) lua_State *L;
@end

@implementation LuaInterpreter

@synthesize L;

-(id)init
{
    self = [super init];
    if (self) {
        L = luaL_newstate();
        luaL_openlibs(L);
    }
    return self;
}

-(void)dealloc
{
    lua_close(L);
}

-(NSString*) getError
{
    NSString* error = [NSString stringWithCString:lua_tostring(L, -1) encoding:NSASCIIStringEncoding];
	lua_pop(L, 1);

    return error;
}


-(NSString*)evaluateLua:(NSString*)input
{
    int top = lua_gettop(L);
	int err = luaL_loadstring(L, [input cStringUsingEncoding:NSASCIIStringEncoding]);
	if (0 != err) {
		return [self getError];
	}

	err = lua_pcall(L, 0, LUA_MULTRET, 0);
	if (0 != err) {
		return [self getError];
	}

    NSString *outputNS = [NSString string];
    int nresults = lua_gettop(L) - top;
	if (0 != nresults) {

		for (int i = nresults; i > 0; i--) {
            const char* result = lua_tostring(L, -1 * i);
			outputNS = [outputNS stringByAppendingFormat:@"%s ", result];
		}
	}
    lua_pop(L, nresults);

    return outputNS;
}

@end

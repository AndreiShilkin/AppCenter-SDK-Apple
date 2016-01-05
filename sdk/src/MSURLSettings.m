// ----------------------------------------------------------------------------
// Copyright (c) Microsoft Corporation. All rights reserved.
// ----------------------------------------------------------------------------

#import "MSURLSettings.h"

static NSString *const defaultTableEndpoint = @"tables";
static NSString *const defaultApiEndpoint = @"api";

@implementation MSURLSettings

- (instancetype)init
{
	self = [super init];
	if (self) {
		self.tableEndpoint = defaultTableEndpoint;
		self.apiEndpoint = defaultApiEndpoint;
	}
	return self;
}

+ (instancetype)appSettings
{
	static id instance;
	static dispatch_once_t onceToken;
	dispatch_once(&onceToken, ^{
		instance = [[[self class] alloc] init];
	});
	return instance;
}

- (void)revertToDefaultTableEndpoint
{
	self.tableEndpoint = defaultTableEndpoint;
}

- (void)revertToDefaultApiEndpoint
{
	self.apiEndpoint = defaultApiEndpoint;
}

@end

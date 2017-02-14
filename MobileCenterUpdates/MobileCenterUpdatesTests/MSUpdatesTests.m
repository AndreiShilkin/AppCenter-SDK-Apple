#import <XCTest/XCTest.h>

#import "MSUpdatesInternal.h"

@interface MobileCenterUpdatesTests : XCTestCase

@property(nonatomic, strong) MSUpdates *sut;

@end

@implementation MobileCenterUpdatesTests

- (void)setUp {
  [super setUp];

  self.sut = [MSUpdates new];
}

- (void)testSetApiUrlWorks {

  // When
  NSString *testUrl = @"https://example.com";
  [self.sut setApiUrl:testUrl];

  // Then
  XCTAssertTrue([[self.sut apiUrl] isEqualToString:testUrl]);
}

- (void)testSetInstallUrlWorks {

  // When
  NSString *testUrl = @"https://example.com";
  [self.sut setInstallUrl:testUrl];

  // Then
  XCTAssertTrue([[self.sut installUrl] isEqualToString:testUrl]);
}

- (void)testDefaultInstallUrlWorks {
  
  // Then
  XCTAssertNotNil([self.sut installUrl]);
  XCTAssertTrue([[self.sut installUrl] isEqualToString:@"http://install.asgard-int.trafficmanager.net/"]);
}

- (void)testDefaultApiUrlWorks {
  
  // Then
  XCTAssertNotNil([self.sut apiUrl]);
  XCTAssertTrue([[self.sut apiUrl] isEqualToString:@"https://asgard-int.trafficmanager.net/api"]);
}
@end

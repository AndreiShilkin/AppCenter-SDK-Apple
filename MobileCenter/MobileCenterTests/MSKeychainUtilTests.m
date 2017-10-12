#import "MSKeychainUtil.h"
#import "MSTestFrameworks.h"

@interface MSKeychainUtilTests : XCTestCase

@end

@implementation MSKeychainUtilTests

- (void)setUp {
  [super setUp];
  [MSKeychainUtil clear];
}

- (void)tearDown {
  [super tearDown];
  [MSKeychainUtil clear];
}

#if !TARGET_OS_TV
- (void)testKeychain {

  // If
  NSString *key = @"Test Key";
  NSString *value = @"Test Value";

  // Then
  XCTAssertTrue([MSKeychainUtil storeString:value forKey:key]);
  assertThat([MSKeychainUtil stringForKey:key], equalTo(value));
  assertThat([MSKeychainUtil deleteStringForKey:key], equalTo(value));

  XCTAssertFalse([MSKeychainUtil stringForKey:key]);
  XCTAssertNil([MSKeychainUtil deleteStringForKey:key]);
}
#endif

@end

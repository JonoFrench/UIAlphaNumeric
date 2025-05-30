rm -r build/UIAlphaNumeric.xcframework

xcodebuild archive \
-scheme 'UIAlphaNumeric' \
-configuration Release \
-destination 'generic/platform=iOS' \
-archivePath './build/UIAlphaNumeric.framework-iphoneos.xcarchive' \
SKIP_INSTALL=NO \
BUILD_LIBRARIES_FOR_DISTRIBUTION=YES

xcodebuild archive \
-scheme 'UIAlphaNumeric' \
-configuration Release \
-destination 'generic/platform=iOS Simulator' \
-archivePath './build/UIAlphaNumeric.framework-iphonesimulator.xcarchive' \
SKIP_INSTALL=NO \
BUILD_LIBRARIES_FOR_DISTRIBUTION=YES

xcodebuild -create-xcframework \
-framework './build/UIAlphaNumeric.framework-iphonesimulator.xcarchive/Products/Frameworks/UIAlphaNumeric.framework' \
-framework './build/UIAlphaNumeric.framework-iphoneos.xcarchive/Products/Frameworks/UIAlphaNumeric.framework' \
-output './build/UIAlphaNumeric.xcframework'

cd build
cd UIAlphaNumeric.xcframework

find . -name "*.swiftinterface" -exec sed -i -e 's/UIAlphaNumeric\.//g' {} \;


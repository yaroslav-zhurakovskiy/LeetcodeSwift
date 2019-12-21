#/usr/bin/sh

cd Sources/LeetcodeUI/

controller_name=LeetcodeLoginConrollerImpl
extension_file_name="${controller_name}+Nib.swift"

ibtool --compile ${controller_name}.nib ${controller_name}.xib
base64="$(openssl base64 -in $controller_name.nib)"
if test -f $extension_file_name; then
    rm $extension_file_name
fi
touch $extension_file_name
code="static let nibBase64String =\n\"\"\"\n${base64}\n\"\"\""
echo "@available(iOS 11.0, *)\nextension ${controller_name} {\n\t${code}\n}" >> $extension_file_name
rm ${controller_name}.nib


#
if [ "${ACTION}" = "build" ]
then

#要build的target名
target_Name=${PROJECT_NAME}

#build之后的文件夹路径
build_DIR=${SRCROOT}/build

#真机build生成的framework文件路径
DEVICE_DIR_Framework=${build_DIR}/Release-iphoneos

#模拟器build生成的framework文件路径
SIMULATOR_DIR_Framework=${build_DIR}/Release-iphonesimulator

#目标文件夹路径
INSTALL_DIR=${SRCROOT}/Products/${PROJECT_NAME}

#判断build文件夹是否存在，存在则删除
if [ -d "${build_DIR}" ]
then
rm -rf "${build_DIR}"
fi

#判断目标文件夹是否存在，存在则删除该文件夹
if [ -d "${INSTALL_DIR}" ]
then
rm -rf "${INSTALL_DIR}"
fi

#创建目标文件夹
mkdir -p "${INSTALL_DIR}"

#build之前clean一下
xcodebuild -target ${target_Name} clean

#真机build
xcodebuild -quiet -scheme ${target_Name} -workspace ${target_Name}.xcworkspace -configuration Release -sdk iphoneos ARCHS="arm64" -derivedDataPath ${DEVICE_DIR_Framework}


##模拟器build
xcodebuild -quiet -scheme ${target_Name} -workspace ${target_Name}.xcworkspace -configuration Release -sdk iphonesimulator ARCHS="x86_64" -derivedDataPath ${SIMULATOR_DIR_Framework}

#真机中的文件到目标文件夹
cp -R "${DEVICE_DIR_Framework}/Build/Products/Release-iphoneos/${target_Name}.framework" "${INSTALL_DIR}"

#合成模拟器和真机包
lipo -create "${DEVICE_DIR_Framework}/Build/Products/Release-iphoneos/${target_Name}.framework/${PROJECT_NAME}" "${SIMULATOR_DIR_Framework}/Build/Products/Release-iphonesimulator/${target_Name}.framework/${PROJECT_NAME}" -output "${INSTALL_DIR}/${PROJECT_NAME}.framework/${PROJECT_NAME}"

#打开目标文件夹
open "${INSTALL_DIR}"

#清理中间产物
#判断build文件夹是否存在，存在则删除
if [ -d "${build_DIR}" ];then
    rm -rf "${build_DIR}"
fi

fi

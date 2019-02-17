. .\config.ps1

$imageFullName = "$repo/$($ImageName):$APP_VERSION"

docker run -v d:/temp/config/$($ImageName):c:/config -p 7878:7878 --rm -it $imageFullName
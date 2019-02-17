. .\config.ps1

$imageFullName = "$repo/$($ImageName):$APP_VERSION"
Write-Host "Building $imageFullName"
docker build --build-arg APP_VERSION=$APP_VERSION . -t $imageFullName
Write-Host "Tagging image as latest"
docker tag $imageFullName "$repo/$($ImageName):latest"
. .\config.ps1

$imageFullName = "$repo/$($ImageName):$APP_VERSION"
Write-Host "Pushing $imageFullName"
docker push $imageFullName
Write-Host "Tagging image as latest"
docker push "$repo/$($ImageName):latest"

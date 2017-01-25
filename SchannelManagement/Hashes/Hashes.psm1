$HashesPath = "SYSTEM\CurrentControlSet\Control\SecurityProviders\SCHANNEL\Hashes"
$Hashes = @{};
$Hashes.Add('MD5',$HashesPath);
$Hashes.Add('SHA',$HashesPath);

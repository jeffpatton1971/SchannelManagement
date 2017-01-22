$CiphersPath = "SYSTEM\CurrentControlSet\Control\SecurityProviders\SCHANNEL\Ciphers";
$Ciphers = @{};
$Ciphers.Add('AES 128/128',$CiphersPath);
$Ciphers.Add('AES 256/256',$CiphersPath);
$Ciphers.Add('DES 56/56',$CiphersPath);
$Ciphers.Add('NULL',$CiphersPath);
$Ciphers.Add('RC2 128/128',$CiphersPath);
$Ciphers.Add('RC2 40/128',$CiphersPath);
$Ciphers.Add('RC2 56/128',$CiphersPath);
$Ciphers.Add('RC4 128/128',$CiphersPath);
$Ciphers.Add('RC4 40/128',$CiphersPath);
$Ciphers.Add('RC4 56/128',$CiphersPath);
$Ciphers.Add('RC4 64/128',$CiphersPath);
$Ciphers.Add('Triple DES 168/168',$CiphersPath);


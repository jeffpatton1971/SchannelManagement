#
# https://docs.microsoft.com/en-us/windows-server/identity/ad-fs/operations/manage-ssl-protocols-in-ad-fs
#
param
(
	[switch]$Strong
)
try
{
	$ErrorActionPreference = 'Stop';
	$Error.Clear();

	$Protocols = @();
	$Protocols += 'SSL 2.0';
	$Protocols += 'SSL 3.0';
	$Protocols += 'TLS 1.0';
	$Protocols += 'TLS 1.1';
	$Protocols += 'TLS 1.2';

	$Protocols |ForEach-Object {Disable-Protocol -Protocol $_ ; Disable-Protocol -Protocol $_ -Client};

	if ($Strong)
	{
		Disable-Protocol -Protocol 'TLS 1.0' ;
		Disable-Protocol -Protocol 'TLS 1.0' -Client;
		Enable-StrongAuthentication -Net35 $true -Net4or5 $true;
	}

	$Ciphers = @();
	$Ciphers += 'RC4 40/128';
	$Ciphers += 'RC4 56/128';
	$Ciphers += 'RC4 128/128';

	$Ciphers |ForEach-Object {Disable-Cipher -Cipher $_; Disable-Cipher -Cipher $_ -Client};
}
catch
{
	throw $_;
}
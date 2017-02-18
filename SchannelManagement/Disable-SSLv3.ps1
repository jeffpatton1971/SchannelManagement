param
(
	[string]$ComputerName,
	[switch]$Client
)
try
{
	$ErrorActionPreference = 'Stop';
	$Error.Clear();

	$Protocols = @();
	$Protocols += 'TLS 1.1';
	$Protocols += 'TLS 1.2';
	$Protocols += 'SSL 3.0';
	$Protocols += 'PCT 1.0';
	$Protocols += 'SSL 2.0';
	$Protocols += 'TLS 1.0';

	$Protocols |ForEach-Object {Disable-Protocol -Protocol $_};

	$Ciphers = @();
	$Ciphers += 'AES 128/128';
	$Ciphers += 'AES 256/256';
	$Ciphers += 'DES 56/56';
	$Ciphers += 'NULL';
	$Ciphers += 'RC2 128/128';
	$Ciphers += 'RC2 40/128';
	$Ciphers += 'RC2 56/128';
	$Ciphers += 'RC4 128/128';
	$Ciphers += 'RC4 40/128';
	$Ciphers += 'RC4 56/128';
	$Ciphers += 'RC4 64/128';
	$Ciphers += 'Triple DES 168/168';

	$Ciphers |ForEach-Object {Disable-Cipher -Cipher $_};
	Set-CipherOrder;

	$Hashes = @();
	$Hashes += 'MD5';
	$Hashes += 'SHA';

	$Hashes |ForEach-Object {Disable-Hash -Hash $_};
}
catch
{
	throw $_;
}
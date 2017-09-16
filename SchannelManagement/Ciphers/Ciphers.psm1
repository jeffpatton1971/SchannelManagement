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

function New-Cipher
{
	[CmdletBinding()]
	param
	(
	)

	DynamicParam
	{

		$DynamicParameters = @(
			@{
				Name = 'Cipher'
				Type = [array]
				Position = 0
				Mandatory = $true
				ValidateSet = $Ciphers.Keys
			},
			@{
				Name = 'ComputerName'
				Type = [string]
				Position = 2
				Manndatory = $false

			}
		)
		$DynamicParameters |ForEach-Object {New-Object -TypeName psobject -Property $_} |New-DynamicParameter;
	}

	begin
	{
		$Cipher = $PSBoundParameters['Cipher'];
		$ComputerName = $PSBoundParameters['ComputerName'];
	}

	process
	{
		try
		{
			$ErrorActionPreference = 'Stop';
			$Error.Clear();

			Write-Verbose "Cipher       : $($Cipher)";
			Write-Verbose "ComputerName : $($ComputerName)";

			$RegPath = "$($Ciphers[$Cipher])\$($Cipher)";

			Write-Verbose "RegPath      : $($RegPath)";

			if ($ComputerName)
			{
				New-RegistryKey -Hive HKEY_LOCAL_MACHINE -SubKeyName $RegPath -ComputerName $ComputerName;
			}
			else
			{
				New-RegistryKey -Hive HKEY_LOCAL_MACHINE -SubKeyName $RegPath;
			}
		}
		catch
		{
			throw $_;
		}
	}
}

function Remove-Cipher
{
	[CmdletBinding()]
	param
	(
	)

	DynamicParam
	{

		$DynamicParameters = @(
			@{
				Name = 'Cipher'
				Type = [array]
				Position = 0
				Mandatory = $true
				ValidateSet = $Ciphers.Keys
			},
			@{
				Name = 'ComputerName'
				Type = [string]
				Position = 2
				Manndatory = $false

			}
		)
		$DynamicParameters |ForEach-Object {New-Object -TypeName psobject -Property $_} |New-DynamicParameter;
	}

	begin
	{
		$Cipher = $PSBoundParameters['Cipher'];
		$ComputerName = $PSBoundParameters['ComputerName'];
	}

	process
	{
		try
		{
			$ErrorActionPreference = 'Stop';
			$Error.Clear();

			Write-Verbose "Cipher       : $($Cipher)";
			Write-Verbose "ComputerName : $($ComputerName)";

			$RegPath = "$($Ciphers[$Cipher])\$($Cipher)";

			Write-Verbose "RegPath      : $($RegPath)";

			if ($ComputerName)
			{
				Remove-RegistryKey -Hive HKEY_LOCAL_MACHINE -SubKeyName $RegPath -ComputerName $ComputerName;
			}
			else
			{
				Remove-RegistryKey -Hive HKEY_LOCAL_MACHINE -SubKeyName $RegPath;
			}
		}
		catch
		{
			throw $_;
		}
	}
}

function Enable-Cipher
{
	[CmdletBinding()]
	param
	(
	)

	DynamicParam
	{

		$DynamicParameters = @(
			@{
				Name = 'Cipher'
				Type = [array]
				Position = 0
				Mandatory = $true
				ValidateSet = $Ciphers.Keys
			},
			@{
				Name = 'ComputerName'
				Type = [string]
				Position = 2
				Manndatory = $false

			}
		)
		$DynamicParameters |ForEach-Object {New-Object -TypeName psobject -Property $_} |New-DynamicParameter;
	}

	begin
	{
		$Cipher = $PSBoundParameters['Cipher'];
		$ComputerName = $PSBoundParameters['ComputerName'];
	}

	process
	{
		try
		{
			$ErrorActionPreference = 'Stop';
			$Error.Clear();

			Write-Verbose "Cipher       : $($Cipher)";
			Write-Verbose "ComputerName : $($ComputerName)";

			$RegPath = "$($Ciphers[$Cipher])\$($Cipher)";

			Write-Verbose "RegPath      : $($RegPath)";

			if ($ComputerName)
			{
				if (!(Test-RegistryKey -Hive HKEY_LOCAL_MACHINE -SubKeyName $RegPath -ComputerName $ComputerName))
				{
					New-RegistryKey -Hive HKEY_LOCAL_MACHINE -SubKeyName $RegPath -ComputerName $ComputerName;
				}
				Set-RegistryValue -Hive HKEY_LOCAL_MACHINE -SubKeyName $RegPath -ValueName 'Enabled' -ValueType DWORD -Value 4294967295 -ComputerName $ComputerName;
			}
			else
			{
				if (!(Test-RegistryKey -Hive HKEY_LOCAL_MACHINE -SubKeyName $RegPath))
				{
					New-RegistryKey -Hive HKEY_LOCAL_MACHINE -SubKeyName $RegPath;
				}
				Set-RegistryValue -Hive HKEY_LOCAL_MACHINE -SubKeyName $RegPath -ValueName 'Enabled' -ValueType DWORD -Value 4294967295;
			}
		}
		catch
		{
			throw $_;
		}
	}
}

function Disable-Cipher
{
	[CmdletBinding()]
	param
	(
	)

	DynamicParam
	{

		$DynamicParameters = @(
			@{
				Name = 'Cipher'
				Type = [array]
				Position = 0
				Mandatory = $true
				ValidateSet = $Ciphers.Keys
			},
			@{
				Name = 'ComputerName'
				Type = [string]
				Position = 2
				Manndatory = $false

			}
		)
		$DynamicParameters |ForEach-Object {New-Object -TypeName psobject -Property $_} |New-DynamicParameter;
	}

	begin
	{
		$Cipher = $PSBoundParameters['Cipher'];
		$ComputerName = $PSBoundParameters['ComputerName'];
	}

	process
	{
		try
		{
			$ErrorActionPreference = 'Stop';
			$Error.Clear();

			Write-Verbose "Cipher       : $($Cipher)";
			Write-Verbose "ComputerName : $($ComputerName)";

			$RegPath = "$($Ciphers[$Cipher])\$($Cipher)";

			Write-Verbose "RegPath      : $($RegPath)";

			if ($ComputerName)
			{
				if (!(Test-RegistryKey -Hive HKEY_LOCAL_MACHINE -SubKeyName $RegPath -ComputerName $ComputerName))
				{
					New-RegistryKey -Hive HKEY_LOCAL_MACHINE -SubKeyName $RegPath -ComputerName $ComputerName;
				}
				Set-RegistryValue -Hive HKEY_LOCAL_MACHINE -SubKeyName $RegPath -ValueName 'Enabled' -ValueType DWORD -Value 0 -ComputerName $ComputerName;
			}
			else
			{
				if (!(Test-RegistryKey -Hive HKEY_LOCAL_MACHINE -SubKeyName $RegPath))
				{
					New-RegistryKey -Hive HKEY_LOCAL_MACHINE -SubKeyName $RegPath;
				}
				Set-RegistryValue -Hive HKEY_LOCAL_MACHINE -SubKeyName $RegPath -ValueName 'Enabled' -ValueType DWORD -Value 0;
			}
		}
		catch
		{
			throw $_;
		}
	}
}

function Get-Cipher
{
	[CmdletBinding()]
	param
	(
	)

	DynamicParam
	{

		$DynamicParameters = @(
			@{
				Name = 'Cipher'
				Type = [array]
				Position = 0
				Mandatory = $true
				ValidateSet = $Ciphers.Keys
			},
			@{
				Name = 'ComputerName'
				Type = [string]
				Position = 2
				Manndatory = $false

			}
		)
		$DynamicParameters |ForEach-Object {New-Object -TypeName psobject -Property $_} |New-DynamicParameter;
	}

	begin
	{
		$Cipher = $PSBoundParameters['Cipher'];
		$ComputerName = $PSBoundParameters['ComputerName'];
	}

	process
	{
		try
		{
			$ErrorActionPreference = 'Stop';
			$Error.Clear();

			Write-Verbose "Cipher       : $($Cipher)";
			Write-Verbose "ComputerName : $($ComputerName)";

			$RegPath = "$($Ciphers[$Cipher])\$($Cipher)";

			Write-Verbose "RegPath      : $($RegPath)";

			if ($ComputerName)
			{
				Get-RegistryValue -Hive HKEY_LOCAL_MACHINE -SubKeyName $RegPath -ComputerName $ComputerName;
			}
			else
			{
				Get-RegistryValue -Hive HKEY_LOCAL_MACHINE -SubKeyName $RegPath;
			}
		}
		catch
		{
			throw $_;
		}
	}
}

function Test-Cipher
{
	[CmdletBinding()]
	param
	(
	)

	DynamicParam
	{

		$DynamicParameters = @(
			@{
				Name = 'Cipher'
				Type = [array]
				Position = 0
				Mandatory = $true
				ValidateSet = $Ciphers.Keys
			},
			@{
				Name = 'ComputerName'
				Type = [string]
				Position = 2
				Manndatory = $false

			}
		)
		$DynamicParameters |ForEach-Object {New-Object -TypeName psobject -Property $_} |New-DynamicParameter;
	}

	begin
	{
		$Cipher = $PSBoundParameters['Cipher'];
		$ComputerName = $PSBoundParameters['ComputerName'];
	}

	process
	{
		try
		{
			$ErrorActionPreference = 'Stop';
			$Error.Clear();

			Write-Verbose "Cipher       : $($Cipher)";
			Write-Verbose "ComputerName : $($ComputerName)";

			$RegPath = "$($Ciphers[$Cipher])\$($Cipher)";

			Write-Verbose "RegPath      : $($RegPath)";

			if ($ComputerName)
			{
				$Result = Get-RegistryValue -Hive HKEY_LOCAL_MACHINE -SubKeyName $RegPath -ComputerName $ComputerName;
			}
			else
			{
				$Result = Get-RegistryValue -Hive HKEY_LOCAL_MACHINE -SubKeyName $RegPath;
			}

			if ($Result.sNames -eq $null)
			{
				return $false;
			}
			else
			{
				return $true;
			}
		}
		catch
		{
			throw $_;
		}
	}
}

function Set-CipherOrder
{
	param
	(
		[string[]]$CipherList = @("TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256","TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P384","TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256","TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P384","TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA_P256","TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA_P384","TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA_P256","TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA_P384","TLS_DHE_RSA_WITH_AES_256_GCM_SHA384","TLS_DHE_RSA_WITH_AES_128_GCM_SHA256","TLS_RSA_WITH_AES_256_GCM_SHA384","TLS_RSA_WITH_AES_128_GCM_SHA256","TLS_RSA_WITH_AES_256_CBC_SHA256","TLS_RSA_WITH_AES_128_CBC_SHA256","TLS_RSA_WITH_AES_256_CBC_SHA","TLS_RSA_WITH_AES_128_CBC_SHA","TLS_ECDHE_ECDSA_WITH_AES_256_GCM_SHA384_P384","TLS_ECDHE_ECDSA_WITH_AES_128_GCM_SHA256_P256","TLS_ECDHE_ECDSA_WITH_AES_128_GCM_SHA256_P384","TLS_ECDHE_ECDSA_WITH_AES_256_CBC_SHA384_P384","TLS_ECDHE_ECDSA_WITH_AES_128_CBC_SHA256_P256","TLS_ECDHE_ECDSA_WITH_AES_128_CBC_SHA256_P384","TLS_ECDHE_ECDSA_WITH_AES_256_CBC_SHA_P256","TLS_ECDHE_ECDSA_WITH_AES_256_CBC_SHA_P384","TLS_ECDHE_ECDSA_WITH_AES_128_CBC_SHA_P256","TLS_ECDHE_ECDSA_WITH_AES_128_CBC_SHA_P384","TLS_DHE_DSS_WITH_AES_256_CBC_SHA256","TLS_DHE_DSS_WITH_AES_128_CBC_SHA256","TLS_DHE_DSS_WITH_AES_256_CBC_SHA","TLS_DHE_DSS_WITH_AES_128_CBC_SHA","TLS_RSA_WITH_3DES_EDE_CBC_SHA","TLS_DHE_DSS_WITH_3DES_EDE_CBC_SHA","TLS_RSA_WITH_RC4_128_SHA","TLS_RSA_WITH_RC4_128_MD5","TLS_RSA_WITH_NULL_SHA256","TLS_RSA_WITH_NULL_SHA","SSL_CK_RC4_128_WITH_MD5","SSL_CK_DES_192_EDE3_CBC_WITH_MD5"),
		[string]$ComputerName
	)

	try
	{
		$ErrorActionPreference = 'Stop';
		$Error.Clear();

		$CipherOrder = "SOFTWARE\Policies\Microsoft\Cryptography\Configuration\SSL\00010002";

		if ($ComputerName)
		{
			Set-RegistryValue -Hive HKEY_LOCAL_MACHINE -SubKeyName $CipherOrder -ValueName 'Functions ' -ValueType ExpandedString  -Value ([string]::join(',',$CipherList)) -ComputerName $ComputerName;
		}
		else
		{
			Set-RegistryValue -Hive HKEY_LOCAL_MACHINE -SubKeyName $CipherOrder -ValueName 'Functions ' -ValueType ExpandedString  -Value ([string]::join(',',$CipherList));
		}
	}
	catch
	{
		throw $_;
	}
}
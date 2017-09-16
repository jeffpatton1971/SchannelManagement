function Enable-StrongAuthentication
{
	[CmdletBinding()]
	param
	(
		[Parameter(Mandatory=$false)]
		[bool]$Net35,
		[Parameter(Mandatory=$false)]
		[bool]$Net4or5,
		[Parameter(Mandatory=$false)]
		[string]$ComputerName
	)
	try
	{
		$ErrorActionPreference = 'Stop';
		$Error.Clear();

		if ($Net35)
		{
			$RegPath = 'SOFTWARE\Wow6432Node\Microsoft.NETFramework\v2.0.50727';
			if ($ComputerName)
			{
				Set-RegistryValue -Hive HKEY_LOCAL_MACHINE -SubKeyName $RegPath -ValueName 'SchUseStrongCrypto' -ValueType DWORD -Value 1 -ComputerName $ComputerName;
			}
			else
			{
				Set-RegistryValue -Hive HKEY_LOCAL_MACHINE -SubKeyName $RegPath -ValueName 'SchUseStrongCrypto' -ValueType DWORD -Value 1;
			}
		}

		if ($Net4or5)
		{
			$RegPath = 'SOFTWARE\Microsoft.NETFramework\v4.0.30319';
			if ($ComputerName)
			{
				Set-RegistryValue -Hive HKEY_LOCAL_MACHINE -SubKeyName $RegPath -ValueName 'SchUseStrongCrypto' -ValueType DWORD -Value 1 -ComputerName $ComputerName;
			}
			else
			{
				Set-RegistryValue -Hive HKEY_LOCAL_MACHINE -SubKeyName $RegPath -ValueName 'SchUseStrongCrypto' -ValueType DWORD -Value 1;
			}
		}
	}
	catch
	{
		throw $_;
	}
}
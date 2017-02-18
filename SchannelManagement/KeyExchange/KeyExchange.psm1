$KeyExchangePath = "SYSTEM\CurrentControlSet\Control\SecurityProviders\SCHANNEL\KeyExchangeAlgorithms";
$KeyExchanges = @{};
$KeyExchanges.Add('Diffie-Hellman',$KeyExchangePath);
$KeyExchanges.Add('PKCS',$KeyExchangePath);

function New-KeyExchange
{
	[CmdletBinding()]
	param
	(
	)

	DynamicParam
	{

		$DynamicParameters = @(
			@{
				Name = 'KeyExchange'
				Type = [array]
				Position = 0
				Mandatory = $true
				ValidateSet = $KeyExchanges.Keys
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
		$KeyExchange = $PSBoundParameters['KeyExchange'];
		$ComputerName = $PSBoundParameters['ComputerName'];
	}

	process
	{
		try
		{
			$ErrorActionPreference = 'Stop';
			$Error.Clear();

			Write-Verbose "KeyExchange  : $($KeyExchange)";
			Write-Verbose "ComputerName : $($ComputerName)";

			$RegPath = "$($KeyExchanges[$KeyExchange])\$($KeyExchange)";

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

function Remove-KeyExchange
{
	[CmdletBinding()]
	param
	(
	)

	DynamicParam
	{

		$DynamicParameters = @(
			@{
				Name = 'KeyExchange'
				Type = [array]
				Position = 0
				Mandatory = $true
				ValidateSet = $KeyExchanges.Keys
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
		$KeyExchange = $PSBoundParameters['KeyExchange'];
		$ComputerName = $PSBoundParameters['ComputerName'];
	}

	process
	{
		try
		{
			$ErrorActionPreference = 'Stop';
			$Error.Clear();

			Write-Verbose "KeyExchange  : $($KeyExchange)";
			Write-Verbose "ComputerName : $($ComputerName)";

			$RegPath = "$($KeyExchanges[$KeyExchange])\$($KeyExchange)";

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

function Enable-KeyExchange
{
	[CmdletBinding()]
	param
	(
	)

	DynamicParam
	{

		$DynamicParameters = @(
			@{
				Name = 'KeyExchange'
				Type = [array]
				Position = 0
				Mandatory = $true
				ValidateSet = $KeyExchanges.Keys
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
		$KeyExchange = $PSBoundParameters['KeyExchange'];
		$ComputerName = $PSBoundParameters['ComputerName'];
	}

	process
	{
		try
		{
			$ErrorActionPreference = 'Stop';
			$Error.Clear();

			Write-Verbose "KeyExchange         : $($KeyExchange)";
			Write-Verbose "ComputerName : $($ComputerName)";

			$RegPath = "$($KeyExchanges[$KeyExchange])\$($KeyExchange)";

			Write-Verbose "RegPath      : $($RegPath)";

			if ($ComputerName)
			{
				Set-RegistryValue -Hive HKEY_LOCAL_MACHINE -SubKeyName $RegPath -ValueName 'Enabled' -ValueType DWORD -Value 4294967295 -ComputerName $ComputerName;
			}
			else
			{
				Set-RegistryValue -Hive HKEY_LOCAL_MACHINE -SubKeyName $RegPath -ValueName 'Enabled' -ValueType DWORD -Value 4294967295;
			}
		}
		catch
		{
			throw $_;
		}
	}
}

function Disable-KeyExchange
{
	[CmdletBinding()]
	param
	(
	)

	DynamicParam
	{

		$DynamicParameters = @(
			@{
				Name = 'KeyExchange'
				Type = [array]
				Position = 0
				Mandatory = $true
				ValidateSet = $KeyExchanges.Keys
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
		$KeyExchange = $PSBoundParameters['KeyExchange'];
		$ComputerName = $PSBoundParameters['ComputerName'];
	}

	process
	{
		try
		{
			$ErrorActionPreference = 'Stop';
			$Error.Clear();

			Write-Verbose "KeyExchange         : $($KeyExchange)";
			Write-Verbose "ComputerName : $($ComputerName)";

			$RegPath = "$($KeyExchanges[$KeyExchange])\$($KeyExchange)";

			Write-Verbose "RegPath      : $($RegPath)";

			if ($ComputerName)
			{
				Set-RegistryValue -Hive HKEY_LOCAL_MACHINE -SubKeyName $RegPath -ValueName 'Enabled' -ValueType DWORD -Value 0 -ComputerName $ComputerName;
			}
			else
			{
				Set-RegistryValue -Hive HKEY_LOCAL_MACHINE -SubKeyName $RegPath -ValueName 'Enabled' -ValueType DWORD -Value 0;
			}
		}
		catch
		{
			throw $_;
		}
	}
}

function Get-KeyExchange
{
	[CmdletBinding()]
	param
	(
	)

	DynamicParam
	{

		$DynamicParameters = @(
			@{
				Name = 'KeyExchange'
				Type = [array]
				Position = 0
				Mandatory = $true
				ValidateSet = $KeyExchanges.Keys
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
		$KeyExchange = $PSBoundParameters['KeyExchange'];
		$ComputerName = $PSBoundParameters['ComputerName'];
	}

	process
	{
		try
		{
			$ErrorActionPreference = 'Stop';
			$Error.Clear();

			Write-Verbose "KeyExchange         : $($KeyExchange)";
			Write-Verbose "ComputerName : $($ComputerName)";

			$RegPath = "$($KeyExchanges[$KeyExchange])\$($KeyExchange)";

			Write-Verbose "RegPath      : $($RegPath)";

			if ($ComputerName)
			{
				Get-RegistryKey -Hive HKEY_LOCAL_MACHINE -SubKeyName $RegPath -ComputerName $ComputerName;
			}
			else
			{
				Get-RegistryKey -Hive HKEY_LOCAL_MACHINE -SubKeyName $RegPath;
			}
		}
		catch
		{
			throw $_;
		}
	}
}

function Test-KeyExchange
{
	[CmdletBinding()]
	param
	(
	)

	DynamicParam
	{

		$DynamicParameters = @(
			@{
				Name = 'KeyExchange'
				Type = [array]
				Position = 0
				Mandatory = $true
				ValidateSet = $KeyExchanges.Keys
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
		$KeyExchange = $PSBoundParameters['KeyExchange'];
		$ComputerName = $PSBoundParameters['ComputerName'];
	}

	process
	{
		try
		{
			$ErrorActionPreference = 'Stop';
			$Error.Clear();

			Write-Verbose "KeyExchange         : $($KeyExchange)";
			Write-Verbose "ComputerName : $($ComputerName)";

			$RegPath = "$($KeyExchanges[$KeyExchange])\$($KeyExchange)";

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
$ProtocolsPath = "SYSTEM\CurrentControlSet\Control\SecurityProviders\SCHANNEL\Protocols";
$Protocols = @{};
$Protocols.Add('TLS 1.1',$ProtocolsPath);
$Protocols.Add('TLS 1.2',$ProtocolsPath);
$Protocols.Add('SSL 3.0',$ProtocolsPath);
$Protocols.Add('PCT 1.0',$ProtocolsPath);
$Protocols.Add('SSL 2.0',$ProtocolsPath);
$Protocols.Add('TLS 1.0',$ProtocolsPath);

function New-Protocol
{
	[CmdletBinding()]
	param
	(
	)

	DynamicParam
	{

		$DynamicParameters = @(
			@{
				Name = 'Protocol'
				Type = [array]
				Position = 0
				Mandatory = $true
				ValidateSet = $Protocols.Keys
			},
			@{
				Name = 'Client'
				Type = [switch]
				Position = 1
				Mandatory = $false
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
		$Protocol = $PSBoundParameters['Protocol'];
		$Client = $PSBoundParameters['Client'];
		$ComputerName = $PSBoundParameters['ComputerName'];
	}

	process
	{
		try
		{
			$ErrorActionPreference = 'Stop';
			$Error.Clear();

			Write-Verbose "Protocol     : $($Protocol)";
			Write-Verbose "Client       : $($Client)";
			Write-Verbose "ComputerName : $($ComputerName)";

			if ($Client)
			{
				$RegPath = "$($ProtocolsPath)\$($Protocol)\Client";
			}
			else
			{
				$RegPath = "$($ProtocolsPath)\$($Protocol)\Server";
			}

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

function Remove-Protocol
{
	[CmdletBinding()]
	param
	(
	)

	DynamicParam
	{

		$DynamicParameters = @(
			@{
				Name = 'Protocol'
				Type = [array]
				Position = 0
				Mandatory = $true
				ValidateSet = $Protocols.Keys
			},
			@{
				Name = 'Client'
				Type = [switch]
				Position = 1
				Mandatory = $false
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
		$Protocol = $PSBoundParameters['Protocol'];
		$Client = $PSBoundParameters['Client'];
		$ComputerName = $PSBoundParameters['ComputerName'];
	}

	process
	{
		try
		{
			$ErrorActionPreference = 'Stop';
			$Error.Clear();

			Write-Verbose "Protocol     : $($Protocol)";
			Write-Verbose "Client       : $($Client)";
			Write-Verbose "ComputerName : $($ComputerName)";

			if ($Client)
			{
				$RegPath = "$($ProtocolsPath)\$($Protocol)\Client";
			}
			else
			{
				$RegPath = "$($ProtocolsPath)\$($Protocol)\Server";
			}

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

function Enable-Protocol
{
	[CmdletBinding()]
	param
	(
	)

	DynamicParam
	{

		$DynamicParameters = @(
			@{
				Name = 'Protocol'
				Type = [array]
				Position = 0
				Mandatory = $true
				ValidateSet = $Protocols.Keys
			},
			@{
				Name = 'Client'
				Type = [switch]
				Position = 1
				Mandatory = $false
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
		$Protocol = $PSBoundParameters['Protocol'];
		$Client = $PSBoundParameters['Client'];
		$ComputerName = $PSBoundParameters['ComputerName'];
	}

	process
	{
		try
		{
			$ErrorActionPreference = 'Stop';
			$Error.Clear();

			Write-Verbose "Protocol     : $($Protocol)";
			Write-Verbose "Client       : $($Client)";
			Write-Verbose "ComputerName : $($ComputerName)";

			if ($Client)
			{
				$RegPath = "$($ProtocolsPath)\$($Protocol)\Client";
			}
			else
			{
				$RegPath = "$($ProtocolsPath)\$($Protocol)\Server";
			}

			Write-Verbose "RegPath      : $($RegPath)";

			if ($ComputerName)
			{
				Set-RegistryValue -Hive HKEY_LOCAL_MACHINE -SubKeyName $RegPath -ValueName 'DisabledByDefault' -ValueType DWORD -Value 1 -ComputerName $ComputerName;
				Set-RegistryValue -Hive HKEY_LOCAL_MACHINE -SubKeyName $RegPath -ValueName 'Enabled' -ValueType DWORD -Value 0 -ComputerName $ComputerName;
			}
			else
			{
				Set-RegistryValue -Hive HKEY_LOCAL_MACHINE -SubKeyName $RegPath -ValueName 'DisabledByDefault' -ValueType DWORD -Value 1;
				Set-RegistryValue -Hive HKEY_LOCAL_MACHINE -SubKeyName $RegPath -ValueName 'Enabled' -ValueType DWORD -Value 0;
			}
		}
		catch
		{
			throw $_;
		}
	}
}

function Disable-Protocol
{
	[CmdletBinding()]
	param
	(
	)

	DynamicParam
	{

		$DynamicParameters = @(
			@{
				Name = 'Protocol'
				Type = [array]
				Position = 0
				Mandatory = $true
				ValidateSet = $Protocols.Keys
			},
			@{
				Name = 'Client'
				Type = [switch]
				Position = 1
				Mandatory = $false
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
		$Protocol = $PSBoundParameters['Protocol'];
		$Client = $PSBoundParameters['Client'];
		$ComputerName = $PSBoundParameters['ComputerName'];
	}

	process
	{
		try
		{
			$ErrorActionPreference = 'Stop';
			$Error.Clear();

			Write-Verbose "Protocol     : $($Protocol)";
			Write-Verbose "Client       : $($Client)";
			Write-Verbose "ComputerName : $($ComputerName)";

			if ($Client)
			{
				$RegPath = "$($ProtocolsPath)\$($Protocol)\Client";
			}
			else
			{
				$RegPath = "$($ProtocolsPath)\$($Protocol)\Server";
			}

			Write-Verbose "RegPath      : $($RegPath)";

			if ($ComputerName)
			{
				Set-RegistryValue -Hive HKEY_LOCAL_MACHINE -SubKeyName $RegPath -ValueName 'DisabledByDefault' -ValueType DWORD -Value 0 -ComputerName $ComputerName;
				Set-RegistryValue -Hive HKEY_LOCAL_MACHINE -SubKeyName $RegPath -ValueName 'Enabled' -ValueType DWORD -Value 4294967295 -ComputerName $ComputerName;
			}
			else
			{
				Set-RegistryValue -Hive HKEY_LOCAL_MACHINE -SubKeyName $RegPath -ValueName 'DisabledByDefault' -ValueType DWORD -Value 0;
				Set-RegistryValue -Hive HKEY_LOCAL_MACHINE -SubKeyName $RegPath -ValueName 'Enabled' -ValueType DWORD -Value 4294967295;
			}
		}
		catch
		{
			throw $_;
		}
	}
}

function Get-Protocol
{
	[CmdletBinding()]
	param
	(
	)

	DynamicParam
	{

		$DynamicParameters = @(
			@{
				Name = 'Protocol'
				Type = [array]
				Position = 0
				Mandatory = $true
				ValidateSet = $Protocols.Keys
			},
			@{
				Name = 'Client'
				Type = [switch]
				Position = 1
				Mandatory = $false
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
		$Protocol = $PSBoundParameters['Protocol'];
		$Client = $PSBoundParameters['Client'];
		$ComputerName = $PSBoundParameters['ComputerName'];
	}

	process
	{
		try
		{
			$ErrorActionPreference = 'Stop';
			$Error.Clear();

			Write-Verbose "Protocol     : $($Protocol)";
			Write-Verbose "Client       : $($Client)";
			Write-Verbose "ComputerName : $($ComputerName)";

			if ($Client)
			{
				$RegPath = "$($ProtocolsPath)\$($Protocol)\Client";
			}
			else
			{
				$RegPath = "$($ProtocolsPath)\$($Protocol)\Server";
			}

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

function Test-Protocol
{
	[CmdletBinding()]
	param
	(
	)

	DynamicParam
	{

		$DynamicParameters = @(
			@{
				Name = 'Protocol'
				Type = [array]
				Position = 0
				Mandatory = $true
				ValidateSet = $Protocols.Keys
			},
			@{
				Name = 'Client'
				Type = [switch]
				Position = 1
				Mandatory = $false
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
		$Protocol = $PSBoundParameters['Protocol'];
		$Client = $PSBoundParameters['Client'];
		$ComputerName = $PSBoundParameters['ComputerName'];
	}

	process
	{
		try
		{
			$ErrorActionPreference = 'Stop';
			$Error.Clear();

			Write-Verbose "Protocol     : $($Protocol)";
			Write-Verbose "Client       : $($Client)";
			Write-Verbose "ComputerName : $($ComputerName)";

			if ($Client)
			{
				$RegPath = "$($ProtocolsPath)\$($Protocol)\Client";
			}
			else
			{
				$RegPath = "$($ProtocolsPath)\$($Protocol)\Server";
			}

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
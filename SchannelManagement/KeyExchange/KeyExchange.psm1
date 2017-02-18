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

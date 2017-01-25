$HashesPath = "SYSTEM\CurrentControlSet\Control\SecurityProviders\SCHANNEL\Hashes";
$Hashes = @{};
$Hashes.Add('MD5',$HashesPath);
$Hashes.Add('SHA',$HashesPath);

function New-Hash
{
	[CmdletBinding()]
	param
	(
	)

	DynamicParam
	{

		$DynamicParameters = @(
			@{
				Name = 'Hash'
				Type = [array]
				Position = 0
				Mandatory = $true
				ValidateSet = $Hashes.Keys
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
		$Hash = $PSBoundParameters['Hash'];
		$ComputerName = $PSBoundParameters['ComputerName'];
	}

	process
	{
		try
		{
			$ErrorActionPreference = 'Stop';
			$Error.Clear();

			Write-Verbose "Hash       : $($Hash)";
			Write-Verbose "ComputerName : $($ComputerName)";

			$RegPath = "$($Hashes[$Hash])\$($Hash)";

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

function Remove-Hash
{
	[CmdletBinding()]
	param
	(
	)

	DynamicParam
	{

		$DynamicParameters = @(
			@{
				Name = 'Hash'
				Type = [array]
				Position = 0
				Mandatory = $true
				ValidateSet = $Hashes.Keys
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
		$Hash = $PSBoundParameters['Hash'];
		$ComputerName = $PSBoundParameters['ComputerName'];
	}

	process
	{
		try
		{
			$ErrorActionPreference = 'Stop';
			$Error.Clear();

			Write-Verbose "Hash       : $($Hash)";
			Write-Verbose "ComputerName : $($ComputerName)";

			$RegPath = "$($Hashes[$Hash])\$($Hash)";

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
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
		[Parameter(Mandatory=$false, Position=1)]
		[switch]$Client,
		[Parameter(Mandatory=$false, Position=2)]
		[string]$ComputerName
	)

	DynamicParam
	{
		$ParameterName = 'Protocol';
		$RuntimeParameterDictionary = New-Object System.Management.Automation.RuntimeDefinedParameterDictionary;
		$AttributeCollection = New-Object System.Collections.ObjectModel.Collection[System.Attribute];
		$ParameterAttribute = New-Object System.Management.Automation.ParameterAttribute;
		$ParameterAttribute.Mandatory = $true;
		$ParameterAttribute.Position = 0;
		$AttributeCollection.Add($ParameterAttribute);
		$arrSet = $Protocols.Keys;
		$ValidateSetAttribute = New-Object System.Management.Automation.ValidateSetAttribute($arrSet);
		$AttributeCollection.Add($ValidateSetAttribute);
		$RuntimeParameter = New-Object System.Management.Automation.RuntimeDefinedParameter($ParameterName, [string], $AttributeCollection);
		$RuntimeParameterDictionary.Add($ParameterName, $RuntimeParameter);
		return $RuntimeParameterDictionary;
	}

	begin
	{
		$Protocol = $PSBoundParameters[$ParameterName];
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

function Enable-Protocol
{

}
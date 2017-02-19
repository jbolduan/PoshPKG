@{

	GUID = '2203ef95-fee5-4870-be6a-6cdee0d96199'
	Author = 'Jeff Bolduan'
	Description = 'Cmdlets for handling installer files and getting data from them for PoshPKG'
	CompanyName = 'N/A'
	Copyright = '© 2017 Jeff Bolduan'
	ModuleVersion = '0.0.0.1'
	PowerShellVersion = '5.0'
	HelpInfoUri = "https://github.com/jbolduan/PoshPKG"
	RequiredModules = @(
		@{
			ModuleName="7Zip4PowerShell"
			ModuleVersion="1.8.0"
			Guid="bd4390dc-a8ad-4bce-8d69-f53ccf8e4163"
		}
	)

	NestedModules = @(
		"PoshPKG-InstallerHandlers.psm1"
	)
    
	PrivateData = @{
		PSData = @{
			Tags = @('autopkg', 'packaging', 'sccm', 'config', 'manager', 'automation')
			LicenseUri = 'https://github.com/jbolduan/PoshPKG/blob/master/LICENSE'
			ProjectUri = 'https://github.com/jbolduan/PoshPKG'
			IconUri = 'https://github.com/jbolduan/PoshPKG/blob/master/assets/PoshPKG_icon.png'
		}
	}

	CmdletsToExport = '*'
}
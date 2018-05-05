@{

	GUID = '2203ef95-fee5-4870-be6a-6cdee0d96199'
	Author = 'Jeff Bolduan'
	Description = 'PoshPKG is meant to be a Powershell auto packager like AutoPkg.'
	CompanyName = 'N/A'
	Copyright = '© 2017 Jeff Bolduan'
	ModuleVersion = '0.1.0.0'
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
		"PoshPKG.psm1"
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
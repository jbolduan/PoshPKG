@{

	GUID = '2203ef95-fee5-4870-be6a-6cdee0d96199'
	Author = 'Jeff Bolduan'
	Description = 'Cmdlets for handling installer files and getting data from them for AutoPSPkg'
	CompanyName = 'N/A'
	Copyright = '© 2017 Jeff Bolduan'
	ModuleVersion = '0.0.0.1'
	PowerShellVersion = '5.0'
	HelpInfoUri = "https://github.com/jbolduan/AutoPSPkg"

	NestedModules = @(
		"AutoPSPkg-InstallerHandlers.psm1"
	)
    
	PrivateData = @{
		PSData = @{
			Tags = @('cooltag1', 'cooltag2')
			LicenseUri = 'https://github.com/jbolduan/AutoPSPkg/blob/master/LICENSE'
			ProjectUri = 'https://github.com/jbolduan/AutoPSPkg'
			IconUri = 'https://github.com/jbolduan/AutoPSPkg/blob/master/assets/autopspkg_icon.png'
		}
	}

	CmdletsToExport = '*'
}
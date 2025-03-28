# AppManagement.psd1

@{
    ModuleVersion = '1.0.0'
    GUID = 'e0e3a1a4-12c3-4be3-9c15-d362ac56dcd5'
    Author = 'Your Name'
    Description = 'A PowerShell module for managing application installations and uninstallations, including MSI, EXE, and AppX packages.'
    PowerShellVersion = '5.1'
    FunctionsToExport = @(
        'Install-MSIApplication',
        'Uninstall-MSIApplication',
        'Install-EXEApplication',
        'Uninstall-EXEApplication',
        'Install-AppXPackage',
        'Uninstall-AppXPackage'
    )
    CmdletsToExport = @()
    VariablesToExport = @()
    AliasesToExport = @()
    DscResourcesToExport = @()
}

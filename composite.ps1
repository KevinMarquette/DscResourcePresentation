Configuration Composite {
    Import-DscResource -ModuleName xSystemSecurity
    Node Localhost {
        xIEEsc 'iexplorer' {
            UserRole = 'Administrators'
            IsEnabled = $false
        }
        xUac 'UAC' {
            Setting = "NotifyChanges"
        }
    }
}

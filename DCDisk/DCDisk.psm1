[DscResource()]
class DriveLabel
{
    [DscProperty(Key)]
    [string]
    $DriveLetter

    [DscProperty(Mandatory)]
    [string]
    $Label

    [DriveLabel]Get()
    {
        $volumeInfo = Get-Volume -DriveLetter $this.DriveLetter
        $this.Label = $volumeInfo.FileSystemLabel
        return $this
    }

    [bool]Test()
    {
        $currentLabel = (Get-Volume -DriveLetter $this.DriveLetter).FileSystemLabel
        Write-Verbose -Message "Current Label is [$currentLabel], Expecting [$($this.Label)]"
        return ($currentLabel -eq $this.Label)
    }

    [void]Set()
    {
        Write-Verbose -Message "Adding label [$($this.Label)] to [$($this.DriveLetter)] Drive"
        Get-Volume -DriveLetter $this.DriveLetter  |
            Set-Volume -NewFileSystemLabel $this.Label
    }
}

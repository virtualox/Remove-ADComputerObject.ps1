<#
.SYNOPSIS
    This script removes a computer object from Active Directory.

.DESCRIPTION
    This script uses the Remove-ADComputer cmdlet to remove the specified computer object from Active Directory.
    The script provides appropriate error handling and output messages.

.PARAMETER ComputerName
    The hostname of the computer object to be removed from Active Directory.

.EXAMPLE
    Remove-ADComputerObject -ComputerName "Computer01"
#>
function Remove-ADComputerObject {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory = $True, ValueFromPipeline = $true, ValueFromPipelineByPropertyName = $true, HelpMessage = 'What is the hostname of the computer to delete?')]
        [string]$ComputerName
    )

    process {
        if ($ComputerName) {
            try {
                Remove-ADComputer -Identity $ComputerName -Confirm:$false -ErrorAction Stop
                $successMessage = "A Computer object is deleted from AD: $ComputerName"
                Write-Host $successMessage -ForegroundColor Green
                $successMessage | Set-Clipboard
            }
            catch [Microsoft.ActiveDirectory.Management.ADIdentityNotFoundException] {
                Write-Warning "Computer object '$ComputerName' not found in AD!"
            }
            catch {
                Write-Warning "An error occurred: $_"
            }
        } else {
            Write-Warning "No Computer name entered"
        }
    }
}

if (-not $MyInvocation.ExpectingInput) {
    $computerName = Read-Host -Prompt "What is the hostname of the computer to delete?"
    Remove-ADComputerObject -ComputerName $computerName
}

# Remove-ADComputerObject Script

This PowerShell script removes computer objects from Active Directory with error handling and output messages.

## Features

- Remove computer objects from Active Directory
- Error handling for cases when the computer object is not found or an unexpected error occurs
- Output messages with color-coded information
- Success message copied to the clipboard

## Requirements

- PowerShell 3.0 or higher
- Active Directory PowerShell module (RSAT-AD-PowerShell)

## Usage

### Example

To remove a computer object from Active Directory, run the following command:

```powershell
Remove-ADComputerObject -ComputerName "Computer01"
```

### Parameters
- **`ComputerName`**: The hostname of the computer object to be removed from Active Directory.

## Contributing
Contributions are welcome! Please feel free to submit a Pull Request or open an Issue for any improvements or bug fixes.

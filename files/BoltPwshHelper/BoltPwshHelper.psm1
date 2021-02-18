<#
.SYNOPSIS
  Creates a properly formatted Bolt task error
.DESCRIPTION
  Creates a properly formatted Bolt task error from a message string and/or an Exception object
.PARAMETER Message
  The custom message that describes the error. Be as specific as possible
.PARAMETER Exception
  An Exception object to return as a Bolt formatted error message
.PARAMETER Kind
  The Bolt Error type
#>
function Write-BoltError {
  [CmdletBinding()]
  param(
    [Parameter()]
    [ValidateNotNullOrEmpty()]
    [string]
    $Message,

    [Parameter()]
    [ValidateNotNullOrEmpty()]
    [string]
    $Kind = 'puppetlabs.task/task-error',

    [Parameter()]
    [ValidateNotNull()]
    [Exception]
    $Exception
  )

  if ($Exception) {
    $detailedInfo = $Exception
  }
  else {
    $detailedInfo = ''
  }

  $errorReturn = @{
    _error = @{
      msg     = $Message
      kind    = $kind
      details = @{
        detailedInfo = $detailedInfo
        exitcode     = 1
      }
    }
  }

  Write-Output ($errorReturn | ConvertTo-JSON -depth 99)
}

<#
.SYNOPSIS
  Creates a properly formatted json string for Bolt
.DESCRIPTION
  Creates a properly formatted json string with all special characters escaped
.PARAMETER Content
  The text to format
#>
function ConvertTo-JsonString {
  param($Content)
  (($Content -replace '\\', '\\') -replace '\"', '\"') -replace '[\u0000-\u001F]', ' '
}

Export-ModuleMember -Function *

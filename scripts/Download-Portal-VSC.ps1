<#
    Permission is hereby granted, free of charge, to any person obtaining a copy
    of this software and associated documentation files (the "Software"), to deal
    in the Software without restriction, including without limitation the rights
    to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
    copies of the Software, and to permit persons to whom the Software is
    furnished to do so, subject to the following conditions:

    The above copyright notice and this permission notice shall be included in all
    copies or substantial portions of the Software.
    
    THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
    IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
    FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
    AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
    LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
    OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
    SOFTWARE.
#>
#region Parameters
[CmdletBinding()]
param (
    # Enter the domain name of the environment to connect to. Example: For https://contoso.crm.dynamics.com/ the domain name would be contoso.
    [Parameter()]
    [string]$DomainName,
    # Enter the domain suffix of the environment to connect to. Example: For https://contoso.crm.dynamics.com/ the domain name would be crm.dynamics.com.
    [Parameter()]
    [string]$DomainSuffix,
    # If connecting with Service Principle, Enter the Client ID for the Service Principle as a string. Otherwise, leave blank.
    [Parameter()]
    [string]$ClientID,
    # If connecting with Service Principle, Enter the Client Secret for the Service Principle as a string. Otherwise, leave blank.
    [Parameter(Mandatory)]
    [string]$ClientSecret,
    # Enter the TenantID of the Organization to connect to.
    [Parameter()]
    [string]$TenantId,
    # Enter the id of the web sit (portal). Obtained through 'pac paportal list' command.
    [Parameter()]
    [string]$WebsiteId,
    # Enter the source path to the source folder. Assumes child folders or Schemas and Data.
    [Parameter()]
    [string]$SourcePath = ".\"
)
#endregion
#region Install Power Platform CLI tools
    # Have Power Platform CLI installed local.
#endregion
#region enable Telemetry
pac telemetry enable
#endregion
#region Create Power Platform CLI Profile
pac auth create --url "https://$DomainName.$DomainSuffix/" --applicationId "$ClientId" --clientSecret "$ClientSecret" --tenant "$TenantId"
#endregion
#region Download Portal
pac paportal download --path "$SourcePath\portalSrc\" --webSiteId "$WebsiteId" --overwrite true 
#endregion
#region Clear Profiles
pac auth clear
#endregion
Function Global:Get-IpChecklist
{
    Param
    (
        [Parameter(Position=0 , Mandatory = $true, ValueFromPipeline = $true)]
        $CheckType,
 
        [Parameter(Position=1 , Mandatory = $true, ValueFromPipeline = $true)]
        $CheckValue,
 
        [Parameter(Position=2 , Mandatory = $false, ValueFromPipeline = $true)]
        $ConvertTime,
 
        [Parameter(Position=3 , Mandatory = $false, ValueFromPipeline = $true)]
        $ConsoleMode
    )
 
    Process
    {
        If ($CheckType -eq "ip")
        {
            $ApiValueString1 = "?"+$CheckType+"="+$CheckValue+"&usernames=1&emails=1";
        }
 
        Else 
        {
            $ApiValueString1 = "?"+$CheckType+"="+$CheckValue;
        }
 
        $IpChecklistJson = Invoke-WebRequest -Uri http://api.ip-checklist.com/$ApiValueString1 | ConvertFrom-Json;
 
        If ($CheckType -eq "ip")
        {
            $Global:IpChecklistOutput_Errors        = $IpChecklistJson.errors;
            $Global:IpChecklistOutput_Id            = $IpChecklistJson.id;
            $Global:IpChecklistOutput_LastUpdate    = $IpChecklistJson.last_update;
            $Global:IpChecklistOutput_Reports       = $IpChecklistJson.reports;
            $Global:IpChecklistOutput_Ip            = $IpChecklistJson.ip;
            $Global:IpChecklistOutput_Provider      = $IpChecklistJson.provider;
            $Global:IpChecklistOutput_Organisation  = $IpChecklistJson.organisation;
            $Global:IpChecklistOutput_Region        = $IpChecklistJson.region;
            $Global:IpChecklistOutput_CountryCode   = $IpChecklistJson.countrycode;
            $Global:IpChecklistOutput_AllEmails     = $IpChecklistJson.emails.all;
            $Global:IpChecklistOutput_EmailsCount   = $IpChecklistJson.emails.count;
            $Global:IpChecklistOutput_AllUsers      = $IpChecklistJson.usernames.all;
            $Global:IpChecklistOutput_UsersCount    = $IpChecklistJson.usernames.count;

            $IpChecklistSearchTypeString = $IpChecklistOutput_Ip;
        }
 
        ElseIf ($CheckType -eq "username")
        {
            $Global:IpChecklistOutput_Errors        = $IpChecklistJson.username.errors;
            $Global:IpChecklistOutput_Id            = $IpChecklistJson.username.id;
            $Global:IpChecklistOutput_LastUpdate    = $IpChecklistJson.username.last_update;
            $Global:IpChecklistOutput_Reports       = $IpChecklistJson.username.reports;
            $Global:IpChecklistOutput_Ip            = $IpChecklistJson.username.ip;
            $Global:IpChecklistOutput_Username      = $IpChecklistJson.username.username;
            $Global:IpChecklistOutput_Provider      = $IpChecklistJson.username.provider;
            $Global:IpChecklistOutput_Organisation  = $IpChecklistJson.username.organisation;
            $Global:IpChecklistOutput_Region        = $IpChecklistJson.username.region;
            $Global:IpChecklistOutput_CountryCode   = $IpChecklistJson.username.countrycode;

            $IpChecklistSearchTypeString = $IpChecklistOutput_Username;
        }
 
        ElseIf ($CheckType -eq "email")
        {
            $Global:IpChecklistOutput_Errors        = $IpChecklistJson.email.errors;
            $Global:IpChecklistOutput_Id            = $IpChecklistJson.email.id;
            $Global:IpChecklistOutput_LastUpdate    = $IpChecklistJson.email.last_update;
            $Global:IpChecklistOutput_Reports       = $IpChecklistJson.email.reports;
            $Global:IpChecklistOutput_Ip            = $IpChecklistJson.email.ip;
            $Global:IpChecklistOutput_Email         = $IpChecklistJson.email.email;
            $Global:IpChecklistOutput_Provider      = $IpChecklistJson.email.provider;
            $Global:IpChecklistOutput_Organisation  = $IpChecklistJson.email.organisation;
            $Global:IpChecklistOutput_Region        = $IpChecklistJson.email.region;
            $Global:IpChecklistOutput_CountryCode   = $IpChecklistJson.email.countrycode;

            $IpChecklistSearchTypeString = $IpChecklistOutput_Email;
        }
 
        If ($ConvertTime -eq "true")
        {
            $IpChecklistUnixEpochStart = New-Object -Type DateTime -ArgumentList 1970, 1, 1, 0, 0, 0, 0;
            $IpChecklistUnixEpochNow = $IpChecklistUnixEpochStart.AddSeconds($IpChecklistJson.last_update);
 
            $Global:IpChecklistOutput_LastUpdate = $IpChecklistUnixEpochNow;
        }
 
        $IpChecklistResult = $IpChecklistSearchTypeString -match $CheckValue;
 
        If ($ConsoleMode -eq "silent") {  } Else { Write-Host $IpChecklistResult; }    
    }
}

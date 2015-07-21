@echo off

REM print server hostname to file
hostname
echo ************************************************
REM more ports = increase in incoming transactions
REM values Start Port = 10000, Number of Ports = 55535 
echo value(s): Start Port = 10000, Number of Ports = 55535
netsh int ipv4 show dynamicport tcp

echo ************************************************
REM amount of time to wait before OS closes TIMED_WAIT connections. This frees up more ports to take more incoming connections
REM value should be TcpTimedWaitDelay    REG_DWORD    0x1e = 30
echo value(s): TcpTimedWaitDelay    REG_DWORD    0x1e = 30
REG QUERY HKLM\System\CurrentControlSet\services\Tcpip\Parameters /v TcpTimedWaitDelay

echo ************************************************
REM Increase MaxUserPort to 65534 from default 5000 - Userports are ports for connecting to ( memcache,database,external http,rabbit,splunk,appD,errorsvc,openNMS, etc. 
REM value should be MaxUserPort    REG_DWORD    0xdcef = 56559
echo valuei(s): MaxUserPort    REG_DWORD    0xdcef = 56559
REG QUERY HKLM\System\CurrentControlSet\services\Tcpip\Parameters /v MaxUserPort 

echo ************************************************
REM this is a default setting for IIS – we chose to make this explicit so there was no gray area here
REM look for value /enableKernelCache:true
echo value(s): enableKernelCache:true
C:\windows\system32\inetsrv\appcmd list config -section:system.webServer/caching 

echo ************************************************
REM remove /TravelMidTier service as it hasn’t run on the UI tier in some time…
REM should be removed --/app.name:"Default Web Site"/TravelMidTier
REM result should be empty
echo result should be empty
C:\windows\system32\inetsrv\appcmd list apppool "TravelMidTier"  

echo ************************************************
REM set Max Worker Threads on Classic ASP App Pool back to 2 as asp does not handle async requests well and one bad request can lock a whole server:
REM DotNet4 should be 1
echo value(s): DefaultAppPool - 2 DotNet4 - 1 
C:\windows\system32\inetsrv\appcmd list apppool "DefaultAppPool" /config 
C:\windows\system32\inetsrv\appcmd list apppool "DotNet4" /config

echo ************************************************
REM IIS was not maximizing the amount of memory it had available and would therefore crash more often at a lower setting
REM look for value /percentagePhysicalMemoryUsedLimit:75
echo value(s): percentagePhysicalMemoryUsedLimit:75
C:\windows\system32\inetsrv\appcmd  list config -section:system.web/caching/cache 

echo ************************************************
REM this setting has to deal with IIS bundling packets at the NIC layer before sending off to downstream systems. This impacted calls to Memcached – we saw up to a 10% decrease in CPU usage with this disabled
REM should be removed/enableNagling:false
echo value(s): enableNagling:false
C:\windows\system32\inetsrv\appcmd list config -section:system.webServer/serverRuntime 

echo ************************************************
REM increase the amount of threads available to process at one time; default: 25
REM look for /limits.processorThreadMax:100
REM look for value /cache.maxDiskTemplateCacheFiles:"4000" 
REM look for value /cache.scriptFileCacheSize:"4500" 
REM look for value /cache.scriptEngineCacheMax:"1000"
echo value(s): limits.processorThreadMax:100, cache.maxDiskTemplateCacheFiles:"4000",
echo cache.scriptFileCacheSize:"4500", cache.scriptEngineCacheMax:"1000"
C:\windows\system32\inetsrv\appcmd list config -section:system.webServer/asp 

echo ************************************************
REM check the IIS keepalive settings
echo value(s) should be the same (true | false)
C:\windows\system32\inetsrv\appcmd list config -section:httpProtocol

echo ************************************************
REM Grant Permissions to the IIS USERS Group to the TEMP Folders to Fix asp cache problems
REM should be /grant:r "Administrators:(OI)(CI)(F)"
echo values(s): grant:r "Administrators:(OI)(CI)(F)"
echo grant:r "SYSTEM:(OI)(CI)(F)"
echo grant:r "IIS_IUSRS:(OI)(CI)(F)"
icacls "C:\inetpub\temp\ASP Compiled Templates"

REM should be /grant:r "IIS_IUSRS:(OI)(CI)(F)"
echo value(s): grant:r "IIS_IUSRS:(OI)(CI)(F)"
icacls "C:\inetpub\temp\IIS Temporary Compressed Files"

echo ************************************************
REM List contents of the following directories, earlier they were deleted, but checking them 
REM Delete the old temp files C:\windows\Microsoft.NET\framework64\ created before SA_UI_1 was the service account circa 2012
echo If any files are listed they should be relatively easy
DIR "C:\Windows\Microsoft.NET\Framework64\v4.0.30319\Temporary ASP.NET Files\"
DIR "C:\Windows\Microsoft.NET\Framework64\v2.0.50727\Temporary ASP.NET Files\"

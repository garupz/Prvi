
#inputFile
$inputFilePath = "C:\Users\Martin\Desktop\Powershell\IB 11-0 LSv11-01_en-us – kopija.xlf"
$languagesToProcess = @{
                        1060 = 'sl-SI'            #SLV
                        }

#has to have \ at the end and must exists
$outputFolderPath = "C:\Users\prevod\"
#scripta
Write-Host "Reading file"
Write-Host "Script started at $(Get-Date)"

$charactersToReplace = @{'<' = '&lt;'
                         '&' = '&amp;'
                         '>' = '&gt;'
                         '"' = '&quot;'
                         '''' = '&apos;'   
                        }
$sourceFile = Get-Content $inputFilePath -Encoding UTF8
#open file and read all lines
Write-Host "Creating Prevod.txt"
Write-host "$(Get-Date)"


$tagSkupaj = @()


$targetTMX += foreach ($sourceFileLine in $sourceFile){
$counter++
##$currentTime = Get-Date

if ($sourceFileLine.StartsWith("<trans-unit")){

$sourceFileLineSplit = ($sourceFileLine -Split "id=""",2) -Split """",2
$tag1 = $sourceFileLineSplit[1]

$sourceFileLineSplit = ($sourceFileLine -Split "<target>",2) -Split "</target>",2
$tag2 = $sourceFileLineSplit[1]

$tagSkupaj += $tag1 + ":" + $tag2
}
 }
Write-host "Writing to file"
$tagSkupaj | Out-File -filepath C:\Dokument\Prevodi\Prevod.txt
Write-Host "Script finished at $(Get-Date)"
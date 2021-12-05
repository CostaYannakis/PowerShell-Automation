# import working file
$file = Import-Csv \main.csv
# Variable
$CurrentDateTime = Get-Date
#Main Function to check event is within time frame

Function Check-Event($array,$today,$recipient,$sender,$Subject,$Body,$SMTP)
   {
    $event = [DateTime]($array.Date + " " + $array.Time)
  
        if(($event.Year -eq $today.Year) -and ($event.DayOfYear -eq $today.DayofYear))
        {
      Send-MailMessage -To $recipient -From $sender -Subject $Subject -Body $Body -SmtpServer $SMTP -BodyAsHtml  }
    Check-Event $file $CurrentDateTime "insert recipient email here" "insert sender email here" $file.Message "insert body of email here " "insert SMTP here"
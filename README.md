# Running-instance-cronjob
Cronjob for checking running EC2

step 1.Create a shell file 
step 2. write the shell script file provided 
 
What inside this shell script 

OUTPUT_FILE="/home/nik/Desktop/ec2-running-instances.log"
•	Variable Definition: Creates a variable OUTPUT_FILE that holds the path to the log file where the EC2 instance details will be saved.
•	Makes it easy to change the output location in one place if needed.

echo "------ $(date) ------" >> $OUTPUT_FILE
•	Appends the current date and time to the log file.
•	Useful for tracking when the script was executed.
•	$(date) runs the date command and inserts the result.

aws ec2 describe-instances \ ...
•	This is the core command that retrieves running EC2 instance information.

>> $OUTPUT_FILE
•	Appends the output to the file defined earlier (/home/nik/Desktop/ec2-running-instances.log).
Make the file executable using chmod
 
Define cron job using the command crontab -e 
 
Edit the file with  
•	* * * * * /home/nik/Desktop/Inspectec2.sh 
will run every minute …..
 

•	* meaning every so  if you want to run a cron job in every day morning 7 am you should use like 
0 7 * * * 
Meaning:
0 → At minute 0
7 → At hour 7 AM
* → Every day of the month
* → Every month
* → Every day of the week



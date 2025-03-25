# 🚀 **AWS Resource Tracker**

## 📌 **Project Description**
The **AWS Resource Tracker** is a **Bash script** that automatically tracks and reports on **AWS resources**, including:  
✅ **EC2 Instances**  
✅ **S3 Buckets**  
✅ **Lambda Functions**  
✅ **IAM Users**  

This script is designed for **AWS administrators** and **DevOps engineers** who need a **daily summary of AWS infrastructure usage**.  

It fetches details using **AWS CLI**, formats the output into a structured report, and stores it in a file for easy review.  
🔹 **Automate** the execution with **Cron jobs** for daily monitoring.  

---

## 🛠️ **Features**
- ✔️ **Tracks AWS Resources** (EC2, S3, Lambda, IAM Users)  
- ✔️ **Generates a structured daily report**  
- ✔️ **Uses AWS CLI & jq** for efficient data retrieval  
- ✔️ **Automates execution using Cron jobs**  
- ✔️ **Stores results in a log file for review**  

---

## ⚙️ **Technologies Used**
- **Bash Script**  
- **AWS CLI**  
- **jq (for JSON parsing)**  
- **GitHub (for version control)**  
- **Cron Jobs (for automation)**  

---

## 🚀 **Setup & Usage**

### ✅ **Prerequisites**
Ensure you have the following installed and configured:  

###  **Install & Configure AWS CLI**
aws configure

### **Install jq (If not installed)**

Ubuntu/Debian 
sudo apt install jq  

MacOS
brew install jq

---

## ⏳ **Automate with Cron Job (Runs daily at 8 AM)**
To schedule the script to run automatically every day at 8 AM, follow these steps:

1️⃣ Open the Crontab Editor
crontab -e

2️⃣ Add the following line at the end of the file:
0 8 * * * /path/to/track_aws_resources.sh

3️⃣ Save and exit. The script will now run daily at 8 AM.

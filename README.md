# 🪵 LogHunter: Automated Log Analysis Utility

**LogHunter** is a Bash-based automation tool designed to parse, filter, and aggregate system logs[cite: 1]. It streamlines the debugging process by isolating specific severity levels and providing a frequency-based report of unique events.

## 🎯 Purpose
In complex systems, logs can be overwhelming. LogHunter allows a user to:
* **Isolate Issues:** Filter logs by severity (INFO, WARN, ERROR).
* **Analyze Frequency:** Count how many times a specific error occurs to prioritize high-impact issues.
* **Automate Reporting:** Generate timestamped text reports for audit trails.

## 🛠️ Usage
The script requires two positional arguments:

```bash
./loghunter.sh <file_path> <severity_level>
```

### Example
To analyze connection failures in an application log:
```bash
./loghunter.sh sample-logs/app.log ERROR
```

### Example Output
The tool strips timestamps and metadata to group identical messages:
```text
3  Failed to connect to database: timeout after 30s
1  SSL certificate expires in 3 days  
1  Nginx process crashed — restarting
```

## ⚙️ Technical Implementation
* **Dynamic Filtering:** Uses `grep -i` for case-insensitive severity matching[cite: 1].
* **Data Transformation:** Leverages `awk` to remove variable timestamps, allowing for accurate grouping of unique events[cite: 1].
* **Frequency Mapping:** Utilizes `sort | uniq -c` to generate a count of occurrences, followed by `sort -rn` to display the most frequent issues first[cite: 1].
* **Persistent Storage:** Automatically saves results into a `./report-files/` directory with a unique timestamp (`YYYY-MM-DD_HH-MM`).

## 🚀 Future Roadmap
As I continue building my skills in **Cloud Infrastructure**, I plan to:
1.  **Input Validation:** Add a check to verify if the severity level provided is valid.
2.  **Batch Processing:** Enable the script to scan multiple log files within a directory simultaneously.
3.  **Scheduling:** Set up a `cron` job to automate log rotation and reporting on a fixed schedule.
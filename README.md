# Coding-lab_Group32
## Kenyatta National Hospital (KNH) Digital Infrastructure

A shell scripting project simulating a DevOps environment for
Kenyatta National Hospital (KNH). The system secures and manages
data flow from 12 critical sensors tracking Heart Rate, Temperature,
and Water Usage across the facility.

---

## Group Members & Roles

Joy Wangui Macharia

Anaise Umugwaneza

Philbert Iradukunda

Alvin Mudaheranwa

| Member  | Role 								                      |
|---------|-------------------------------------------------------------------------------------------|
| Joy     | Architect: initialize_system() in hospital_admin.sh                                       |
| Anaise  | Security Lead & Orchestrator: wrote secure_data() and execution logic in hospital_admin.sh|
| Philbert| Clinical Analyst: wrote hospital_analysis.sh                                              |
| Alvin   | Archivist: wrote hospital_archive.sh                                                      |

---

## Project Structure
```
Coding-lab_Group32/
├── hospital_system.py      # The Engine: core system logic powering the hospital application
├── hospital_admin.sh       # Automated setup: handles environment and service setup
├── hospital_archive.sh     # Archive script: handles data archiving operations
├── hospital_analysis.sh    # Analysis script: handles reporting and analytics
├── .gitignore              # Excludes logs and generated reports from version control
└── README.md               # Group roles, instructions, and project overview
```
---

## How to Run

### 1. Start the data engine
```bash
python3 hospital_system.py start
```

### 2. Set up the environment
```bash
bash hospital_admin.sh
```

### 3. Analyze live sensor data
```bash
bash hospital_analysis.sh
```

### 4. Archive the logs
```bash
bash hospital_archive.sh
```

### 5. Stop the engine when done
```bash
python3 hospital_system.py stop
```

---

## Script Details

### hospital_admin.sh
- Checks for and creates `active_logs/`, `archived_logs/`, and `reports/`
  directories if they do not exist
- Secures `active_logs/` with `chmod 700` so only the owner
  can read and write sensitive medical data
- Prints a confirmation message with timestamp once the
  environment is secured

### hospital_archive.sh
- Moves all current logs from `active_logs/` to `archived_logs/`
  and renames them with a timestamp
- Example: `heart_rate_log.log` → `heart_rate_log_20260605_1400.log`
- Recreates empty log files in `active_logs/` using `touch` so
  the engine continues recording without interruption

### hospital_analysis.sh
- Scans Heart Rate and Temperature logs for CRITICAL readings
  using `grep`
- Extracts Timestamp, Device_ID, and Value using `awk` and saves
  them to `reports/critical_alerts.txt`
- Calculates the average water usage for `ICU_WATER_RESERVE`
  and prints a formatted summary to the screen

---

## Git Collaboration
- Each member worked on their own branch
- Branches merged into `main` via pull requests
- Every member maintained at least 3 commits reflecting
  their individual contributions

---

## Notes
- `active_logs/`, `archived_logs/`, and `reports/` are excluded
  from version control via `.gitignore` to protect patient data
- Always run `hospital_admin.sh` before any other script to
  ensure all required directories exist

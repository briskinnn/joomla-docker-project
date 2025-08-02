# Joomla Docker Project

This project sets up a full Joomla CMS environment using Docker. It includes a MySQL container, persistent volumes, and automation scripts for setup, backup, and restore.

---

## 📦 Included Components

- `joomla` container from the official image
- `mysql:5.7` container with Docker-managed volume
- `volumes/` folder for persistent data (auto-created)
- `scripts/` folder with helper Bash scripts

---

## 🛠 How to Run

1. Clone the repository:
   ```bash
   git clone https://github.com/YOUR_USERNAME/joomla-docker-project.git
   cd joomla-docker-project
   ```

2. Start the system:
   ```bash
   docker compose up
   ```

3. Open in browser:
   - Site: [http://localhost:8000](http://localhost:8000)
   - Admin: [http://localhost:8000/administrator](http://localhost:8000)

> 💡 On first run, Joomla will guide you through setup (site name, admin user, DB connection).

---

## 📁 Volumes Folder Info

You’ll notice that the `volumes/` folder is in `.gitignore`.  
Docker automatically creates the following when you run the system:

```
volumes/
├── joomla_data/   → Joomla website files
└── mysql_data/    → MySQL database files
```

There’s no need to manually create or track them in Git.

---

##  Scripts

Located in the `scripts/` folder:

- `setup.sh` → Starts containers
- `backup.sh` → Dumps MySQL to `backup/mysql-backup-*.sql`
- `restore.sh` → Loads from `.sql` file into running MySQL container
- `cleanup.sh` → Stops and removes containers + deletes volume contents

All scripts are executable (`chmod +x`) and written in standard Bash.

---

##  Testing

To simulate a full wipe and restore:
1. Run `scripts/backup.sh`
2. Run `scripts/cleanup.sh`
3. Run `scripts/setup.sh`
4. Run `scripts/restore.sh`
5. Refresh the site — everything should be restored

---

##  Requirements

- Docker Desktop installed and running
- Git Bash or WSL recommended for script execution

---

##  Notes

- Articles in this Joomla setup are based on Linux/Bash/Unix terms from the course's "term vocab" list on Moodle.
- The Home page is configured to list all article content using the Category Blog view.
- The entire system is portable and rebuildable using this repo.

---



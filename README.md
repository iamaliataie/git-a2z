# 🔤 Alphabetical Git Pusher

Automate `git add`, commit, and push operations for folders in **alphabetical order** (a–z).  
Perfect for large projects with many independent directories — clean, modular, and organized version control.

---

## 🚀 What It Does

This script loops through folders (starting with `a`, then `b`, and so on), and for each group:

1. **Stages** all folders that have changes
2. **Commits** them with a clear message
3. **Pushes** to your branch (default: `main`)
4. **Skips** folders with no changes
5. Avoids duplicate pushes for already committed code

---

## 📂 Example Use Case

If your project has this structure:

components/ ├── api/ ├── auth/ ├── blog/ ├── dashboard/ ├── utils/


The script will:
- Add, commit, and push `api/` and `auth/` under `'a'`
- Then do `blog/` under `'b'`
- Then `dashboard/` under `'d'`... and so on.

---

## 🛠️ Setup

1. Clone this repo or copy the script
2. Edit the script to set your base path:
   ```bash
   BASE_PATH=~/projects/my-repo/modules
3. Edit the script to set your base path:
    ```bash
   chmod +x git_a2z.sh
3. Run it:
    ```bash
    ./git_a2z.sh

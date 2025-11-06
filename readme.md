![logo](https://github.com/nomankarim8/nomankarim8/blob/main/image.png?raw=true)


 


# Admin Panel Finder

This is a simple Python script that helps you find admin panel login pages of websites by checking various common URLs.

## Features
✅ Supports **HTTP & HTTPS** for better compatibility  
✅ Displays **HTTP error codes** for debugging  
✅ Handles **missing files gracefully**  
✅ Simple & lightweight script

## Requirements
- Python 3.x
- `link.txt` file containing potential admin panel paths (one per line)

## Installation & Usage
### 1️⃣ Clone the Repository
```bash
$ git clone https://github.com/nomankarim8/admin-panel-finder.git
$ cd admin-panel-finder
```

### 2️⃣ Install Dependencies (if needed)
No extra dependencies are required; just ensure Python 3 is installed.

### 3️⃣ Add Admin Panel Paths
Create a `link.txt` file and add possible admin panel URLs (one per line), e.g.:
```
admin
admin/login.php
admincp
administrator
```

### 4️⃣ Run the Script
```bash
$ python3 finder.py
```

### 5️⃣ Enter the Target Website
When prompted, enter the website domain (e.g., `example.com` or `www.example.com`).

## Example Output
```
Enter Site Name (ex: example.com or www.example.com): example.com

Checking for available admin panels...

[OK] => https://example.com/admin
[403] https://example.com/admincp - Forbidden
[404] https://example.com/administrator - Not Found
```

## Legal Disclaimer
⚠️ **This tool is intended for ethical security testing and educational purposes only.** Unauthorized scanning of websites without permission is illegal and punishable by law. Always obtain proper authorization before using this tool.

## Author
👤 **Noman Karim**  
🔗 GitHub: [nomankarim8](https://github.com/nomankarim8)

---
⭐ If you found this tool useful, don't forget to star the repository!


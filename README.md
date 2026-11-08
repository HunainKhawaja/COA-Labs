# CO-Lab — Computer Organization & Architecture Labs (Fall 2026)

This repository organizes the source **as transcribed from the nine submitted PDF reports**.
No source-code bug fixes, missing instructions, comments, or features have been added.

- `Lab_01`–`Lab_03`: Verilog (`.v`) gate, dataflow and behavioral examples.
- `Lab_04`–`Lab_06`: RISC-V assembly (`.s`) for the Venus simulator.
- `Lab_07`–`Lab_09`: Verilog (`.v`) ALU, program counter, instruction memory and register file.

Each `Lab_XX/lXtY/` folder follows the naming format you requested: `l1t1`, `l1t2`, `l3t2` (Lab X, Task Y). Individual source files use `l1t1.v` or `l4t1.s`; if one task contains more than one independent source, they use a distinguishing suffix like `l1t1_and_gatelevel.v` to avoid overwriting programs. Only filenames and task-folder names have changed; source-code contents are byte-for-byte unchanged. Keep independent files separate when simulating: many reuse top-level module/testbench names.

The source is not guaranteed to compile or execute: errors and unusual formatting already present in the PDFs are deliberately preserved. See `EXTRACTION_NOTES.md` for tasks without code and source-layout issues.

## Upload this folder to GitHub (Windows / PowerShell)

1. Open GitHub, create a new empty repository called `COA-Labs`, choosing **not** to initialize a README, `.gitignore` or license.
2. Unzip this download; open the extracted `CO-Lab` folder in VS Code.
3. Open **Terminal > New Terminal**, then run:

```powershell
git init
git add .
git commit -m "Add COA labs 1 to 9"
git branch -M main
git remote add origin https://github.com/HunainKhawaja/COA-Labs.git
git push -u origin main
```

Use the GitHub username shown in the command, or replace it if you use another account. GitHub may ask you to log in through the browser / Git Credential Manager. After future changes, run `git add .`, `git commit -m "Add new lab"`, then `git push`.

The final integrated lab is **not included** because no final lab instructions or code were supplied. Add its actual assignment and source later without changing the extracted existing tasks.

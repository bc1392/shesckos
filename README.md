# SheskOS
**SH**-based D**esk**top "**O**perating **S**ystem".

---

### Preperation & Startup
Before attempting to start SheskOS, make sure to execute `sh make.sh` in the root of this repository to prepare the SheskOS source for execute. To start SheskOS, execute the `run.sh` script, also in this repository's root directory.

---

### Changelog
- **Version 0.0.6pre1**
    - Integrated login module.
    - Added placeholder for login shell.
    - Integrated locking functionality.
- **Version 0.0.5c**
    - Removed extra test application.
    - Created System Viewer.
    - Changed `hello` application dialog settings.
- **Version 0.0.5b**
    - Added another test application.
    - Added check for `bash` requirement.
- **Version 0.0.5a**
    - Tweaked make script.
- **Version 0.0.5**
    - Incorperated a better menu system.
    - Added dynamic application listing <small>(this took way too long)</small>.
- **Version 0.0.4**
    - Moved system modules from `system` to `modules`.
    - Added `appexec` library.
    - Upgraded make script.
    - Slimmed output on boot, more info now in log.
    - Made log easier to read.
    - Created `hello` application to test `appexec`.
    - Integrated `DIALOGRC` configuration.
- **Version 0.0.3**
    - Got rid of the need for check scripts.
    - Migrated core checking to `dpkg`.
    - Tweaked shutdown.
- **Version 0.0.2**
    - Added logging functionality.
- **Version 0.0.1**
    - Created the "kernal".
    - Added core resources and libraries.
    - Added system modules.
    - Created make script.
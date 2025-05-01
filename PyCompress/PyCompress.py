import customtkinter as ctk
import tkinter as tk
from tkinter import filedialog
import os
import sys
import subprocess
import threading
from datetime import datetime

ctk.set_appearance_mode("system")  # Modes: system (default), light, dark
ctk.set_default_color_theme("green")  # Themes: blue (default), dark-blue, green

def start_compress():
    # Disable UI elements here if needed
    threading.Thread(target=compress_task, daemon=True).start()

def compress_task():
    btn_Compress.configure(state="disabled")
    source_directory = source_input.get()
    output_directory = output_input.get() if chkbox.get() == "on" else source_directory

    log_file_path = os.path.join(output_directory, "compression_log.txt")
    with open(log_file_path, "a") as log:
        log.write(f"\n=== Compression Initialized - {datetime.now()} ===\n")

    root_directory_list = os.listdir(source_directory)
    with open(log_file_path, "a") as log:
        log.write(f"Found {len(root_directory_list)} objects - {datetime.now()}\n")

    total_i = 0
    for item in root_directory_list:
        total_i += 1
        progress_total.after(0, progress_total.set, total_i / len(root_directory_list))

        item_path = os.path.join(source_directory, item).replace("\\", "/")
        if os.path.isdir(item_path):
            with open(log_file_path, "a") as log:
                log.write(f"\nCompressing {item} - {datetime.now()}\n")

            with open(log_file_path, "a") as log:
                log.write(f"Zip resources initialized - {datetime.now()}\n")

            zip_path = os.path.join(item_path, item + ".zip").replace("\\", "/")
            zip_app_path = os.path.abspath(resource_path(os.path.join("resources", "7zip", "7za.exe")))
            assert os.path.isfile(zip_app_path), f"7za.exe not found at: {zip_app_path}"

            exclusion_list = ["/xml", "/pdf"]
            zip_list = []

            # Consider adjusting to use only files and gather every file.  Then ignore the exlusions later when processing the files.
            #for root, dirs, files in os.walk(item_path):
            #    relative_root = os.path.relpath(root, item_path).replace("\\", "/")
            #    if any(excluded.lower() in relative_root.lower() for excluded in exclusion_list):
            #        continue
            #    for file in files:
            #        if file != f"{item}.zip":
            #            file_path = os.path.join(root, file)
            #            relative_path = os.path.relpath(file_path, item_path)
            #            # IF path !contains exclusion - append
            #            zip_list.append(relative_path)
            
            # Consider adjusting to use only files and gather every file.  Then ignore the exlusions later when processing the files.
            for root, dirs, files in os.walk(item_path):
                for file in files:
                    if file != f"{item}.zip":
                        file_path = os.path.join(root, file)
                        relative_path = os.path.relpath(file_path, item_path).replace("\\","/")
                        print(relative_path)
                        if not any(excluded in relative_path.lower() for excluded in exclusion_list):
                            with open(log_file_path, "a") as log:
                                log.write("Added " + relative_path + f" - {datetime.now()}\n")
                            zip_list.append(relative_path)

            current_dir = os.getcwd()
            os.chdir(item_path)

            try:
                with open(log_file_path, "a") as log:
                    log.write(f"Zip command issued - {datetime.now()}\n")

                CREATE_NO_WINDOW = 0x08000000
                item_i = 0
                for file_path in zip_list:
                    command = [zip_app_path, "a", "-tzip", zip_path, file_path]
                    result = subprocess.run(command, capture_output=True, check=True, creationflags=CREATE_NO_WINDOW)
                    item_i += 1
                    progress = item_i / len(zip_list)
                    progress_item.after(0, progress_item.set, progress)

                    if result.returncode == 0:
                        try:
                            os.remove(file_path)
                            with open(log_file_path, "a") as log:
                                log.write(f"Deleted {file_path} - {datetime.now()}\n")
                        except:
                            with open(log_file_path, "a") as log:
                                log.write(f"Failed to delete {file_path} - {datetime.now()}\n")
                    else:
                        with open(log_file_path, "a") as log:
                            log.write(f"Failed to zip {file_path} - {datetime.now()}\n")
            finally:
                os.chdir(current_dir)

            delete_empty_folders(source_directory)
        else:
            with open(log_file_path, "a") as log:
                log.write(f"Skipping {item}, not a directory - {datetime.now()}\n")

    with open(log_file_path, "a") as log:
        log.write(f"=== Compression Completed - {datetime.now()} ===\n")
    btn_Compress.configure(state="normal")


# Setup for PyInstaller path handling
def resource_path(relative_path):
    """ Get absolute path to resource, works for dev and for PyInstaller bundle """
    try:
        # PyInstaller creates a temp folder and stores path in _MEIPASS
        base_path = sys._MEIPASS
    except AttributeError:
        base_path = os.path.dirname(os.path.abspath(__file__))

    return os.path.join(base_path, relative_path)

def source_directory():
    folder = filedialog.askdirectory()
    if folder:
        source_input.delete(0, tk.END)
        source_input.insert(0, folder)

def output_directory():
    folder = filedialog.askdirectory()
    if folder:
        output_input.delete(0, tk.END)
        output_input.insert(0, folder)

def check_event():
    if chkbox.get() == "on":
        output_btn.configure(state="normal")
        output_input.configure(state="normal")
    else:
        output_btn.configure(state="disabled")
        output_input.configure(state="disabled")

def delete_empty_folders(source_directory):
    for dirpath, dirnames, filenames in os.walk(source_directory, topdown=False):
        # Try to delete child folders first
        for dirname in dirnames:
            full_path = os.path.join(dirpath, dirname)
            if os.path.isdir(full_path):
                try:
                    os.rmdir(full_path)
                except OSError:
                    pass
        
        # After trying to delete children, try to delete current folder
        if not os.listdir(dirpath):
            try:
                os.rmdir(dirpath)
            except OSError:
                pass

# User Interface
app = ctk.CTk()  # create CTk window like you do with the Tk window
app.title("PyCompress")
app_dir = os.getcwd()
#app.wm_iconbitmap(app_dir+'\\PyCompress\\images\\app.ico')
frame_width = 600
frame_height = 350
app.geometry(str(frame_width)+'x'+str(frame_height))

# Source Directory
source_input = ctk.CTkEntry(app, placeholder_text="Folder to Compress (Source & Default Output)", width=frame_width*.5)
source_btn = ctk.CTkButton(master=app, text="Browse", command=source_directory, width=frame_width*.1)
source_input.place(relx=0.2, rely=0.2, anchor=ctk.W)
source_btn.place(relx=0.8, rely=0.2, anchor=ctk.CENTER)

# Output Directory - Only show if checkbox is checked.
check_var = ctk.StringVar(value="off")
chkbox = ctk.CTkCheckBox(app, text="Select different output directory", command=check_event, variable=check_var, onvalue="on", offvalue="off")
chkbox.place(relx=0.2, rely=0.3)

# Source Directory
output_input = ctk.CTkEntry(app, placeholder_text="Output directory", width=frame_width*.5, state="disabled")
output_btn = ctk.CTkButton(master=app, text="Browse", command=output_directory, width=frame_width*.1, state="disabled")
output_input.place(relx=0.2, rely=0.5, anchor=ctk.W)
output_btn.place(relx=0.8, rely=0.5, anchor=ctk.CENTER)

progress_item = ctk.CTkProgressBar(app, width=frame_width*.6, height=frame_height*.05)
progress_item.set(0)
progress_item.place(relx=0.2, rely=0.65)
progress_total = ctk.CTkProgressBar(app, width=frame_width*.6, height=frame_height*.05)
progress_total.set(0)
progress_total.place(relx=0.2, rely=0.75)

# Run compression
btn_Compress = ctk.CTkButton(master=app, text="Start", command=start_compress)
btn_Compress.place(relx=0.5, rely=0.9, anchor=ctk.CENTER)

app.mainloop()
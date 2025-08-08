import customtkinter as ctk
import tkinter as tk
from tkinter import filedialog
import os
import sys
import subprocess
import threading
import tempfile
from datetime import datetime

ctk.set_appearance_mode("system")
ctk.set_default_color_theme("green")

def start_compress():
    threading.Thread(target=compress_task, daemon=True).start()

def compress_task():
    btn_Compress.configure(state="disabled")
    source_directory = source_input.get()
    output_directory = output_input.get() if chkbox.get() == "on" else source_directory

    log_file_path = os.path.join(output_directory, "compression_log.txt")
    with open(log_file_path, "a") as log:
        log.write(f"\n=== Compression Initialized - {datetime.now()} ===\n")

    lbl_Status.configure(text="Getting directory list...")

    root_directory_list = os.listdir(source_directory)
    with open(log_file_path, "a") as log:
        log.write(f"Found {len(root_directory_list)} objects - {datetime.now()}\n")

    total_i = 0
    for item in root_directory_list:
        total_i += 1
        progress_total.after(0, progress_total.set, total_i / len(root_directory_list))
        lbl_ProgressTotalLabel.configure(text=f"Overall Progress: {total_i}/{len(root_directory_list)}")

        item_path = os.path.join(source_directory, item).replace("\\", "/")
        if os.path.isdir(item_path):
            with open(log_file_path, "a") as log:
                log.write(f"\nCompressing {item} - {datetime.now()}\n")

            zip_path = os.path.join(item_path, item + ".zip").replace("\\", "/")
            zip_app_path = os.path.abspath(resource_path(os.path.join("resources", "7zip", "7za.exe")))
            assert os.path.isfile(zip_app_path), f"7za.exe not found at: {zip_app_path}"

            exclusion_list = ["/xml", "/pdf"]
            zip_list = []

            for root, dirs, files in os.walk(item_path):
                lbl_Status.configure(text="Gathering file list...")
                for file in files:
                    if file != f"{item}.zip":
                        file_path = os.path.join(root, file)
                        relative_path = os.path.relpath(file_path, item_path).replace("\\", "/")
                        if not any(excluded in relative_path.lower() for excluded in exclusion_list):
                            with open(log_file_path, "a", encoding="utf-8") as log:
                                log.write("Added " + relative_path + f" - {datetime.now()}\n")
                            zip_list.append(relative_path)

            current_dir = os.getcwd()
            os.chdir(item_path)

            try:
                if zip_list:
                    lbl_Status.configure(text=f"Zipping {len(zip_list)} files...")
                    #progress_item.set(0)
                    #lbl_ProgressItemLabel.configure(text=f"Folder Progress: 0/{len(zip_list)}")

                    CREATE_NO_WINDOW = 0x08000000

                    # Create temporary list file to avoid Windows filename length limits
                    with tempfile.NamedTemporaryFile(mode="w", delete=False, suffix=".txt", encoding="utf-8") as listfile:
                        for rel_path in zip_list:
                            listfile.write(f'"{rel_path}"\n')
                        list_file_path = listfile.name

                    # Bulk zip using @listfile
                    command = [zip_app_path, "a", "-tzip", zip_path, f"@{list_file_path}"]
                    subprocess.run(command, capture_output=True, check=True, creationflags=CREATE_NO_WINDOW)

                    # Delete files after bulk zip
                    for idx, rel_path in enumerate(zip_list, 1):
                        full_path = os.path.join(item_path, rel_path)
                        try:
                            lbl_Status.configure(text=f"Deleting {rel_path}")
                            os.remove(full_path)
                            with open(log_file_path, "a", encoding="utf-8") as log:
                                log.write(f"Deleted {rel_path} - {datetime.now()}\n")
                        except Exception as e:
                            with open(log_file_path, "a", encoding="utf-8") as log:
                                log.write(f"Failed to delete {rel_path} ({e}) - {datetime.now()}\n")

                    # Clean up temp list file
                    try:
                        os.remove(list_file_path)
                    except OSError:
                        pass

            finally:
                os.chdir(current_dir)

            delete_empty_folders(source_directory)
        else:
            with open(log_file_path, "a") as log:
                log.write(f"Skipping {item}, not a directory - {datetime.now()}\n")

    with open(log_file_path, "a") as log:
        log.write(f"=== Compression Completed - {datetime.now()} ===\n")

    lbl_Status.configure(text="Complete")
    btn_Compress.configure(state="normal")

def resource_path(relative_path):
    try:
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
        for dirname in dirnames:
            full_path = os.path.join(dirpath, dirname)
            if os.path.isdir(full_path):
                try:
                    os.rmdir(full_path)
                except OSError:
                    pass
        if not os.listdir(dirpath):
            try:
                os.rmdir(dirpath)
            except OSError:
                pass

# UI setup
app = ctk.CTk()
app.title("PyCompress")
frame_width = 600
frame_height = 350
app.geometry(f"{frame_width}x{frame_height}")

# Source Directory
source_input = ctk.CTkEntry(app, placeholder_text="Folder to Compress (Source & Default Output)", width=frame_width*.5)
source_btn = ctk.CTkButton(master=app, text="Browse", command=source_directory, width=frame_width*.1)
source_input.place(relx=0.2, rely=0.1, anchor=ctk.W)
source_btn.place(relx=0.8, rely=0.1, anchor=ctk.CENTER)

# Output Directory selection
check_var = ctk.StringVar(value="off")
chkbox = ctk.CTkCheckBox(app, text="Select different output directory", command=check_event, variable=check_var, onvalue="on", offvalue="off")
chkbox.place(relx=0.2, rely=0.2)

output_input = ctk.CTkEntry(app, placeholder_text="Output directory", width=frame_width*.5, state="disabled")
output_btn = ctk.CTkButton(master=app, text="Browse", command=output_directory, width=frame_width*.1, state="disabled")
output_input.place(relx=0.2, rely=0.35, anchor=ctk.W)
output_btn.place(relx=0.8, rely=0.35, anchor=ctk.CENTER)

# Progress for total folders
lbl_ProgressTotalLabel = ctk.CTkLabel(app, text="Progress:")
lbl_ProgressTotalLabel.place(relx=0.2, rely=0.45, anchor=ctk.W)
progress_total = ctk.CTkProgressBar(app, width=frame_width*.6, height=frame_height*.05)
progress_total.set(0)
progress_total.place(relx=0.2, rely=0.5)

# Run compression
btn_Compress = ctk.CTkButton(master=app, text="Start", command=start_compress)
btn_Compress.place(relx=0.5, rely=0.75, anchor=ctk.CENTER)

lbl_Status = ctk.CTkLabel(master=app, width=frame_width*0.8, justify="center", text="")
lbl_Status.place(relx=0.5, rely=0.9, anchor=ctk.CENTER)

app.mainloop()
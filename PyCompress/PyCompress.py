import os
import subprocess
import tkinter as tk
from tkinter import filedialog, messagebox


def zip_folders_with_7zip(source_path, target_path):
    if not os.path.exists(source_path):
        messagebox.showerror("Error", f"Source path '{source_path}' does not exist.")
        return

    if not os.path.exists(target_path):
        os.makedirs(target_path)

    for item in os.listdir(source_path):
        item_path = os.path.join(source_path, item)

        if os.path.isdir(item_path):
            zip_file = os.path.join(target_path, f"{item}.7z")

            command = ["7z", "a", zip_file, item_path]

            try:
                subprocess.run(command, check=True)
            except subprocess.CalledProcessError as e:
                messagebox.showerror("Error", f"Failed to zip '{item}': {e}")
                return
            except FileNotFoundError:
                messagebox.showerror("Error", "7z command not found. Ensure 7-Zip is installed and added to the PATH.")
                return

    messagebox.showinfo("Success", "All folders have been zipped successfully!")


def browse_source():
    folder = filedialog.askdirectory()
    if folder:
        source_entry.delete(0, tk.END)
        source_entry.insert(0, folder)


def browse_target():
    folder = filedialog.askdirectory()
    if folder:
        target_entry.delete(0, tk.END)
        target_entry.insert(0, folder)


def run_zip():
    source_path = source_entry.get().strip()
    target_path = target_entry.get().strip()
    zip_folders_with_7zip(source_path, target_path)


# Create the main window
root = tk.Tk()
root.title("7-Zip Folder Compressor")

# Source directory
tk.Label(root, text="Source Directory:").grid(row=0, column=0, padx=10, pady=5, sticky="e")
source_entry = tk.Entry(root, width=50)
source_entry.grid(row=0, column=1, padx=10, pady=5)
tk.Button(root, text="Browse", command=browse_source).grid(row=0, column=2, padx=10, pady=5)

# Target directory
tk.Label(root, text="Target Directory:").grid(row=1, column=0, padx=10, pady=5, sticky="e")
target_entry = tk.Entry(root, width=50)
target_entry.grid(row=1, column=1, padx=10, pady=5)
tk.Button(root, text="Browse", command=browse_target).grid(row=1, column=2, padx=10, pady=5)

# Run button
tk.Button(root, text="Compress Folders", command=run_zip).grid(row=2, column=0, columnspan=3, pady=10)

# Start the application
root.mainloop()
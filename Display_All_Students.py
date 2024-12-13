import sqlite3
import tkinter as tk
from tkinter import messagebox, ttk
from tkinter import simpledialog
import Utility
class All_Students:
    def display_students(self, notebook):
        # Create the third tab for displaying all student names
        frame_all_students = ttk.Frame(notebook)
        notebook.add(frame_all_students, text="All Students")

        # Create a frame for the Text widget and scrollbars
        frame_all_result = tk.Frame(frame_all_students)
        frame_all_result.grid(row=0, column=0, padx=10, pady=10, sticky="nsew")

        # Configure the grid to make the Text widget resizable
        frame_all_students.grid_rowconfigure(0, weight=1)
        frame_all_students.grid_columnconfigure(0, weight=1)

        # Create the Text widget for displaying all student names
        all_students_text = tk.Text(frame_all_result, height=20, width=50, wrap="none")
        all_students_text.grid(row=0, column=0, sticky="nsew")

        # Make the Text widget read-only initially
        all_students_text.config(state=tk.DISABLED)

        # Create the scrollbars and attach them to the Text widget
        scrollbar_all_vertical = tk.Scrollbar(frame_all_result, orient="vertical", command=all_students_text.yview)
        scrollbar_all_vertical.grid(row=0, column=1, sticky="ns")
        all_students_text.config(yscrollcommand=scrollbar_all_vertical.set)

        scrollbar_all_horizontal = tk.Scrollbar(frame_all_result, orient="horizontal", command=all_students_text.xview)
        scrollbar_all_horizontal.grid(row=1, column=0, sticky="ew")
        all_students_text.config(xscrollcommand=scrollbar_all_horizontal.set)

        # Configure the frame to make the Text widget resizable
        frame_all_result.grid_rowconfigure(0, weight=1)
        frame_all_result.grid_columnconfigure(0, weight=1)

        # Display all students when the tab is selected
        notebook.bind("<<NotebookTabChanged>>", lambda event: All_Students.display_all_students(all_students_text) if notebook.index("current") == 2 else None)
        
    def display_all_students(all_students_text):
        conn = sqlite3.connect('University.db')
        cursor = conn.cursor()
        student_names = Utility.get_all_student_names(cursor)
        conn.close()

        all_students_text.config(state=tk.NORMAL)
        all_students_text.delete('1.0', tk.END)
        if student_names:
            for student in student_names:
                all_students_text.insert(tk.END, f"Student ID: {student[0]}\nFirst Name: {student[1]}\nLast Name: {student[2]}\n\n")
        else:
            all_students_text.insert(tk.END, "No students found.")
        all_students_text.config(state=tk.DISABLED)

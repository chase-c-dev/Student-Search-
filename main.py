import sqlite3
import tkinter as tk
from tkinter import ttk
import Enroll_Student_tab
import Search_Student_tab
import Display_All_Students
import Student_Drop

def load_sql_file(cursor, sql_file_path):
    with open(sql_file_path, 'r') as sql_file:
        sql_script = sql_file.read()
    cursor.executescript(sql_script)

# Create the main window
root = tk.Tk()
root.title("Student Information")

# Create a Notebook widget
notebook = ttk.Notebook(root)
notebook.pack(fill='both', expand=True)

#First tab 
search_student_tab= Search_Student_tab.Search_Student()
search_student_tab.search(notebook)

#second tab
enroll_student_tab = Enroll_Student_tab.Enroll_Student()
enroll_student_tab.enroll(notebook)

#third tab
display_all_students_tab = Display_All_Students.All_Students()
display_all_students_tab.display_students(notebook)

#fourth tab
app = Student_Drop.Remove_Student(notebook)

# Run the Tkinter event loop
root.mainloop()





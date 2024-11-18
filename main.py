import sqlite3
import tkinter as tk
from tkinter import messagebox, ttk

def load_sql_file(cursor, sql_file_path):
    with open(sql_file_path, 'r') as sql_file:
        sql_script = sql_file.read()
    cursor.executescript(sql_script)

def get_student_info_by_name(cursor, first_name, last_name):
    cursor.execute("""
    SELECT Student.StudentId, Student.FirstName, Student.LastName, Student.Age, Student.Major, Course.CourseName, Enrollment.Grade, Professor.FirstName, Professor.LastName
    FROM Student
    LEFT JOIN Enrollment ON Student.StudentId = Enrollment.StudentId
    LEFT JOIN Course ON Enrollment.CourseId = Course.CourseId
    LEFT JOIN Professor ON Course.ProfessorId = Professor.ProfessorId
    WHERE Student.FirstName = ? AND Student.LastName = ?
    """, (first_name, last_name))
    return cursor.fetchall()

def get_all_student_names(cursor):
    cursor.execute("SELECT StudentId, FirstName, LastName FROM Student")
    return cursor.fetchall()

def search_student():
    first_name = entry_first_name.get()
    last_name = entry_last_name.get()
    if not first_name or not last_name:
        messagebox.showwarning("Input Error", "Please enter both first and last names.")
        return

    conn = sqlite3.connect('university.db')
    cursor = conn.cursor()
    student_info = get_student_info_by_name(cursor, first_name, last_name)
    conn.close()

    if student_info:
        result_text.config(state=tk.NORMAL)
        result_text.delete('1.0', tk.END)
        result_text.insert(tk.END, f"Student ID: {student_info[0][0]}\nFirst Name: {student_info[0][1]}\nLast Name: {student_info[0][2]}\nAge: {student_info[0][3]}\nMajor: {student_info[0][4]}\n\n")
        for row in student_info:
            result_text.insert(tk.END, f"Course: {row[5]}\nGrade: {row[6]}\nInstructor: {row[7]} {row[8]}\n\n")
        result_text.config(state=tk.DISABLED)
    else:
        messagebox.showinfo("No Results", "No student found with the given name.")

def display_all_students():
    conn = sqlite3.connect('university.db')
    cursor = conn.cursor()
    student_names = get_all_student_names(cursor)
    conn.close()

    all_students_text.config(state=tk.NORMAL)
    all_students_text.delete('1.0', tk.END)
    if student_names:
        for student in student_names:
            all_students_text.insert(tk.END, f"Student ID: {student[0]}\nFirst Name: {student[1]}\nLast Name: {student[2]}\n\n")
    else:
        all_students_text.insert(tk.END, "No students found.")
    all_students_text.config(state=tk.DISABLED)

# Create the main window
root = tk.Tk()
root.title("Student Information")

# Create a Notebook widget
notebook = ttk.Notebook(root)
notebook.pack(fill='both', expand=True)

# Create the first tab for searching student information by name
frame_search = ttk.Frame(notebook)
notebook.add(frame_search, text="Search Student")

# Create and place the labels and entries for the first and last names
label_first_name = tk.Label(frame_search, text="First Name:")
label_first_name.grid(row=0, column=0, padx=10, pady=10, sticky="e")
entry_first_name = tk.Entry(frame_search)
entry_first_name.grid(row=0, column=1, padx=10, pady=10, sticky="w")

label_last_name = tk.Label(frame_search, text="Last Name:")
label_last_name.grid(row=1, column=0, padx=10, pady=10, sticky="e")
entry_last_name = tk.Entry(frame_search)
entry_last_name.grid(row=1, column=1, padx=10, pady=10, sticky="w")

# Create and place the search button
search_button = tk.Button(frame_search, text="Search", command=search_student)
search_button.grid(row=2, column=0, columnspan=2, padx=10, pady=10)

# Create a frame for the Text widget and scrollbars
frame_result = tk.Frame(frame_search)
frame_result.grid(row=3, column=0, columnspan=2, padx=10, pady=10, sticky="nsew")

# Configure the grid to make the Text widget resizable
frame_search.grid_rowconfigure(3, weight=1)
frame_search.grid_columnconfigure(1, weight=1)

# Create the Text widget for displaying results
result_text = tk.Text(frame_result, height=10, width=50, wrap="none")
result_text.grid(row=0, column=0, sticky="nsew")

# Make the Text widget read-only initially
result_text.config(state=tk.DISABLED)

# Create the scrollbars and attach them to the Text widget
scrollbar_vertical = tk.Scrollbar(frame_result, orient="vertical", command=result_text.yview)
scrollbar_vertical.grid(row=0, column=1, sticky="ns")
result_text.config(yscrollcommand=scrollbar_vertical.set)

scrollbar_horizontal = tk.Scrollbar(frame_result, orient="horizontal", command=result_text.xview)
scrollbar_horizontal.grid(row=1, column=0, sticky="ew")
result_text.config(xscrollcommand=scrollbar_horizontal.set)

# Configure the frame to make the Text widget resizable
frame_result.grid_rowconfigure(0, weight=1)
frame_result.grid_columnconfigure(0, weight=1)

# Create the second tab for displaying all student names
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
notebook.bind("<<NotebookTabChanged>>", lambda event: display_all_students() if notebook.index("current") == 1 else None)

# Run the Tkinter event loop
root.mainloop()





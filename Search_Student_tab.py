import sqlite3
import tkinter as tk
from tkinter import messagebox, ttk
from tkinter import simpledialog
import Utility

class Search_Student:
    def __init__(self):
        self.entry_last_name = None
        self.entry_first_name = None
        self.result_text = None
    
    def search(self, notebook):
        # Create the first tab for searching student information by name
        frame_search = ttk.Frame(notebook)
        notebook.add(frame_search, text="Search Student")

        # Create and place the labels and entries for the first and last names
        label_first_name = tk.Label(frame_search, text="First Name:")
        label_first_name.grid(row=0, column=0, padx=10, pady=10, sticky="e")
        self.entry_first_name = tk.Entry(frame_search)
        self.entry_first_name.grid(row=0, column=1, padx=10, pady=10, sticky="w")

        label_last_name = tk.Label(frame_search, text="Last Name:")
        label_last_name.grid(row=1, column=0, padx=10, pady=10, sticky="e")
        self.entry_last_name = tk.Entry(frame_search)
        self.entry_last_name.grid(row=1, column=1, padx=10, pady=10, sticky="w")

        # Create and place the search button
        search_button = tk.Button(frame_search, text="Search", command=lambda: Search_Student.search_student(self))
        search_button.grid(row=2, column=1, columnspan=2, padx=10, pady=10, sticky='w')

        # Create and place the Update Grade button
        update_button = tk.Button(frame_search, text="Update Grade", command=lambda: Search_Student.update_grade(self))
        update_button.grid(row=2, column=1, columnspan=2, padx=10, pady=10)
        
        # Create a frame for the Text widget and scrollbars
        frame_result = tk.Frame(frame_search)
        frame_result.grid(row=3, column=0, columnspan=2, padx=10, pady=10, sticky="nsew")

        # Configure the grid to make the Text widget resizable
        frame_search.grid_rowconfigure(3, weight=1)
        frame_search.grid_columnconfigure(1, weight=1)

        # Create the Text widget for displaying results
        self.result_text = tk.Text(frame_result, height=10, width=50, wrap="none")
        self.result_text.grid(row=0, column=0, sticky="nsew")

        # Make the Text widget read-only initially
        self.result_text.config(state=tk.DISABLED)

        # Create the scrollbars and attach them to the Text widget
        scrollbar_vertical = tk.Scrollbar(frame_result, orient="vertical", command=self.result_text.yview)
        scrollbar_vertical.grid(row=0, column=1, sticky="ns")
        self.result_text.config(yscrollcommand=scrollbar_vertical.set)

        scrollbar_horizontal = tk.Scrollbar(frame_result, orient="horizontal", command=self.result_text.xview)
        scrollbar_horizontal.grid(row=1, column=0, sticky="ew")
        self.result_text.config(xscrollcommand=scrollbar_horizontal.set)

        # Configure the frame to make the Text widget resizable
        frame_result.grid_rowconfigure(0, weight=1)
        frame_result.grid_columnconfigure(0, weight=1)
        
        
    def search_student(self):
        first_name = self.entry_first_name.get()
        last_name = self.entry_last_name.get()
        
        if not first_name or not last_name:
            messagebox.showwarning("Input Error", "Please enter both first and last names.")
            return

        conn = sqlite3.connect('University.db')
        cursor = conn.cursor()
        student_info = Utility.get_student_info_by_name(cursor, first_name, last_name)
        conn.close()
        if student_info:
            result_text = self.result_text
            result_text.config(state=tk.NORMAL)
            result_text.delete('1.0', tk.END)
            result_text.insert(tk.END, f"Student ID: {student_info[0][0]}\nFirst Name: {student_info[0][1]}\nLast Name: {student_info[0][2]}\nEnrollment Age: {student_info[0][3]}\nMajor: {student_info[0][4]}\n\n")
            for row in student_info:
                result_text.insert(tk.END, f"EnrollmentID: {row[10]}\nCourseID: {row[9]}\nCourse: {row[5]}\nGrade: {row[6]}\nInstructor: {row[7]} {row[8]}\n\n")
            result_text.config(state=tk.DISABLED)
        else:
            messagebox.showinfo("No Results", "No student found with the given name.")
            
    def update_grade(self):
        result_text = self.result_text
        first_name = self.entry_first_name.get()
        last_name = self.entry_last_name.get()
        if not first_name or not last_name:
            messagebox.showwarning("Input Error", "Please enter both first and last names.")
            return
        
        conn = sqlite3.connect('University.db')
        cursor = conn.cursor()
        student_info = Utility.get_student_info_by_name_v2(cursor, first_name, last_name)
        if not student_info:
            messagebox.showinfo("No Results", "No student found with the given name.")
            conn.close()
            return 
        #If only 1 student is returned from name search then that is the student we want
        if len(student_info) > 1:
             # Get input for major
            messagebox.showinfo("Too Many Students", f"We found more than one student with same name. Please enter student id and choose a student.")
            student_ID = simpledialog.askinteger("Input", "Enter Student ID:")
            if student_ID is None:  # User pressed Cancel
                conn.close()
                return
        else:
            student_ID = student_info[0][0]
        
        course_id = simpledialog.askinteger("Input", "Enter Course ID:")
        course_info = Utility.get_course_info_by_course_id(cursor, course_id)
        if course_id is None:
            messagebox.showerror("Error", f"Please insert course id of the course you want to update grade for.")
            conn.close()
            return
        #check if given course id does not exist
        if not course_info:
            messagebox.showerror("Error", f"Course could not be found please enter a valid Course ID.")
            conn.close()
            return
        #check if student is already enrolled in given course
        if Utility.is_student_enrolled(cursor, student_ID, course_id):
            new_grade = simpledialog.askstring("Input", "Enter new Grade:")
            #Check if given grade is in correct formate
            if new_grade is None:
                messagebox.showerror("Error", f"Please insert a grade.")
                conn.close()
                return 
            if (not new_grade in ["N/A", "A-", "A", "A+", "B-", "B", "B+", "C-", "C", "C+","D-", "D", "D+", "F"]):
                messagebox.showerror("Error",f"Given grade is not valid. Please choose from the following valid grades:\nN/A, A-, A, A+, B-, B, B+, C-, C, C+, D- , D , D+, F")
                conn.close()
                return
            Utility.update_student_grade(student_id=student_ID, course_id=course_id, new_grade=new_grade)
            result_text.config(state=tk.NORMAL)
            result_text.delete('1.0', tk.END)
            result_text.insert(tk.END, f"{first_name} {last_name}'s grade in {course_info[0][1]} is updated to {new_grade}\n")
            result_text.config(state=tk.DISABLED)
        else:
            messagebox.showerror("Error", f"Student is not enrolled in {course_info[0][1]}!")
            conn.close()
            return
            
        
        